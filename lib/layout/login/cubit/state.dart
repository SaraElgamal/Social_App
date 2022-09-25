

abstract class StatesLogin {}
class StateInitialLogin extends StatesLogin {}
class StateLoadingLogin extends StatesLogin {}

class StateSuccessLogin extends StatesLogin {
 final String uid;

  StateSuccessLogin(this.uid);
}

class StateErrorLogin extends StatesLogin {
  final String error ;

  StateErrorLogin(this.error);

}
class StatePasswordVisibilityLogin extends StatesLogin {}
