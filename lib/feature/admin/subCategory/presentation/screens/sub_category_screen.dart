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
    context.read<CategoryCubit>().getCategories();
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
                    showCheckboxColumn: false,
                    columnSpacing: responsive.setWidth(0),
                    horizontalMargin: responsive.setWidth(5),
                    headingRowColor: WidgetStateProperty.all(Colors.grey[200]),
                    border: TableBorder(
                      bottom: BorderSide(color: Colors.grey[400]!, width: 1),
                      top: BorderSide(color: Colors.grey[400]!, width: 0.5),
                    ),
                    columns: [
                      DataColumn(
                        label: responsive.setSizeBox(
                          width: 39,
                          child: Text(
                            context.translate(AppStrings.title),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: responsive.setTextSize(4),
                                ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: responsive.setSizeBox(
                          width: 40,
                          child: Text(
                            context.translate(AppStrings.category),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: responsive.setTextSize(3.8),
                                ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: responsive.setSizeBox(
                          width: 12,
                          child: Icon(
                            Icons.check_circle,
                            color: ColorManger.brun,
                          ),
                        ), // Icon column for Active/Inactive action
                      ),
                    ],
                    rows: [
                      DataRow(
                        onSelectChanged: (_) {
                          showEditAndCreateSubCategoryDialog(
                              context,
                         
                              null,
                              context.read<SubCategoriesCubit>(),
                              context.read<CategoryCubit>());
                        },
                        cells: [
                          DataCell(Container()), //
                          DataCell(
                            Text(
                              context.translate(AppStrings.addNew),
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily:
                                    FontConsistent.geLocalozedFontFamily(),
                                fontSize: responsive.setTextSize(4),
                              ),
                            ),
                          ),
                          DataCell(Container()),
                        ],
                      ),
                      ...subCategories.map((item) {
                        final hasCategory = item.category?.title != null;
                        return DataRow(
                          onSelectChanged: (_) {
                            showEditSubCategoryActionDialog(
                              context,
                              item,
                            );
                          },
                          cells: [
                            DataCell(
                              responsive.setSizeBox(
                                width: 39,
                                child: Text(
                                  item.title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: responsive.setTextSize(3.8),
                                      ),
                                ),
                              ),
                            ),
                            DataCell(
                              responsive.setSizeBox(
                                  width: 40,
                                  child: state is UpdateSubCategoriesLoading &&
                                          state.id == item.sId
                                      ? Center(
                                          child: Padding(
                                            padding: responsive.setPadding(
                                                left: 0,
                                                right: 20,
                                                top: 1.5,
                                                bottom: 1.5),
                                            child: CircularProgressIndicator(
                                              color: Colors.grey,
                                              strokeWidth:
                                                  responsive.setWidth(0.8),
                                            ),
                                          ),
                                        )
                                      : Text(
                                          item.category?.title ??
                                              context.translate(
                                                  AppStrings.notAssigned),
                                          style: TextStyle(
                                            color: hasCategory
                                                ? ColorManger.brun
                                                : ColorManger.redError,
                                            fontSize:
                                                responsive.setTextSize(3.8),
                                            fontFamily: FontConsistent
                                                .geLocalozedFontFamily(),
                                          ),
                                        )),
                            ),
                            DataCell(
                              responsive.setSizeBox(
                                  width: 12,
                                  child: state is DeleteSubCategoriesLoading &&
                                          state.id == item.sId
                                      ? Padding(
                                          padding: responsive.setPadding(
                                              left: 2,
                                              right: 2,
                                              top: 1,
                                              bottom: 1),
                                          child: CircularProgressIndicator(
                                            color: Colors.grey,
                                            strokeWidth:
                                                responsive.setWidth(0.8),
                                          ),
                                        )
                                      : Icon(
                                          item.active == true
                                              ? Icons.check_circle
                                              : Icons.cancel,
                                          color: item.active == true
                                              ? Colors.green
                                              : Colors.grey,
                                        )),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),

                  //

                  responsive.setSizeBox(height: 3),
                  if (state is GetSubCategoriesLoading ||
                      state is GetSubCategoriesError)
                    CircularProgressIndicator(
                      color: ColorManger.brun,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
