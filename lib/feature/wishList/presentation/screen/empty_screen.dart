
import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class EmptyWishListScreen extends StatelessWidget {
  const EmptyWishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    ImageAsset.noWishList,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ErrorInfo(
                title: "Empty WishList!",
                description:
                    "It seems like you haven't added anything to your wishlist yet. Start exploring and add your favorite items now!",
                press: () {},
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
