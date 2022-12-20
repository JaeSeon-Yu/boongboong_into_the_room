import 'package:boongboong_into_the_room/map/model/marker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapPage extends ConsumerStatefulWidget {
  static String get routeName => 'MapPage';

  const MapPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {

  late GoogleMapController mapController;


 // TODO. provider로 바꾸기
  Future<void> _getMarkers() async {
    final fireStore = FirebaseFirestore.instance;
    var resultList = await fireStore.collection('points').get();//doc('qcNSbARMwwHWjLgOZCeg').get();

    for (final result in resultList.docs) {

      final model = MarkerModel.fromJson(result.data());

      Logger().i(model.toString());
    }
  }

  //TODO. 앱 시작시 위치권한 받기 -> 받아서 여기 타겟에 넣기
  @override
  Widget build(BuildContext context) {

    _getMarkers();

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.57591265362573, 126.97685820618238), // 광화문
          zoom: 15,
        ),
      ),
    );
  }
}
