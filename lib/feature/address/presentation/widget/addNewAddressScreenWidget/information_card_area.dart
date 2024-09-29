

import '../../../../../core/common/shared/shared_imports.dart'; // Import the barrel file


class InformationCardArea extends StatelessWidget {
  const InformationCardArea({
    super.key,
    required this.getAddressResponseData,
  });

  final GetAddressResponseData? getAddressResponseData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final mapCuibt = context.read<MapCubit>();
        String regionAddress = '';

        if (mapCuibt.checkLocationAvailableResponse != null &&
            mapCuibt.checkLocationAvailableResponse!.address != null) {
          regionAddress = mapCuibt.checkLocationAvailableResponse!.address!;
        } else if (getAddressResponseData != null &&
            getAddressResponseData!.region != null) {
          regionAddress = getAddressResponseData!.region!;
        } else {
          regionAddress = 'Unknown Region';
        }

        return Card(
          elevation: 1.8,
          shadowColor: ColorManger.brownLight,
          child: Container(
            height: 55.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: ColorManger.white,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        top: 12.h,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconlyBold.location,
                            size: 18.sp,
                            color: ColorManger.brun,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Area",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontFamily: FontConsistent.fontFamilyAcme,
                                      color: ColorManger.brun,
                                      fontSize: 12.sp)),
                        ],
                      ),
                    ),
                    //   mapCubit.checkLocationAvailableResponse!.address =

                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 5.h),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 250.w),
                        child: Text(regionAddress,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontFamily: FontConsistent.fontFamilyAcme,
                                    color: ColorManger.brunLight,
                                    fontSize: 10.sp)),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 20.w, top: 2.h),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: instance<MapCubit>(),
                            child: const MapScreen(
                              isUpdateMap: true,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text("Change",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: FontConsistent.fontFamilyAcme,
                            color: ColorManger.brun,
                            fontSize: 13.sp)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
