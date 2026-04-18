import 'package:agin_3/view/card/card.dart';
import 'package:agin_3/view/screen/check.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:latlong2/latlong.dart' as ll;
import 'package:url_launcher/url_launcher.dart';

class ControllebetweenTabs extends StatefulWidget {
  const ControllebetweenTabs({super.key});

  @override
  State<ControllebetweenTabs> createState() => _ControllebetweenTabsState();
}

final List card = [
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Single",
    "icon": Icons.location_on_sharp,
    "price": "2,500",
    "beds": "1",
    "chair": "1",
    "table": "1",
  },
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Double",
    "icon": Icons.location_on_sharp,
    "price": "2,000",
    "beds": "2",
    "chair": "2",
    "table": "2",
  },
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Triple",
    "icon": Icons.location_on_sharp,
    "price": "1,500",
    "beds": "3",
    "chair": "3",
    "table": "3",
  },
  {
    "image": "images/room.jpg",
    "number_of_individuals": "Quadruple",
    "icon": Icons.location_on_sharp,
    "price": "1,000",
    "beds": "4",
    "chair": "4",
    "table": "4",
  },
];

class _ControllebetweenTabsState extends State<ControllebetweenTabs> {
  static const double _mapLat = 29.934221;
  static const double _mapLng = 31.1966446;
  static const gmaps.LatLng _pyramidsLocation = gmaps.LatLng(_mapLat, _mapLng);

  final MapController _osmMapController = MapController();
  gmaps.GoogleMapController? _googleMapController;

  final Set<gmaps.Marker> _mapMarkers = {
    gmaps.Marker(
      markerId: gmaps.MarkerId('marker'),
      position: _pyramidsLocation,
      infoWindow: gmaps.InfoWindow(
        title: 'location',
      ),
    ),
  };

  static final Uri _googleMapsOpenUri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$_mapLat,$_mapLng',
  );

  Future<void> _openInGoogleMapsApp() async {
    final ok = await launchUrl(
      _googleMapsOpenUri,
      mode: LaunchMode.externalApplication,
    );
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Google Maps')),
      );
    }
  }

  void _osmZoomIn() {
    final cam = _osmMapController.camera;
    _osmMapController.move(cam.center, (cam.zoom + 1).clamp(3.0, 20.0));
  }

  void _osmZoomOut() {
    final cam = _osmMapController.camera;
    _osmMapController.move(cam.center, (cam.zoom - 1).clamp(3.0, 20.0));
  }

  Widget _mapZoomButtons({
    required VoidCallback onZoomIn,
    required VoidCallback onZoomOut,
  }) {
    return Material(
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            icon: const Icon(Icons.add, size: 20),
            onPressed: onZoomIn,
            tooltip: 'Zoom in',
          ),
          const Divider(height: 1),
          IconButton(
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            icon: const Icon(Icons.remove, size: 20),
            onPressed: onZoomOut,
            tooltip: 'Zoom out',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _osmMapController.dispose();
    super.dispose();
  }

  /// Google Maps on web requires a valid Maps JavaScript API key in `web/index.html`.
  /// OpenStreetMap via [flutter_map] works without any API key, so we use it on web.
  Widget _buildLocationSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 170,
        width: double.infinity,
        child: kIsWeb ? _buildOsmMap() : _buildGoogleMap(),
      ),
    );
  }

  Widget _buildGoogleMap() {
    return Stack(
      fit: StackFit.expand,
      children: [
        gmaps.GoogleMap(
          initialCameraPosition: const gmaps.CameraPosition(
            target: _pyramidsLocation,
            zoom: 14,
          ),
          onMapCreated: (c) => _googleMapController = c,
          onTap: (_) => _openInGoogleMapsApp(),
          markers: _mapMarkers,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: _mapZoomButtons(
            onZoomIn: () => _googleMapController?.animateCamera(
              gmaps.CameraUpdate.zoomIn(),
            ),
            onZoomOut: () => _googleMapController?.animateCamera(
              gmaps.CameraUpdate.zoomOut(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOsmMap() {
    const point = ll.LatLng(_mapLat, _mapLng);
    return Stack(
      fit: StackFit.expand,
      children: [
        FlutterMap(
          mapController: _osmMapController,
          options: MapOptions(
            initialCenter: point,
            initialZoom: 15,
            interactionOptions: const InteractionOptions(),
            onTap: (tapPosition, point) => _openInGoogleMapsApp(),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.agin_3.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: point,
                  width: 40,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: _mapZoomButtons(
            onZoomIn: _osmZoomIn,
            onZoomOut: _osmZoomOut,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: "Apartment"),
              Tab(text: "Rooms"),
              Tab(text: "Check"),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 360,
            child: TabBarView(
              children: [
                //***************************is name appartments بداية اول تاب ***************************
                SingleChildScrollView(
                  child: //if space on the page not enough when using a row or column""بتعمل scroll المحتوى الموجود""
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffCFD7DA),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: ListTile(
                            title: Text(
                              "EGP 4,500",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                              ),
                            ),
                            subtitle: Text(
                              "In month",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5,
                              ),
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff53617F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minimumSize: Size(20, 44),
                              ),
                              onPressed: () {},

                              child: Text(
                                "Check Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              " Location",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 6),
                            _buildLocationSection(),
                            const SizedBox(height: 10),

                            Text(
                              " Extras",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                item(Icons.wifi, "  Wifi"),
                                SizedBox(width: 20),

                                item(Icons.archive_outlined, "  Adaptation"),
                                SizedBox(width: 20),

                                item(
                                  Icons.emoji_transportation,
                                  "Transportation",
                                ),
                              ],
                            ),
                            SizedBox(height: 6),

                            Row(
                              children: [
                                item(Icons.local_atm, " ATM"),
                                SizedBox(width: 20),

                                item(Icons.elevator_outlined, " Elevator"),
                                SizedBox(width: 20),
                                item(Icons.security, " Security"),
                                SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ////***************************is name appartments نهاية اول تاب ***************************
                ////***************************is name Rooms   بداية ثاني تاب *******************
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: card.length, // number of card
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  //يعنى كل صف فيه عنصران
                  itemBuilder: (context, index) {
                    //index is رقم العنصر (0, 1, 2, 3...)
                    return CardComponent(
                      image: card[index]["image"],
                      number_of_individuals:
                      card[index]['number_of_individuals'],
                      icon: card[index]['icon'],
                      price: card[index]["price"],
                      beds: card[index]["beds"],
                      chair: card[index]["chair"],
                      table: card[index]["table"],
                    );
                  },
                ),

                ////***************************is name Rooms   نهاية ثاني تاب *******************
                ////***************************is name check   بداية ثالث تاب *******************
                Column(children: [CheckTab()]),

                ////***************************is name check   نهاية ثالث تاب *******************
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// this widget because return icon behind text with character perfect
Widget item(IconData icon, String text) {
  return Row(children: [Icon(icon, size: 14), SizedBox(height: 5), Text(text)]);
}