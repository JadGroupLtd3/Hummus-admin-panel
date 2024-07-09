import 'package:get/get.dart';
import 'package:hummus_admin_panel/core/core_export.dart';

class MapWidget extends StatefulWidget {
  final bool isEdit;
  final RegionsData? regionsData;
  const MapWidget({super.key, this.isEdit = false,this.regionsData});

  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const LatLng _center = LatLng(32.4191096, 35.0151899);

  @override
  void initState() {
    super.initState();
    if (widget.isEdit == true) {
      _loadPolygon();
    }
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: _center,
    zoom: 14.4746,
  );

  List<LatLng> polygonLatLongs = [];
  Set<Polygon> polygons = {};
  Set<Marker> markers = {};
  TextEditingController searchController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _loadPolygon() {
    final regionsController = Get.find<RegionsController>();
    if (regionsController.latLongRegions.isNotEmpty) {
      setState(() {
        polygonLatLongs.clear();
        markers.clear();
        polygons.clear();
        for (var region in regionsController.latLongRegions) {
          LatLng point = LatLng(double.parse(region.lat), double.parse(region.lng));
          polygonLatLongs.add(point);
          markers.add(
            Marker(
              markerId: MarkerId('marker_${point.latitude}_${point.longitude}'),
              position: point,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              alpha: 0.6,
            ),
          );
        }
        polygons.add(
          Polygon(
            polygonId: const PolygonId('polygon_1'),
            points: polygonLatLongs,
            strokeColor: Colors.black.withOpacity(0.5),
            strokeWidth: 2,
            fillColor: Colors.blue.withOpacity(0.15),
          ),
        );
      });
    }
  }

  void _addPolygon(LatLng point) {
    setState(() {
      polygonLatLongs.add(point);
      polygons.add(
        Polygon(
          polygonId: const PolygonId('polygon_1'),
          points: polygonLatLongs,
          strokeColor: Colors.black.withOpacity(0.5),
          strokeWidth: 2,
          fillColor: Colors.blue.withOpacity(0.15),
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('marker_${point.latitude}_${point.longitude}'),
          position: point,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          alpha: 0.6,
        ),
      );
    });
  }

  void _savePolygon(RegionsController regionsController) {
    regionsController.latLongRegions.clear();
    for (var point in polygonLatLongs) {
      regionsController.latLongRegions.add(
        Regions(
          lat: point.latitude.toString(),
          lng: point.longitude.toString(),
        ),
      );
    }
    regionsController.createRegions(context);
    _clearPolygonsAndMarkers();
  }

  void _updatePolygon(RegionsController regionsController) {
    regionsController.latLongRegions.clear();
    for (var point in polygonLatLongs) {
      regionsController.latLongRegions.add(
        Regions(
          lat: point.latitude.toString(),
          lng: point.longitude.toString(),
        ),
      );
    }
    print(widget.regionsData?.toJson());
    regionsController.updateRegions(context,widget.regionsData?.id);
    _clearPolygonsAndMarkers();
  }

  void _clearPolygonsAndMarkers() {
    setState(() {
      polygonLatLongs.clear();
      polygons.clear();
      markers.clear();
    });
  }

  Future<void> _searchAndNavigate() async {
    String searchAddress = searchController.text;
    if (searchAddress.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(searchAddress);
        if (locations != null && locations.isNotEmpty) {
          Location location = locations.first;
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(location.latitude, location.longitude),
            ),
          );
        }
      } catch (e) {
        print("Error occurred while searching for the address: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GetBuilder<RegionsController>(
          builder: (regionsController) {
            return Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 1.7,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: _onMapCreated,
                          polygons: polygons,
                          markers: markers,
                          onTap: _addPolygon,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.height * 1 / 1.5,
                              child: CustomTextField(
                                controller: searchController,
                                hintText: 'Enter address'.tr,
                                filled: true,
                                onChanged: (text) => _searchAndNavigate(),
                                onSubmit: (p0) => _searchAndNavigate(),
                                suffixIconUrl: const Icon(Icons.search, size: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Obx(() {
                      switch (regionsController.controllerState.value) {
                        case ControllerState.loading:
                          return Center(
                            child: CircularProgressIndicator(color: MyThemeData.light.primaryColor),
                          );
                        case ControllerState.error:
                          return OnHover(
                            builder: (isHovered) {
                              return CustomButton(
                                buttonText: widget.isEdit ? 'edit'.tr : 'save'.tr,
                                icon: SvgPicture.asset(Images.correct).paddingSymmetric(horizontal: 4),
                                style: TajawalBold.copyWith(color: Colors.white),
                                radius: 7,
                                width: 120,
                                height: 45,
                                backGroundColor: MyThemeData.light.primaryColor,
                                onPressed: () {
                                  if(widget.isEdit){
                                    _updatePolygon(regionsController);
                                  }else {
                                    _savePolygon(regionsController);
                                  }
                                },
                              );
                            },
                          );
                        default:
                          return OnHover(
                            builder: (isHovered) {
                              return CustomButton(
                                buttonText: widget.isEdit ? 'edit'.tr : 'save'.tr,
                                icon: SvgPicture.asset(Images.correct).paddingSymmetric(horizontal: 4),
                                style: TajawalBold.copyWith(color: Colors.white),
                                radius: 7,
                                width: 120,
                                height: 45,
                                backGroundColor: MyThemeData.light.primaryColor,
                                onPressed: () {
                                  if(widget.isEdit){
                                    _updatePolygon(regionsController);
                                  }else {
                                    _savePolygon(regionsController);
                                  }
                                },
                              );
                            },
                          );
                      }
                    }),
                    12.horizontalSpace,
                    OnHover(
                      builder: (isHovered) {
                        return CustomButton(
                          buttonText: 'clear'.tr,
                          style: TajawalBold.copyWith(color: Colors.white),
                          radius: 7,
                          width: 120,
                          height: 45,
                          backGroundColor: MyThemeData.light.focusColor,
                          onPressed: _clearPolygonsAndMarkers,
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
