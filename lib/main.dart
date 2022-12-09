import 'package:blog/veiw/pages/post/detail_page.dart';
import 'package:blog/veiw/pages/post/home_page.dart';
import 'package:blog/veiw/pages/post/update_page.dart';
import 'package:blog/veiw/pages/user/join_page.dart';
import 'package:blog/veiw/pages/user/login_page.dart';
import 'package:blog/veiw/pages/user/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routers.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // 라우트 설계 필요없음. GetX 사용할 예정
      // home: Scaffold(), Router 설정하고 나서 필요없어짐
      initialRoute: Routers.joinForm,
      routes: {
        Routers.home: (context) => HomePage(),
        Routers.detail: (context) => DetailPage(),
        Routers.updateForm: (context) => UpdatePage(),
        Routers.joinForm: (context) => JoinPage(),
        Routers.loginForm: (context) => LoginPage(),
        Routers.userInfo: (context) => UserInfoPage()
      },
    );
  }
}
