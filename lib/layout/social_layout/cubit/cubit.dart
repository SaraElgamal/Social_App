import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chats/chats.dart';
import 'package:social_app/modules/settings/settings.dart';
import 'package:social_app/modules/users/users.dart';
import 'package:social_app/modules/Home/home.dart';


class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(InitialGetUserState());

  static SocialCubit get(context ) => BlocProvider.of(context);

  final FirebaseAuth auth = FirebaseAuth.instance;
  get user => auth.currentUser;

  UserModel? model;
  void getUsers(){
    emit(LoadingGetUserState());
    FirebaseFirestore.instance.collection('users')
        .doc('uid')
        .get()
        .then((value){
          model =UserModel.fromJson(value.data());

      emit(SuccessGetUserState());
    })
        .catchError((error){
          print(error.toString());
          emit(ErrorGetUserState(error));
    });

  }
  int currentIndex = 0;



  List <Widget> screens =
  [
    HomeScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),

  ];

  List <String> titles =
  [
    'Home',
    'Chats',
    'Users',
    'Settings',
  ];

  void changeBottomIndex ( int index)
  {

    if(index == 2 )
      emit(PostBottomNavState());

    else {
      currentIndex = index;
    emit(ChangeBottomNavState()); }
  }
}