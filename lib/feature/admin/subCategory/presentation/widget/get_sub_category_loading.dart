import '../../../../../core/common/shared/shared_imports.dart';

class GetSubCategoryDataLoading extends StatelessWidget {
  const GetSubCategoryDataLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: const EdgeInsets.all(18),
        children: List.generate(8, (index) {
          return const GetSubCategoryDataLoadingBodyWidget();
        }));
  }
}

class GetSubCategoryDataLoadingBodyWidget extends StatelessWidget {
  const GetSubCategoryDataLoadingBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFf6efe7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: responsive.setHeight(1.2)),
          LoadingShimmer(
            height: responsive.setHeight(8),
            width: responsive.setWidth(25),
            borderRadius: responsive.setBorderRadius(2),
          ),
          SizedBox(height: responsive.setHeight(2.5)),
          LoadingShimmer(
            height: responsive.setHeight(0.7),
            width: responsive.setWidth(20),
            borderRadius: responsive.setBorderRadius(2),
          ),
          SizedBox(height: responsive.setHeight(0.8)),
          LoadingShimmer(
            height: responsive.setHeight(0.7),
            width: responsive.setWidth(15),
            borderRadius: responsive.setBorderRadius(2),
          ),
          SizedBox(height: responsive.setHeight(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingShimmer(
                height: responsive.setHeight(5),
                width: responsive.setWidth(12),
                borderRadius: responsive.setBorderRadius(3),
              ),
              SizedBox(width: responsive.setWidth(8)),
              LoadingShimmer(
                height: responsive.setHeight(5),
                width: responsive.setWidth(12),
                borderRadius: responsive.setBorderRadius(3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
