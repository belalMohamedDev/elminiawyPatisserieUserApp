import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.translate(AppStrings.myAddress),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 16.sp)),
        actions: [
          BlocBuilder<UserAddressCubit, UserAddressState>(
            builder: (context, state) {
              return context.read<UserAddressCubit>().addressDataList.isEmpty ||
                      state is GetAllAddressLoading
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(
                          right: isEnLocale ? 15.w : 0,
                          left: isEnLocale ? 0 : 18.w),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: !false)
                                .pushNamed(Routes.map);
                          },
                          child: Image.asset(
                            ImageAsset.addLocation,
                            height: 22.h,
                          )),
                    );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: isEnLocale ? 20.w : 0,
            right: isEnLocale ? 0 : 20.w,
            top: 10.h),
        child: const UserAddressBody(),
      ),
    );
  }
}
