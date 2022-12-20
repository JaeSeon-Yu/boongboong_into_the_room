import 'package:boongboong_into_the_room/map/view/map_view.dart';
import 'package:boongboong_into_the_room/user/model/user_model.dart';
import 'package:boongboong_into_the_room/user/provider/auth_manage.dart';
import 'package:boongboong_into_the_room/user/view/login_view.dart';
import 'package:boongboong_into_the_room/user/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref, authManage: AuthManage());
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;
  final AuthManage authManage;

  AuthProvider({
    required this.authManage,
    required this.ref,
  }) {
    // ref.listen<UserModelBase?>(userProvider, (previous, next) {
    //   notifyListeners();
    // });
  }

  List<GoRoute> get routes => [
    GoRoute(
      path: '/',
      name: MapPage.routeName,
      builder: (_, state) => MapPage(),
    ),
    GoRoute(
      path: '/login',
      name: LoginPage.routeName,
      builder: (_, state) => LoginPage(),
    ),
    GoRoute(
      path: '/sign_up',
      name: SignUpPage.routeName,
      builder: (_, state) => SignUpPage(),
    ),
  ];

  void logout() {
    authManage.signOut();
  }

  //splash screen - 앱을 처음 시작시 토큰 확인하고 로그인 스크린으로 보내줄지 홈 스크린으로 보내줄지 확인하는 과정
  // String? redirectLogic(BuildContext context, GoRouterState state) {
  //   final UserModelBase? user = ref.read(userMeProvider);
  //   final logginIn = state.location == '/login';
  //
  //   //로그인 정보가 없는데
  //   if (user == null) {
  //     //로그인 페이지면 그대로, 로그인 페이지가 아니면 로그인으로
  //     return logginIn ? null : '/login';
  //   }
  //
  //   //로그인 정보가 있는데
  //   if (user is UserModel) {
  //     //로그인중이거나 스플레시 스크린이면 홈으로 이동
  //     return logginIn || state.location == '/splash' ? '/' : null;
  //   }
  //
  //   //로그인 정보가 에러일때
  //   if (user is UserModelError) {
  //     return !logginIn ? '/login' : null;
  //   }
  //
  //   return null;
  // }
}
