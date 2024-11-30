import 'package:elminiawy/feature/client/category/presentation/widget/category_loading_screen_widget.dart';
import 'package:elminiawy/feature/client/category/presentation/widget/category_success_widget.dart';

import '../../../../../core/common/shared/shared_imports.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    if (AppInitialRoute.role == "admin") {
      context.read<CategoryCubit>().getCategories();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppInitialRoute.role == "admin"
            ? Text(context.translate(AppStrings.category),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16.sp))
            : null,
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetCategoriesLoading || state is GetCategoriesError) {
            return const CategoryloadingScreenWidget();
          }

          return Stack(
            children: [
              CategorySuccessWidget(categoryState: state),
              LoadingOverlay(isLoading: state is CreateCategoriesLoading)
            ],
          );
        },
      ),
    );
  }
}





