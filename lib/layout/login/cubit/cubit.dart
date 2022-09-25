

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/login/cubit/state.dart';
import 'package:social_app/models/login_model.dart';


class LoginCubit extends Cubit<StatesLogin>{
  LoginCubit() : super(StateInitialLogin());

static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel ;

  final FirebaseAuth auth = FirebaseAuth.instance;
//  get user => auth.currentUser;

Future userLogin ({
  required String email,
  required String password,
})
 async
{
  emit(StateLoadingLogin());

 await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);


      emit(StateSuccessLogin(value.user!.uid));
} ).catchError((error){
  print ('errorrrrrrr here');
  print (error.toString());
  emit(StateErrorLogin( error.toString()));
} );
}
   IconData suffix = Icons.visibility_outlined;
bool isPassword = true;
  void changePasswordVisibility (){

    isPassword = ! isPassword;
    suffix = isPassword ?   Icons.visibility_outlined : Icons.visibility_off_outlined;
 emit(StatePasswordVisibilityLogin());
  }
}