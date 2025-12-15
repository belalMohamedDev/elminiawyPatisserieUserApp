import 'package:elminiawy/core/common/shared/shared_imports.dart';

class PickStoreMapScreen extends StatefulWidget {
  const PickStoreMapScreen({super.key});

  @override
  State<PickStoreMapScreen> createState() => _PickStoreMapScreenState();
}

class _PickStoreMapScreenState extends State<PickStoreMapScreen> {
  LatLng initial = const LatLng(30.0444, 31.2357);
  LatLng? storeLocation;
  List<LatLng> zonePoints = [];

  Set<Marker> markers = {};
  Set<Polygon> polygons = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Store Location"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, {
                "location": storeLocation,
                "zone": zonePoints,
              });
            },
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: initial, zoom: 14),
        markers: markers,
        polygons: polygons,
        onTap: (point) {
          if (storeLocation == null) {
            setState(() {
              storeLocation = point;
              markers.add(
                Marker(
                  markerId: const MarkerId("store"),
                  position: point,
                ),
              );
            });
          } else {
            zonePoints.add(point);
            setState(() {
              polygons = {
                Polygon(
                  polygonId: const PolygonId("zone"),
                  points: zonePoints,
                  fillColor: Colors.green.withValues(alpha: 0.25),
                  strokeColor: Colors.green,
                  strokeWidth: 2,
                ),
              };
            });
          }
        },
      ),
    );
  }
}
