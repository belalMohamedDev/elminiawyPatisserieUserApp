import 'package:elminiawy/core/common/shared/shared_imports.dart';

class PickStoreMapScreen extends StatefulWidget {
  const PickStoreMapScreen({super.key});

  @override
  State<PickStoreMapScreen> createState() => _PickStoreMapScreenState();
}

class _PickStoreMapScreenState extends State<PickStoreMapScreen> {
  final LatLng _initialLocation = const LatLng(30.0444, 31.2357); // Cairo
  GoogleMapController? _mapController;

  LatLng? storeLocation;
  List<LatLng> zonePoints = [];

  Set<Marker> markers = {};
  Set<Polygon> polygons = {};

  final TextEditingController searchController = TextEditingController();

  // ========================= MAP HELPERS =========================

  void _moveCamera(LatLng latLng, {double zoom = 15}) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: zoom),
      ),
    );
  }

  void _onMapTap(LatLng point) {
    // First tap -> store location
    if (storeLocation == null) {
      setState(() {
        storeLocation = point;
        markers = {Marker(markerId: const MarkerId("store"), position: point)};
      });
    }
    // Next taps -> delivery zone
    else {
      zonePoints.add(point);
      setState(() {
        polygons = {
          Polygon(
            polygonId: const PolygonId("delivery_zone"),
            points: zonePoints,
            fillColor: Colors.green.withValues(alpha: 0.25),
            strokeColor: Colors.green,
            strokeWidth: 2,
          ),
        };
      });
    }
  }

  // ========================= CURRENT LOCATION =========================

  Future<void> _getCurrentLocation() async {
    final permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    final latLng = LatLng(position.latitude, position.longitude);

    _moveCamera(latLng);

    setState(() {
      storeLocation = latLng;
      markers = {Marker(markerId: const MarkerId("store"), position: latLng)};
    });
  }

  // ========================= UI =========================

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.brun,
        iconTheme: IconThemeData(color: ColorManger.white),
        title: Text(
          context.translate(AppStrings.pickStoreLocation),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: ColorManger.white,
            fontSize: responsive.setTextSize(4),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: storeLocation == null
                ? null
                : () {
                    Navigator.pop(context, {
                      "location": storeLocation,
                      "zone": zonePoints,
                    });
                  },
          ),
        ],
      ),
      body: Stack(
        children: [
          /// ================= MAP =================
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialLocation,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: markers,
            polygons: polygons,
            onTap: _onMapTap,
            myLocationEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
          ),

    

          /// ================= CURRENT LOCATION BUTTON =================
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: ColorManger.brun,
              onPressed: _getCurrentLocation,
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),

          /// ================= HINT =================
          Positioned(
            bottom: 20,
            left: 20,
            right: 80,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                context.translate(AppStrings.mapHint),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
