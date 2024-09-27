import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/userAddressCubit/user_address_cubit.dart';
import '../region_area_widget.dart';

class ChooceRegionAreaFromToggel extends StatelessWidget {
  const ChooceRegionAreaFromToggel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: BlocBuilder<UserAddressCubit, UserAddressState>(
        builder: (context, state) {
          return ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: context.read<UserAddressCubit>().regionArea.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 8.w),
                  child: InkWell(
                    onTap: () {
                      context.read<UserAddressCubit>().changeRegionAreaIndex(
                          index: index,
                          alias: context
                              .read<UserAddressCubit>()
                              .regionArea[index]["text"]);
                    },
                    child: RegionAreaWidget(
                      index: index,
                      imagePath: context
                          .read<UserAddressCubit>()
                          .regionArea[index]["imagePath"],
                      text: context.read<UserAddressCubit>().regionArea[index]
                          ["text"],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
