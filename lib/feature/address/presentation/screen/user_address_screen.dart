


import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.myAddress,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
          
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          BlocBuilder<UserAddressCubit, UserAddressState>(
            builder: (context, state) {
              return context.read<UserAddressCubit>().addressDataList.isEmpty ||
                      state is GetAllAddressLoading
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(right: 15.w),
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
        padding: EdgeInsets.only(left: 20.w, top: 10.h),
        child: const UserAddressBody(),
      ),
    );
  }
}
