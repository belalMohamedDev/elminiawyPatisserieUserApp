import 'package:elminiawy/core/common/shared/shared_imports.dart';

class BannersShimmerLoadingBody extends StatelessWidget {
  const BannersShimmerLoadingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index) {
        return Padding(
          padding: responsive.setPadding(bottom: 1, left: 2, right: 2),
          child: Container(
            decoration: BoxDecoration(
                color: ColorManger.backgroundItem,
                borderRadius:
                    BorderRadius.circular(responsive.setBorderRadius(3))),
            child: ListTile(
              contentPadding: responsive.setPadding(
                left: 3.5,
                right: 3.5,
              ),
              leading: LoadingShimmer(
                width: responsive.setWidth(18),
                borderRadius: responsive.setBorderRadius(1.5),
              ),
              title: LoadingShimmer(
                height: responsive.setHeight(0.7),
                borderRadius: responsive.setBorderRadius(1.5),
              ),
              subtitle: LoadingShimmer(
                height: responsive.setHeight(0.5),
                borderRadius: responsive.setBorderRadius(1.5),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoadingShimmer(
                    height: responsive.setHeight(3),
                    borderRadius: responsive.setBorderRadius(1.5),
                  ),
                  responsive.setSizeBox(width: 3),
                  LoadingShimmer(
                    height: responsive.setHeight(3),
                    borderRadius: responsive.setBorderRadius(1.5),
                  ),
                  responsive.setSizeBox(width: 3),
                  LoadingShimmer(
                    height: responsive.setHeight(3),
                    borderRadius: responsive.setBorderRadius(1.5),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
