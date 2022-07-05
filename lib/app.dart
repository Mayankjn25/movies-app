import 'package:flutter/material.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/theme/app_theme.dart';
import 'package:movies_app/utils/values/constants.dart';
import 'package:movies_app/utils/values/env.dart';

import 'view/home/home_view.dart';




class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,child) {
        return MaterialApp(
          title: Env.title,
          navigatorKey: GlobalKeys.navigationKey,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          home: const HomePage(),
        );
      },
    );
  }

  
}
