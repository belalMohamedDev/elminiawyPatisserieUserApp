import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bannerCubit/banner_cubit.dart';
import '../../logic/categoryCubit/category_cubit.dart';
import '../../../newProduct/Cubit/product_cubit.dart';
import '../refactor/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fetch banners, categories, and products
      await Future.wait([
        context.read<BannerCubit>().getBanners(),
        context.read<CategoryCubit>().getCategories(),
        context.read<ProductCubit>().getProduct(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }

}
