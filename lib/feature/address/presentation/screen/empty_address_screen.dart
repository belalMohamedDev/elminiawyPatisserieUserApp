import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class EmptyAddressScreen extends StatelessWidget {
  final bool isLoading;
  const EmptyAddressScreen({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: isLoading == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: isLoading == true
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: isLoading == true ? 10.w : 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    ImageAsset.noAddress,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: isLoading == true ? 50.h : 0.h,
            ),
            isLoading == true
                ? const SizedBox()
                : ErrorInfo(
                    title: context.translate(AppStrings.emptyAddress),
                    description: context.translate(
                        AppStrings.itSeemsLikeYouHavenAddedAnyAddressesYet),
                    btnText: context.translate(AppStrings.addAddress),
                    press: () {
                      context.pushNamed(Routes.map);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
