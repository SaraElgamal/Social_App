import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chats/chats.dart';
import 'package:social_app/modules/new_post/new_post.dart';
import 'package:social_app/modules/profile/profile.dart';

import 'package:social_app/modules/users/users.dart';
import 'package:social_app/modules/Home/home.dart';
import 'package:social_app/share/components/constans.dart';


class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(InitialGetUserState());

  static SocialCubit get(context ) => BlocProvider.of(context);

  final FirebaseAuth auth = FirebaseAuth.instance;
  //get user => auth.currentUser;

  UserModel? model;
  void getUsers(){
    emit(LoadingGetUserState());

    FirebaseFirestore.instance.collection('users')
        .doc(uid)
        .get()
        .then((value){

          model = UserModel.fromJson(value.data());

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
    NewPost(),
    UsersScreen(),
    ProfileScreen(),

  ];

  List <String> titles =
  [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Profile',
  ];

  void changeBottomIndex ( int index)
  {
    if(index == 1) {
     getFriends();
    }
    if(index == 2 )
    {  emit(PostBottomNavState()); }

    else {
      currentIndex = index;
    emit(ChangeBottomNavState()); }
  }

  List <UserModel> allUser = [];
  void getFriends () {

   if(allUser.length == 0) {
  FirebaseFirestore.instance.collection('users').get()
      .then((value)
  {
    value.docs.forEach((element) {
      if( element.data()['uid'] != model?.uid )  {

      allUser.add(UserModel.fromJson(element.data()));

      }

    });

    emit(SuccessAllUsersState());
  })
      .catchError((error)
  {
    print(error.toString());
    emit(ErrorAllUsersState(error));
  });
  } }
   File? profileImage ;
  final ImagePicker picker = ImagePicker();
  Future<void> getProfileImage() async {
  final XFile? picekdFile = await picker.pickImage(source: ImageSource.gallery);

  if(picekdFile != null ) {
    profileImage = File(picekdFile.path);
    emit(SuccessEditProfileImageState());
  } else
  {
    print('No images Selected');
    emit(SuccessEditProfileImageState());
  }

  }

  File? coverImage ;
  Future<void> getCoverImage() async {
    final XFile? picekdFile = await picker.pickImage(source: ImageSource.gallery);

    if(picekdFile != null ) {
      coverImage = File(picekdFile.path);
      emit(SuccessEditProfileCoverState());
    } else
    {
      print('No images Selected');
      emit(SuccessEditProfileCoverState());
    }

  }
}