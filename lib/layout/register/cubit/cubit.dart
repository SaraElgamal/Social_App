import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_app/layout/register/cubit/state.dart';
import 'package:social_app/models/login_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/share/network/end_point.dart';
import 'package:social_app/share/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<StatesRegister>{
  RegisterCubit() : super(StateInitialRegister());

static RegisterCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel ;
  final FirebaseAuth auth = FirebaseAuth.instance;
 // get user => auth.currentUser;
Future userRegister ({
  required String name,
  required String phone,
  required String email,
  required String password,
})
  async
{
  emit(StateLoadingRegister());

  await auth.createUserWithEmailAndPassword
     (
    email: email,
    password: password,
  ).then((value) {
     userCreate(name: name, phone: phone, email: email,
         uid: value.user!.uid);




   }
   ).catchError((error){
     emit(StateErrorRegister(error.toString()));
   });
}
  Future userCreate ({
    required String name,
    required String phone,
    required String email,
    required String uid,

  })
  async
  {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      isVerified: false,
      bio: 'write your bio',
      cover: 'https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2005.jpg?w=996&t=st=1664129514~exp=1664130114~hmac=2988a5543902e7b3c411c675926dfd315ed616768cede28c652bd9bfd7c09cc6',
      image: 'https://img.freepik.com/premium-photo/young-arab-woman-laughing-happy-carefree-natural-emotion_1187-111861.jpg?w=996',
    );
    emit(StateLoadingCreate());

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap()
    ).then((value) {

      emit(StateSuccessCreate(uid));
    }
    ).catchError((error){
      print(error.toString());
      emit(StateErrorCreate(error.toString()));
    });
  }

 IconData suffix = Icons.visibility_outlined;
 bool isPassword = true;
  void changePasswordVisibility (){

    isPassword = ! isPassword;
    suffix = isPassword ?   Icons.visibility_outlined : Icons.visibility_off_outlined;
      emit(StatePasswordVisibilityRegister());
  }
}