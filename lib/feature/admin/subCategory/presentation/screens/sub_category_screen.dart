import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminSubCategoryScreen extends StatefulWidget {
  const AdminSubCategoryScreen({super.key});

  @override
  State<AdminSubCategoryScreen> createState() => _AdminSubCategoryScreenState();
}

class _AdminSubCategoryScreenState extends State<AdminSubCategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SubCategoriesCubit>().fetchGetSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate(AppStrings.subCategory),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          final subCategories =
              context.read<SubCategoriesCubit>().subCategories;
          return SingleChildScrollView(
            child: Padding(
              padding: responsive.setPadding(top: 1),
              child: Column(
                children: [
                  DataTable(
                    columnSpacing: responsive.setWidth(0),
                    horizontalMargin: responsive.setWidth(4),
                    headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
                    border: TableBorder(
                      bottom: BorderSide(color: Colors.grey[400]!, width: 1),
                    ),
                    columns: [
                      DataColumn(
                          label: responsive.setSizeBox(
                        width: 34,
                        child: Text(
                          context.translate(AppStrings.subCategory),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: responsive.setTextSize(3.5)),
                        ),
                      )),
                      DataColumn(
                          label: responsive.setSizeBox(
                        width: 37,
                        child: Text(
                          context.translate(AppStrings.category),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: responsive.setTextSize(3.5)),
                        ),
                      )),
                      DataColumn(
                          label: responsive.setSizeBox(
                        width: 25,
                        child: Padding(
                          padding: responsive.setPadding(left: 7),
                          child: Text(
                            context.translate(AppStrings.actions),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: responsive.setTextSize(3.5)),
                          ),
                        ),
                      )),
                    ],
                    rows: subCategories.map((item) {
                      final hasCategory = item.category?.title != null;
                      return DataRow(
                        cells: [
                          DataCell(responsive.setSizeBox(
                            width: 34,
                            child: Text(
                              item.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: responsive.setTextSize(3.5)),
                            ),
                          )),
                          DataCell(
                            responsive.setSizeBox(
                              width: 37,
                              child: Text(
                                item.category?.title ??
                                    context.translate(AppStrings.notAssigned),
                                style: TextStyle(
                                    color: hasCategory
                                        ? ColorManger.brun
                                        : ColorManger.redError,
                                    fontSize: responsive.setTextSize(3.5),
                                    fontFamily:
                                        FontConsistent.geLocalozedFontFamily()),
                              ),
                            ),
                          ),
                          DataCell(
                            responsive.setSizeBox(
                              width: 25,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: item.active == true
                                          ? Colors.green
                                          : ColorManger.redError,
                                      size: responsive.setIconSize(5.5),
                                    ),
                                    onPressed: () {
                                      // Action to edit
                                      _editItem(context, item);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: ColorManger.redError,
                                      size: responsive.setIconSize(5.5),
                                    ),
                                    onPressed: () {
                                      // Action to delete
                                      _deleteItem(context, item);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  responsive.setSizeBox(height: 3),
                  if (state is GetSubCategoriesLoading ||
                      state is GetSubCategoriesError)
                    CircularProgressIndicator(
                      color: ColorManger.brun,
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _editItem(BuildContext context, SubCategoryResponseData item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${item.title}')),
    );
  }

  void _deleteItem(BuildContext context, SubCategoryResponseData item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Item"),
        content: Text("Are you sure you want to delete ${item.title}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.title} deleted')),
              );
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
