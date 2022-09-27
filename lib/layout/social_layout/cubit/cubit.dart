import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/message_model.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chats/chats.dart';
import 'package:social_app/modules/new_post/new_post.dart';
import 'package:social_app/modules/profile/profile.dart';

import 'package:social_app/modules/users/users.dart';
import 'package:social_app/modules/Home/home.dart';
import 'package:social_app/share/components/constans.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(InitialGetUserState());

  static SocialCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth auth = FirebaseAuth.instance;

  //get user => auth.currentUser;

  UserModel? model;

  void getUsers() {
    emit(LoadingGetUserState());

    FirebaseFirestore.instance.collection('users')
        .doc(uid)
        .get()
        .then((value) {
      model = UserModel.fromJson(value.data());

      emit(SuccessGetUserState());
    })
        .catchError((error) {
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

  void changeBottomIndex(int index) {
    if (index == 1) {
      getFriends();
    }
    if (index == 2) {
      emit(PostBottomNavState());
    }

    else {
      currentIndex = index;
      emit(ChangeBottomNavState());
    }
  }

  List <UserModel> allUser = [];

  void getFriends() {
    if (allUser.length == 0) {
      FirebaseFirestore.instance.collection('users').get()
          .then((value) {
        value.docs.forEach((element) {
          if (element.data()['uid'] != model?.uid) {
            allUser.add(UserModel.fromJson(element.data()));
          }
        });

        emit(SuccessAllUsersState());
      })
          .catchError((error) {
        print(error.toString());
        emit(ErrorAllUsersState(error));
      });
    }
  }

  File? profileImage;

  final ImagePicker picker = ImagePicker();

  Future<void> getProfileImage() async {
    final XFile? picekdFile = await picker.pickImage(
        source: ImageSource.gallery);

    if (picekdFile != null) {
      profileImage = File(picekdFile.path);
      emit(SuccessEditProfileImageState());
    } else {
      print('No images Selected');
      emit(ErrorEditProfileImageState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final XFile? picekdFile = await picker.pickImage(
        source: ImageSource.gallery);

    if (picekdFile != null) {
      coverImage = File(picekdFile.path);
      emit(SuccessEditProfileCoverState());
    } else {
      print('No images Selected');
      emit(ErrorEditProfileCoverState());
    }
  }



  void uploadImage({
    required String name,
    required String phone,
    required String bio,
}) {
    emit(LoadingUserUpdateDataState());

    firebase_storage.FirebaseStorage.instance
        .ref().child('users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!).then((value) {
    //  emit(SuccessUploadProfileImageState());
      value.ref.getDownloadURL().then((value) {
        print(value);
       updateUser(
         name: name,
           phone: phone,
           bio: bio,
         image: value,
       );

        emit(SuccessUploadProfileImageState());
      }).catchError((error) {
        print(error.toString());
        emit(ErrorUploadProfileImageState());
      });
    }).catchError((error) {
      print('error in big then');
      print(error.toString());

      emit(ErrorUploadProfileImageState());
    });
  }



  void uploadCover({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(LoadingUserUpdateDataState());
    firebase_storage.FirebaseStorage.instance
        .ref().child('users/${Uri
        .file(coverImage!.path)
        .pathSegments
        .last}')
        .putFile(coverImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
      updateUser(
        name: name,
        phone: phone,
        bio: bio,
        cover: value,
      );
      //  emit(SuccessUploadProfileCoverState());
      }).catchError((error) {
        emit(ErrorUploadProfileCoverState());
      });
    }).catchError((error) {
      emit(ErrorUploadProfileCoverState());
    });
  }



  void updateUser({
    required String name,
    required String phone,
    required String bio,
     String? cover ,
     String? image ,
})
  {


  UserModel userModel = UserModel(
  name: name,
  phone: phone,
  bio: bio,
  uid: model?.uid,
  cover: cover?? model?.cover,
  email:  model?.email,
  image: image?? model?.image,
  isVerified: false,
  );

  FirebaseFirestore.instance.collection('users')
      .doc(model?.uid).update(userModel.toMap())
      .then((value) {
  getUsers();
  })
      .catchError((error)
  {
  emit(ErrorUpdateProfileCoverState());
  });
  }

  File? postImage;

  Future<void> getPostImage() async {
    final XFile? picekdFile = await picker.pickImage(
        source: ImageSource.gallery);

    if (picekdFile != null) {
      postImage = File(picekdFile.path);
      emit(SuccessEditPostImageState());
    } else {
      print('No images Selected');
      emit(ErrorEditPostImageState());
    }
  }

  void uploadPostImage({

    required String dateTime,
    required String text,


  }) {
    emit(LoadingCreatePostState());
    firebase_storage.FirebaseStorage.instance
        .ref().child('posts/${Uri
        .file(postImage!.path)
        .pathSegments
        .last}')
        .putFile(postImage!).then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
     createPost(dateTime: dateTime,
         text: text,
     postImage: value,
     );
      }).catchError((error) {
        emit(ErrorUpCreatePostState());
      });
    }).catchError((error) {
      emit(ErrorUpCreatePostState());
    });
  }
  void removePostImage(){
    postImage = null;
    emit(SuccessRemovePostImageState());
  }
  void createPost({

    required String dateTime,
    required String text,
    String? postImage,

  })
  {
    emit(LoadingCreatePostState());

    PostModel postModel = PostModel(
     name: model?.name,
      uid: model?.uid,
      image: model?.image,
      dateTime: dateTime,
      text: text,
      postImage: postImage??'',
    );

    FirebaseFirestore.instance.collection('posts')

        .add(postModel.toMap())
        .then((value) {
      emit(SuccessCreatePostState());
    })
        .catchError((error)
    {
      emit(ErrorUpCreatePostState());
    });
  }
  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> likes = [];
  void getPosts()
  {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) 
    {

      value.docs.forEach((element)
      {
        element.reference
        .collection('likes')
        .get()
        .then((value) {

          likes.add(value.docs.length);
          postId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        })
        .catchError((error)
        {

        });


      });
          emit(SuccessGetPostsState());
    })
        .catchError((error)
    {
      emit(ErrorGetPostsState(error.toString()));
    });
  }

  void likesPost (String postId)
  {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(model?.uid)
        .set({'likes': true})
    .then((value) {
      emit(SuccessLikesPostState());
    })
        .catchError((error){
     emit(ErrorUpLikesPostState());
    });
  }

  void sendMessage ({
  required String receiverId,
  required String dateTime,
  required String text,
})
  {
    MessageModel messageModel = MessageModel
      (
       text:  text,
      dateTime: dateTime,
      receiverId: receiverId,
      senderId: model?.uid,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model?.uid)
    .collection('chats')
    .doc(receiverId)
    .collection('messages')
    .add(messageModel.toMap())
    .then((value) {
      emit(SuccessSendMessageState());
    })
    .catchError((){
      emit(ErrorUpSendMessageState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(model?.uid)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SuccessSendMessageState());
    })
        .catchError((){
      emit(ErrorUpSendMessageState());
    });
  }
  
  List<MessageModel> messages = [];
  
  void getMessages ({
    required String receiverId,
})
  {
    FirebaseFirestore.instance
        .collection('users')
        .doc(model?.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
    //to order messages
    .orderBy('dateTime')
        .snapshots()
        .listen((event)
    {
      messages = [];
       event.docs.forEach((element)
       {
         messages.add(MessageModel.fromJson(element.data()));
       })  ;
       emit(SuccessGetMessageState());
    });

  }
}