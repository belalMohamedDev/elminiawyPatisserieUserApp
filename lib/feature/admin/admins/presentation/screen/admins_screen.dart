import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AdminsScreen extends StatefulWidget {
  const AdminsScreen({super.key});

  @override
  State<AdminsScreen> createState() => _AdminsScreenState();
}

class _AdminsScreenState extends State<AdminsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<AdminsCubit, AdminsState>(
      builder: (context, state) {
        final admins = context.read<AdminsCubit>();
        return Stack(
          children: [
            Scaffold(
              appBar: _adminsAppBar(context, responsive, state),
              body: Column(
                children: [
                  _totalAdminsActiveInActiveInformation(
                    responsive,
                    context,
                    admins,
                  ),

                  SizedBox(height: responsive.setHeight(1)),
                  admins.allActiveAdmins.isEmpty ||
                          state is GetActiveAdminsLoading
                      ? _getAllAdminDataLoading(responsive)
                      : _getAllAdminDataSuccess(
                          admins.allActiveAdmins,
                          responsive,
                        ),
                ],
              ),
            ),
            LoadingOverlay(isLoading: state is CreateNewAdminLoading),
          ],
        );
      },
    );
  }

  Column _totalAdminsActiveInActiveInformation(
    ResponsiveUtils responsive,
    BuildContext context,
    AdminsCubit admins,
  ) {
    return Column(
      children: [
        Container(
          padding: responsive.setPadding(top: 2, bottom: 2),
          margin: responsive.setMargin(left: 5, right: 5, top: 1, bottom: 2),
          height: responsive.setHeight(15),
          width: responsive.screenWidth,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(responsive.setBorderRadius(3)),
            color: ColorManger.backgroundItem,
          ),
          child: Column(
            children: [
              Text(
                context.translate(AppStrings.totalAdmins),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: responsive.setTextSize(4),
                  color: ColorManger.brun,
                ),
              ),
              Text(
                "${admins.totalAdmins}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: responsive.setTextSize(8),
                  color: ColorManger.brun,
                ),
              ),
              Text(
                context.translate(AppStrings.storeAdmins),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: responsive.setTextSize(3.5),
                  color: ColorManger.brunLight,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: responsive.setMargin(left: 5, right: 5, bottom: 1),
          height: responsive.setHeight(10),
          width: responsive.screenWidth,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(responsive.setBorderRadius(3)),
            color: ColorManger.backgroundItem,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translate(AppStrings.activeAdmins),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: responsive.setTextSize(4),
                      color: ColorManger.brun,
                    ),
                  ),
                  Text(
                    "${admins.totalActiveAdmins}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: responsive.setTextSize(6),
                      color: ColorManger.brun,
                    ),
                  ),
                ],
              ),
              Container(
                width: 1,
                height: responsive.setHeight(6),
                color: ColorManger.brownLight,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.translate(AppStrings.notActiveAdmins),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: responsive.setTextSize(4),
                      color: ColorManger.brun,
                    ),
                  ),
                  Text(
                    "${admins.totalInactiveAdmins}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: responsive.setTextSize(6),
                      color: ColorManger.brun,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar _adminsAppBar(
    BuildContext context,
    ResponsiveUtils responsive,
    AdminsState state,
  ) {
    return AppBar(
      centerTitle: true,
      title: Text(
        context.translate(AppStrings.admins),
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
      ),

      actions: [
        (state is GetActiveAdminsLoading)
            ? const SizedBox()
            : GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.addNewAdmin);
                },
                child: Container(
                  height: responsive.setHeight(4),
                  width: responsive.setWidth(8.5),
                  decoration: BoxDecoration(
                    color: ColorManger.brun,
                    borderRadius: BorderRadius.circular(
                      responsive.setBorderRadius(5),
                    ),
                  ),
                  child: Icon(Icons.add, color: ColorManger.white),
                ),
              ),
        SizedBox(width: responsive.setWidth(6)),
      ],
    );
  }

  Expanded _getAllAdminDataSuccess(
    List<DataAuthResponse> admins,
    ResponsiveUtils responsive,
  ) {
    return Expanded(
      child: ListView.builder(
        itemCount: admins.length,
        itemBuilder: (context, index) {
          return Container(
            margin: responsive.setMargin(left: 5, right: 5, bottom: 1.5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(
                responsive.setBorderRadius(3),
              ),
              color: ColorManger.backgroundItem,
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                  responsive.setBorderRadius(3),
                ),
                child: CachedNetworkImage(
                  imageUrl: admins[index].image ?? "",
                  width: responsive.setWidth(15),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => LoadingShimmer(
                    height: responsive.setHeight(12),
                    width: responsive.setWidth(12),
                    borderRadius: responsive.setBorderRadius(2),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(ImageAsset.driverPerson),
                ),
              ),
              title: Text(
                admins[index].name ?? "",
                style: TextStyle(
                  fontSize: responsive.setTextSize(3.5),
                  fontWeight: FontWeight.bold,
                  color: ColorManger.brun,
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        IconlyBold.call,
                        color: ColorManger.brunLight,
                        size: responsive.setTextSize(3.8),
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      Text(
                        admins[index].phone ?? "",
                        style: TextStyle(
                          fontSize: responsive.setTextSize(3.2),
                          color: ColorManger.brunLight,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        IconlyBold.message,
                        color: ColorManger.brunLight,
                        size: responsive.setTextSize(3.8),
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      Text(
                        admins[index].email ?? "",
                        style: TextStyle(
                          fontSize: responsive.setTextSize(3.2),
                          color: ColorManger.brunLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  context.read<AdminsCubit>().fetchDeleteAdmin(
                    id: admins[index].sId,
                  );
                },
                child: Icon(
                  IconlyBold.delete,
                  color:
                      admins[index].active == false &&
                          admins[index].completeData == true
                      ? Colors.red
                      : admins[index].completeData == false ||
                            admins[index].completeData == null
                      ? Colors.yellow.shade800
                      : Colors.green.shade800,
                  size: responsive.setIconSize(6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Expanded _getAllAdminDataLoading(ResponsiveUtils responsive) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: responsive.setMargin(left: 5, right: 5, bottom: 1.5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(
                responsive.setBorderRadius(3),
              ),
              color: ColorManger.backgroundItem,
            ),
            child: ListTile(
              leading: LoadingShimmer(
                width: responsive.setWidth(15),
                borderRadius: 12.r,
              ),
              title: LoadingShimmer(
                height: responsive.setHeight(0.8),
                borderRadius: 12.r,
              ),
              subtitle: Column(
                children: [
                  responsive.setSizeBox(height: 1),
                  Row(
                    children: [
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        borderRadius: 12.r,
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        width: responsive.setWidth(40),
                        borderRadius: 12.r,
                      ),
                    ],
                  ),
                  responsive.setSizeBox(height: 0.5),
                  Row(
                    children: [
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        borderRadius: 12.r,
                      ),
                      SizedBox(width: responsive.setWidth(2)),
                      LoadingShimmer(
                        height: responsive.setHeight(0.8),
                        width: responsive.setWidth(40),
                        borderRadius: 12.r,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: LoadingShimmer(
                height: responsive.setHeight(2.5),
                width: responsive.setWidth(5),
                borderRadius: 50.r,
                highlightColor: Colors.green,
                baseColor: Colors.green.shade700,
              ),
            ),
          );
        },
      ),
    );
  }
}
