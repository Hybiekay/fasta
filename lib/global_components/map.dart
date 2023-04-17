import 'package:ziklogistics/global_components/ziklogistics.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: prefer_typing_uninitialized_variables

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({
    super.key,
    required this.polyCoordinates,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.destricption,
    required this.boundNe,
    required this.boundSw,
  });

  final List<PointLatLng> polyCoordinates;
  final LatLng dropOffLocation;
  final LatLng pickUpLocation;
  final String destricption;
  var boundNe;
  var boundSw;

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  var pinLocationIcon1;
  var pinLocationIcon2;

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Polyline> _polyLine = <Polyline>{};

  int _polyLineIdCounter = 1;

  void _setPolyLine(List<PointLatLng> points) {
    final String polyLineIdVal = "polyline_$_polyLineIdCounter";
    _polyLineIdCounter++;
    _polyLine.add(Polyline(
        polylineId: PolylineId(polyLineIdVal),
        width: 2,
        color: AppColor.mainColor,
        points: points
            .map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList()));
  }

  @override
  void initState() {
    _setPolyLine(widget.polyCoordinates);
    goToPlace(
        slat: widget.dropOffLocation,
        boundNe: widget.boundNe,
        boundSw: widget.boundSw);
    getCustomMapPin2();
    getCustomMapPin();
    super.initState();
  }

  void getCustomMapPin() async {
    final pinLocatio = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5), AppImages.pickUpMaker);
    setState(() {
      pinLocationIcon1 = pinLocatio;
    });
    setState(() {});
  }

  void getCustomMapPin2() async {
    final pinLocatio = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 100),
        AppImages.dropOffMaker);
    setState(() {
      pinLocationIcon2 = pinLocatio;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          bearing: 2,
          target: widget.dropOffLocation,
          zoom: 10,
        ),
        polylines: _polyLine,
        markers: {
          Marker(
              icon:
                  pinLocationIcon1, //await BitmapDescriptor.fromAssetImage(ImageConfiguration(), AppImages.dropOffMaker),
              markerId: const MarkerId("Pick Up"),
              position: widget.pickUpLocation,
              infoWindow: InfoWindow(
                  title: "Pick Up Area", snippet: widget.destricption)),
          Marker(
            icon: pinLocationIcon2,
            markerId: const MarkerId("Drop Off"),
            position: widget.dropOffLocation,
            infoWindow: const InfoWindow(title: "Drop Off"),
          ),
        },
      ),
    );
  }

  Future<void> goToPlace({
    var slat,
    required Map<String, dynamic> boundSw,
    required Map<String, dynamic> boundNe,
  }) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: slat, zoom: 12)));

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(boundSw['lat'], boundSw['lng']),
          northeast: LatLng(boundNe['lat'], boundNe['lng']),
        ),
        25));
  }
}
