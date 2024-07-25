import 'package:flutter/material.dart';

import '../refactor/category_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CategoryBody()),
    );
  }
}



