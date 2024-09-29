

import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class UserAddressBody extends StatelessWidget {
  const UserAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserAddressCubit, UserAddressState>(
      listener: (context, state) {
        state.whenOrNull(
          getAllAddressError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          removeAddressError: (statesCode, errorMessage) =>
              ShowToast.showToastErrorTop(
                  errorMessage: errorMessage, context: context),
          removeAddressSuccess: (data) => ShowToast.showToastSuccessTop(
              message: data.message!, context: context),
        );
      },
      builder: (context, state) {
        if (state is GetAllAddressError || state is GetAllAddressLoading) {
          return const UserAddressErrorAndLoadingStateWidget();
        }
        if (context.read<UserAddressCubit>().addressDataList.isEmpty) {
          return const EmptyAddressScreen();
        }

        return Stack(
          children: [
            const UserAddressSuccessStateWidget(),
            state is RemoveAddressLoading
                ? Center(
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: ColorManger.brun,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          color: ColorManger.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        );
      },
    );
  }


 
}


