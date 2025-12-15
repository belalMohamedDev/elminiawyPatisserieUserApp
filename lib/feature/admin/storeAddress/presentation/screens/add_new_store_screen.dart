import 'package:dotted_border/dotted_border.dart';
import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';
import 'package:elminiawy/feature/admin/storeAddress/presentation/screens/pick_store_map_screen.dart';

class AddNewStoreScreen extends StatelessWidget {
  const AddNewStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate(AppStrings.addNewStoreAddress),
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),
      body: BlocBuilder<StoreAddressCubit, StoreAddressState>(
        builder: (context, state) {
          final cubit = context.read<StoreAddressCubit>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    _storeMapPreview(cubit, context),
                    const SizedBox(height: 12),

                    Positioned(
                      right: responsive.setWidth(3),
                      top: responsive.setHeight(1),
                      child: GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PickStoreMapScreen(),
                            ),
                          );

                          if (result != null) {
                            context.read<StoreAddressCubit>().setLocation(
                              result["location"],
                            );
                            context.read<StoreAddressCubit>().setDeliveryZone(
                              result["zone"],
                            );
                          }
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
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                _formFeild(cubit, context, responsive),

                const SizedBox(height: 24),

                CustomButton(
                  onPressed: () {
                    context.read<StoreAddressCubit>().saveStore();
                  },
                  widget: LoadingButtonContent(
                    defaultText: AppStrings.saveStore,
                    state: state,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Column _formFeild(
    StoreAddressCubit cubit,
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: cubit.branchAreaController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.branchArea),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),
        SizedBox(height: responsive.setHeight(1.5)),

        TextFormField(
          controller: cubit.regionController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.region),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),
        SizedBox(height: responsive.setHeight(1.5)),

        TextFormField(
          controller: cubit.briefnessController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.briefness),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),
      ],
    );
  }

  Widget _storeMapPreview(StoreAddressCubit cubit, BuildContext context) {
    if (cubit.storeLocation == null) {
      final responsive = ResponsiveUtils(context);
      return DottedBorder(
        options: const RoundedRectDottedBorderOptions(
          dashPattern: [10, 6],
          strokeWidth: 2,
          radius: Radius.circular(16),
          color: Colors.grey,
          padding: EdgeInsets.zero,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_off_outlined,
                  size: responsive.setIconSize(15),
                  color: ColorManger.brun,
                ),
                SizedBox(height: responsive.setHeight(1)),
                Text(
                  context.translate(AppStrings.noLocationSelected),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManger.brun,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: responsive.setHeight(1)),
                Text(
                  context.translate(AppStrings.pickStoreLocationHint),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: responsive.setTextSize(3.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return DottedBorder(
      options: const RoundedRectDottedBorderOptions(
        dashPattern: [10, 6],
        strokeWidth: 2,
        radius: Radius.circular(16),
        color: Colors.grey,
        padding: EdgeInsets.zero,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 200,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: cubit.storeLocation!,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("store"),
                position: cubit.storeLocation!,
              ),
            },
            polygons: cubit.deliveryZonePoints.isEmpty
                ? {}
                : {
                    Polygon(
                      polygonId: const PolygonId("delivery_zone"),
                      points: cubit.deliveryZonePoints,
                      fillColor: Colors.green.withValues(alpha: 0.25),
                      strokeColor: Colors.green,
                      strokeWidth: 2,
                    ),
                  },
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: false,
            liteModeEnabled: true,
          ),
        ),
      ),
    );
  }
}
