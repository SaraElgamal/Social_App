abstract class SocialStates {}

class InitialGetUserState extends SocialStates{}
class LoadingGetUserState extends SocialStates{}
class SuccessGetUserState extends SocialStates{}
class ErrorGetUserState extends SocialStates{
  final String error ;

  ErrorGetUserState(this.error);
}

class ChangeBottomNavState extends SocialStates{}

class PostBottomNavState extends SocialStates{}