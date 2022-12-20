import 'package:boongboong_into_the_room/map/model/marker_model.dart';
import 'package:boongboong_into_the_room/map/view/map_view.dart';
import 'package:boongboong_into_the_room/user/provider/auth_manage.dart';
import 'package:boongboong_into_the_room/user/view/sign_up_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

class LoginPage extends ConsumerWidget {
  static String get routeName => 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController idController = TextEditingController();
    TextEditingController pwController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: idController,
            ),
            TextField(
              controller: pwController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                final AuthManage manage = AuthManage();
                final re =
                    await manage.signIn(idController.text, pwController.text);

                if(re){
                  context.goNamed(MapPage.routeName);
                }
              },
              child: Text('로그인'),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    context.pushNamed(SignUpPage.routeName);
                  },
                  child: Text('회원가입'),
                ),
                TextButton(
                  onPressed: () async {

                  },
                  child: Text('비밀번호 초기화'),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                context.goNamed(MapPage.routeName);
              },
              child: Text('그냥 들어가기'),
            ),
          ],
        ),
      ),
    );
  }
}
