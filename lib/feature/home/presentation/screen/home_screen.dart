import 'package:carousel_slider/carousel_slider.dart';
import 'package:elminiawy/feature/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../../../core/style/images/asset_manger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> sampleImages = [
      ImageAsset.banner,
      ImageAsset.banner2,
      ImageAsset.banner3,
      ImageAsset.banner4,
    ];
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Location",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyBroken.notification,
                        color: ColorManger.brunLight),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(IconlyBold.location, color: ColorManger.brown),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("New York, USA",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 14.sp)),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    IconlyBold.arrowDown2,
                    color: ColorManger.brown,
                    size: 15.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: TextFormField(
                        enabled: false,
                        // initialValue: 'Find Your Patisserie',
                        decoration: InputDecoration(
                            hintText: 'Find Your Patisserie',
                            prefixIcon: Icon(IconlyBroken.search,
                                size: 18.sp, color: ColorManger.brunLight),
                            hintStyle: TextStyle(color: ColorManger.brunLight),
                            fillColor: ColorManger.backgroundItem,
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorManger.backgroundItem),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(10.r, 10.r)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManger.backgroundItem,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(10.r, 10.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorManger.backgroundItem,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: 41.h,
                    margin: EdgeInsets.only(left: 10.w, right: 5.w),
                    decoration: BoxDecoration(
                      color: ColorManger.backgroundItem,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      icon: Icon(IconlyBroken.filter,
                          color: ColorManger.brunLight),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: 130.h,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    viewportFraction: 1.1,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.easeInOutBack,
                    scrollDirection: Axis.horizontal),
                items: sampleImages
                    .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          e,
                          width: 300.w,
                          fit: BoxFit.fill,
                        )))
                    .toList(),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text("Category",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 14.sp)),
                  const Spacer(),
                  Text("View all",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: ColorManger.backgroundItem),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                ImageAsset.cake,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text("Cakes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontFamily: FontConsistent.fontFamilyAcme,
                                      color: Colors.black38,
                                      fontSize: 12.sp)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("New Products in Store",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brun,
                          fontSize: 16.sp)),
                  const Spacer(),
                  Text("See all",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: FontConsistent.fontFamilyAcme,
                          color: ColorManger.brunLight,
                          fontSize: 14.sp)),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      height: 280.h,
                      width: 153.375.w,
                      decoration: BoxDecoration(
                        color: ColorManger.backgroundItem,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 100.w),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyBroken.heart,
                                      color: ColorManger.black26),
                                ),
                              ),
                              Image.asset(
                                ImageAsset.newItem,
                                height: 50.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: Image.asset(
                                  ImageAsset.cakeItem,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 180.h, left: 90.w),
                                child: Container(
                                  height: 20.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: ColorManger.brunLight,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 2.h),
                                        child: Text("4.3",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 10.sp)),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Icon(
                                        IconlyBroken.star,
                                        color: ColorManger.white,
                                        size: 10.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Text("Chocolate Cake",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.brun,
                                        fontSize: 14.sp)),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Center(
                            child: Text(" 19.00 \$",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: ColorManger.brunLight,
                                        fontSize: 14.sp)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 280.h,
                      width: 153.375.w,
                      decoration: BoxDecoration(
                        color: ColorManger.backgroundItem,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 100.w),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(IconlyBroken.heart,
                                      color: ColorManger.black26),
                                ),
                              ),
                              Image.asset(
                                ImageAsset.newItem,
                                height: 50.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: Image.asset(
                                  ImageAsset.cakeItem,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 180.h, left: 90.w),
                                child: Container(
                                  height: 20.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: ColorManger.brunLight,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, top: 2.h),
                                        child: Text("4.3",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 10.sp)),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Icon(
                                        IconlyBroken.star,
                                        color: ColorManger.white,
                                        size: 10.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Text("Chocolate Cake",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily:
                                            FontConsistent.fontFamilyAcme,
                                        color: ColorManger.brun,
                                        fontSize: 14.sp)),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Center(
                            child: Text(" 19.00 \$",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: ColorManger.brunLight,
                                        fontSize: 14.sp)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
