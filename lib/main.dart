
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/layout/login/login.dart';
import 'package:social_app/layout/social_layout/Social.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';

import 'package:social_app/share/bloc_observer.dart';
import 'package:social_app/share/components/constans.dart';
import 'package:social_app/share/network/local/cache_helper.dart';
import 'package:social_app/style/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
CacheHelper.sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  Widget widget;

     uid =  CacheHelper.getData(key: 'uid');
      print(uid);

  if(uid != '' || uid != null ){
    widget = Social();
  }else {

    widget = SocialLogin();
  }
  runApp(MyApp(
    startWidget : widget,
  ));
}
class MyApp extends StatelessWidget {
 final Widget? startWidget;

   MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
   create: (context) => SocialCubit()..getUsers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
        themeMode: ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}


