abstract class SocialStates {}

class InitialGetUserState extends SocialStates{}

class LoadingGetUserState extends SocialStates{}
class SuccessGetUserState extends SocialStates{}
class ErrorGetUserState extends SocialStates{
  final String error ;

  ErrorGetUserState(this.error);
}

class LoadingGetPostsState extends SocialStates{}
class SuccessGetPostsState extends SocialStates{}
class ErrorGetPostsState extends SocialStates{
  final String error ;

  ErrorGetPostsState(this.error);
}

class LoadingAllUsersState extends SocialStates{}
class SuccessAllUsersState extends SocialStates{}
class ErrorAllUsersState extends SocialStates{
  final String error ;

  ErrorAllUsersState(this.error);
}


class ChangeBottomNavState extends SocialStates{}

class PostBottomNavState extends SocialStates{}

class SuccessEditProfileImageState extends SocialStates{}
class ErrorEditProfileImageState extends SocialStates{}

class SuccessEditProfileCoverState extends SocialStates{}
class ErrorEditProfileCoverState extends SocialStates{

}

class SuccessUploadProfileImageState extends SocialStates{}
class ErrorUploadProfileImageState extends SocialStates{

}

class SuccessUploadProfileCoverState extends SocialStates{}
class ErrorUploadProfileCoverState extends SocialStates{

}

class ErrorUpdateProfileCoverState extends SocialStates{

}
class LoadingUserUpdateState extends SocialStates{


}
class LoadingUserUpdateDataState extends SocialStates{


}
//create post
class LoadingCreatePostState extends SocialStates{


}
class SuccessCreatePostState extends SocialStates{}
class ErrorUpCreatePostState extends SocialStates{}

class SuccessEditPostImageState extends SocialStates{}
class ErrorEditPostImageState extends SocialStates{}

class SuccessRemovePostImageState extends SocialStates{}

class SuccessLikesPostState extends SocialStates{}
class ErrorUpLikesPostState extends SocialStates{}
//chats
class SuccessSendMessageState extends SocialStates{}
class ErrorUpSendMessageState extends SocialStates{}

class SuccessGetMessageState extends SocialStates{}

