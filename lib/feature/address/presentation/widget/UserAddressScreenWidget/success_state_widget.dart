import '../../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class UserAddressSuccessStateWidget extends StatelessWidget {
 final UserAddressCubit userAddress;
  const UserAddressSuccessStateWidget({
    super.key, required this.userAddress,
  });

  @override
  Widget build(BuildContext context) {
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;


    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        itemCount: userAddress.addressDataList.length + 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == userAddress.addressDataList.length)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomButton(
                    onPressed: () {
                      context.pushNamed(Routes.map);
                    },
                    widget: Text(
                      context.translate(AppStrings.addNewAddress),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 14.sp),
                    ),
                  ),
                )
              else
                SizedBox(
                  height: 80.h,
                  child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SizedBox(
                            width: 8.w,
                          ),
                          SlidableAction(
                            onPressed: (_) {
                              userAddress.deleteUserAddress(
                                  userAddress.addressDataList[index].sId!);
                            },
                            backgroundColor: ColorManger.redError,
                            foregroundColor: ColorManger.white,
                            icon: IconlyBold.delete,
                            borderRadius: BorderRadius.circular(10.r),
                            label: context.translate(AppStrings.delete),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SlidableAction(
                            onPressed: (context) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider.value(
                                        value: instance<UserAddressCubit>(),
                                      ),
                                      BlocProvider.value(
                                        value: instance<MapCubit>(),
                                      ),
                                    ],
                                    child: AddNewAddressScreen(
                                      getAddressResponseData:
                                          userAddress.addressDataList[index],
                                    ),
                                  ),
                                ),
                              );
                            },
                            backgroundColor: ColorManger.backgroundItem,
                            foregroundColor: ColorManger.brown,
                            icon: IconlyBold.edit,
                            borderRadius: BorderRadius.circular(10.r),
                            label: context.translate(AppStrings.edit),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManger.backgroundItem,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 16.h,
                                right: isEnLocale ? 0 : 10.w,
                                left: isEnLocale ? 10.w : 0,
                              ),
                              child: Image.asset(
                                userAddress.addressDataList[index].alias ==
                                        'Apartment'
                                    ? ImageAsset.building
                                    : userAddress
                                                .addressDataList[index].alias ==
                                            'House'
                                        ? ImageAsset.home
                                        : ImageAsset.bag,
                                height: 28.h,
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isEnLocale
                                      ? userAddress
                                          .addressDataList[index].alias!
                                      : (userAddress.addressDataList[index]
                                                  .alias ==
                                              'Apartment'
                                          ? "شقة"
                                          : userAddress.addressDataList[index]
                                                      .alias ==
                                                  'House'
                                              ? "منزل"
                                              : "مكتب"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: isEnLocale ? 280.w : 250.w),
                                  child: Text(
                                    userAddress.addressDataList[index].region ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: ColorManger.grey,
                                            fontSize: 11.sp),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  " ${userAddress.addressDataList[index].buildingName!}  |  ${userAddress.addressDataList[index].phone!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 11.sp),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              SizedBox(
                height: 15.h,
              )
            ],
          );
        },
      ),
    );
  }
}
