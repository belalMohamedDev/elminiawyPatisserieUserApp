import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class AddNewAddressScreen extends StatefulWidget {
  final GetAddressResponseData? getAddressResponseData;

  const AddNewAddressScreen({super.key, this.getAddressResponseData});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  void initState() {
    super.initState();
    _addNewAddressInitFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.translate(AppStrings.newAddress),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.read<MapCubit>().checkLocationAvailableResponse = null;

            context.read<MapCubit>().textEditingSearchText =
               context.translate(AppStrings.findYourLocation) ;

            context.pop();
          },
        ),
      ),
      body: AddNewAddressBody(
        getAddressResponseData: widget.getAddressResponseData,
      ),
    );
  }

  void _addNewAddressInitFunction() {
    if (widget.getAddressResponseData != null) {
      LatLng latLng = LatLng(
          widget.getAddressResponseData!.location!.coordinates![1],
          widget.getAddressResponseData!.location!.coordinates![0]);

      final mapCubit = context.read<MapCubit>();
      mapCubit.addCurrentLocationMarkerToMap(latLng);

      final userAddressCubit = context.read<UserAddressCubit>();
      userAddressCubit.aliasData =
          widget.getAddressResponseData!.alias ?? context.translate(AppStrings.apartment) ;
      userAddressCubit.regionAreaIndex = userAddressCubit.regionArea.indexWhere(
          (element) =>
              element['text'] ==
              (widget.getAddressResponseData!.alias ?? context.translate(AppStrings.apartment)));

      userAddressCubit.buildingNameController.text =
          widget.getAddressResponseData?.buildingName ?? '';

      userAddressCubit.companyController.text =
          widget.getAddressResponseData?.apartmentNumber ?? '';

      userAddressCubit.floorController.text =
          widget.getAddressResponseData?.floor ?? '';

      userAddressCubit.streetController.text =
          widget.getAddressResponseData?.streetName ?? '';

      userAddressCubit.additionalDirectionsContoller.text =
          widget.getAddressResponseData?.additionalDirections ?? '';

      userAddressCubit.phoneNumberContoller.text =
          widget.getAddressResponseData?.phone ?? '';

      userAddressCubit.addressLabel.text =
          widget.getAddressResponseData?.addressLabel ?? '';
    } else {
      final userAddressCubit = context.read<UserAddressCubit>();

      userAddressCubit.clearAllControllers();
      userAddressCubit.regionAreaIndex = userAddressCubit.regionArea
          .indexWhere((element) => element['text'] == (context.translate(AppStrings.apartment) ));
    }
  }
}
