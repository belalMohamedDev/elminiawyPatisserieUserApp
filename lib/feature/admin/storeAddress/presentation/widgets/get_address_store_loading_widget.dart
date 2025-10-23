import '../../../../../core/common/shared/shared_imports.dart';

class GetAddressStoreLoadingWidget extends StatelessWidget {
  const GetAddressStoreLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return Column(
      children: [
        Container(
          margin: responsive.setMargin(left: 5, right: 5, bottom: 1.5),
          decoration: BoxDecoration(
            color: ColorManger.backgroundItem,
            borderRadius: BorderRadius.circular(responsive.setBorderRadius(3)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: responsive.setWidth(3),
              vertical: responsive.setHeight(0.5),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoadingShimmer(
                  width: responsive.setWidth(25),
                  height: responsive.setHeight(2),
                  borderRadius: 8.r,
                ),
                Switch.adaptive(
                  value: false,
                  onChanged: (val) {},
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green.shade400,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: responsive.setHeight(0.5)),
              child: LoadingShimmer(
                width: responsive.setWidth(30),
                height: responsive.setHeight(1.8),
                borderRadius: 8.r,
              ),
            ),
          ),
        ),
        SizedBox(
          height: responsive.setHeight(0.8),
        )
      ],
    );
  }
}
