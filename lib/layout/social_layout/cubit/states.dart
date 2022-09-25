abstract class SocialStates {}

class InitialGetUserState extends SocialStates{}

class LoadingGetUserState extends SocialStates{}
class SuccessGetUserState extends SocialStates{}
class ErrorGetUserState extends SocialStates{
  final String error ;

  ErrorGetUserState(this.error);
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
class ErrorEditProfileImageState extends SocialStates{

}

class SuccessEditProfileCoverState extends SocialStates{}
class ErrorEditProfileCoverState extends SocialStates{

}