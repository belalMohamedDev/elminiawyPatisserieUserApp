import 'package:elminiawy/core/common/shared/shared_imports.dart';

class CategoryloadingScreenWidget extends StatelessWidget {
  const CategoryloadingScreenWidget({
    super.key,required this.isCategoryCartToAdmin
  });
  final bool isCategoryCartToAdmin;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Padding(
      padding: responsive.setPadding(left: 5, right: 5,top:  AppInitialRoute.role == "admin" && isCategoryCartToAdmin == false
              ? 2
              : 5 ),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.7,
        children: List.generate(
          12,
          (index) => Column(
            children: [
              LoadingShimmer(
                height: responsive.setHeight(10),
                width: responsive.setWidth(25),
                borderRadius: responsive.setBorderRadius(2),
              ),
              responsive.setSizeBox(height: 2),
              LoadingShimmer(
                width: responsive.setWidth(12),
                height: responsive.setHeight(0.5),
                borderRadius: responsive.setBorderRadius(2),
              ),
              responsive.setSizeBox(height: 1),
              LoadingShimmer(
                width: responsive.setWidth(8),
                height: responsive.setHeight(0.5),
                borderRadius: responsive.setBorderRadius(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
