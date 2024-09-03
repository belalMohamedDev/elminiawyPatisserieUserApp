import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/images/asset_manger.dart';
import '../../../cart/presentation/screen/empty_cart_screen.dart';

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
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    ImageAsset.whishList,
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
                // button: you can pass your custom button,
                //  btnText: "Discover Products",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
