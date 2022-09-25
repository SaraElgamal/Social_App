import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/login/login.dart';
import 'package:social_app/share/components/components.dart';


class NewPost extends  StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      appBarDefaultTheme(context: context,
        title: 'Add Post',
         ),
      body: defaultButton(text: 'LOG OUT', function: (){
        navigateTo(context, SocialLogin());
      }),
    );
  }
}
