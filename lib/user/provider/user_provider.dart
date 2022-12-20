// import 'package:boongboong_into_the_room/user/model/user_model.dart';
// import 'package:boongboong_into_the_room/user/provider/auth_manage.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>((ref) {
//
//   return UserStateNotifier(state);
// });
//
//
// class UserStateNotifier extends StateNotifier<UserModelBase?> {
//
//   final AuthManage authManage;
//   final FlutterSecureStorage storage;
//
//
//   UserStateNotifier({
//     required this.authManage,
//     required this.storage,
//   }):super(UserModelLoading()){
//     getToken();
//   }
//
//   Future<void> getToken() async {
//     final accessToken = await storage.read(key : "Access Token");
//     final refreshToken = await storage.read(key : "Refresh Token");
//
//     if(refreshToken == null || accessToken == null){
//       state = null;
//       return;
//     }
//
//     final resp = authManage.getUser();
//   }
//
//
//
// }