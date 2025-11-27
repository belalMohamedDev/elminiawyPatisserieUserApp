import 'package:elminiawy/core/common/shared/shared_imports.dart';

class EmptySubCategoryScreen extends StatelessWidget {
  const EmptySubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              ImageAsset.noCategory,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        ErrorInfo(
          title: context.translate(AppStrings.emptyCategory),
          description:
              context.translate(AppStrings.noProductsFoundInThisCategory),
          press: () {},
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }
}
