import 'package:elminiawy/core/common/shared/shared_imports.dart';

class GetProductLoadingWidget extends StatelessWidget {
  const GetProductLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
            padding: responsive.setPadding(bottom: 1, left: 2.5, right: 2.5),
            child: Container(
              width: double.infinity,
              height: responsive.setHeight(9),
              decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(3)),
              ),
              child: Row(
                children: [
                  responsive.setSizeBox(width: 2.5),
                  LoadingShimmer(
                    baseColor: ColorManger.brown,
                    highlightColor: ColorManger.brownLight,
                    height: responsive.setHeight(7),
                    width: responsive.setWidth(18),
                    borderRadius: responsive.setBorderRadius(3),
                  ),
                  responsive.setSizeBox(width: 3),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoadingShimmer(
                        baseColor: ColorManger.brown,
                        highlightColor: ColorManger.brownLight,
                        height: responsive.setHeight(1),
                        width: responsive.setWidth(60),
                        borderRadius: responsive.setBorderRadius(3),
                      ),
                      responsive.setSizeBox(height: 1),
                      LoadingShimmer(
                        baseColor: ColorManger.brown,
                        highlightColor: ColorManger.brownLight,
                        height: responsive.setHeight(1),
                        width: responsive.setWidth(50),
                        borderRadius: responsive.setBorderRadius(3),
                      ),
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
