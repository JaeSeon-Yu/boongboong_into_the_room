import 'package:boongboong_into_the_room/user/provider/auth_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  static String get routeName => 'SignUpPage';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController pwController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: idController,
            ),
            TextField(
              controller: pwController,
            ),
            ElevatedButton(
              onPressed: () async {
                final AuthManage manage = AuthManage();
                final re =
                    await manage.createUser(idController.text, pwController.text);

              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
