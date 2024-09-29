import '../../../../../core/common/shared/shared_imports.dart'; //


class EmptyOrderScreen extends StatelessWidget {
  final bool isCurrentOrder;
  const EmptyOrderScreen({super.key, this.isCurrentOrder = true});

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
                width: MediaQuery.of(context).size.width * 0.7,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    ImageAsset.noOrder,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ErrorInfo(
                title: isCurrentOrder
                    ? "No Current Orders!"
                    : "No Previous Orders!",
                description: isCurrentOrder
                    ? "You don't have any active orders right now. Once you place an order, it will appear here!"
                    : "It looks like you haven't completed any orders yet. Your past orders will be displayed here once available!",
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
