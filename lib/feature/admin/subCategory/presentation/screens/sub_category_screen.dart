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
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManger.brun,
        onPressed: () {
          showEditAndCreateSubCategoryDialog(
              context,
              null,
              context.read<SubCategoriesCubit>(),
              context.read<CategoryCubit>());
        },
        child: Icon(
          Icons.add,
          color: ColorManger.white,
        ),
      ),
      body: BlocBuilder<SubCategoriesCubit, SubCategoriesState>(
        builder: (context, state) {
          final subCategories =
              context.read<SubCategoriesCubit>().subCategories;
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: responsive.setPadding(top: 1),
                  child: Column(
                    children: [
                      SubCategoryTable(
                          subCategories: subCategories, state: state),
                      responsive.setSizeBox(height: 3),
                      if (state is GetSubCategoriesLoading ||
                          state is GetSubCategoriesError)
                        CircularProgressIndicator(
                          color: ColorManger.brun,
                        ),
                    ],
                  ),
                ),
              ),
              LoadingOverlay(isLoading: state is CreateSubCategoriesLoading)
            ],
          );
        },
      ),
    );
  }
}
