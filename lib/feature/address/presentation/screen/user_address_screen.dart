import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class UserAddressView extends StatelessWidget {
  const UserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressCubit, UserAddressState>(
      listener: (context, state) {
        state.whenOrNull(
          getAllAddressError: (apiErrorModel) => ShowToast.showToastErrorTop(
              errorMessage: apiErrorModel.message!, context: context),
          removeAddressError: (apiErrorModel) => ShowToast.showToastErrorTop(
              errorMessage: apiErrorModel.message!, context: context),
          removeAddressSuccess: (data, getAddressResponseData) =>
              ShowToast.showToastSuccessTop(
                  message: data.message!, context: context),
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(context.translate(AppStrings.myAddress),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp)),
              ),
              body: context.read<UserAddressCubit>().addressDataList.isEmpty
                  ? const EmptyAddressScreen()
                  :  UserAddressSuccessStateWidget(
                     userAddress:  context.read<UserAddressCubit>(),),
            ),
            LoadingOverlay(isLoading: state is RemoveAddressLoading)
          ],
        );
      },
    );
  }
}
