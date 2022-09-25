

import 'package:social_app/layout/register/cubit/state.dart';

abstract class StatesRegister {}
class StateInitialRegister extends StatesRegister {}
class StateLoadingRegister extends StatesRegister {}

class StateSuccessRegister extends StatesRegister {

}

class StateErrorRegister extends StatesRegister {
  final String error ;

  StateErrorRegister(this.error);

}
class StatePasswordVisibilityRegister extends StatesRegister {}

class StateLoadingCreate extends StatesRegister {}

class StateSuccessCreate extends StatesRegister {
  final String uid;

  StateSuccessCreate(this.uid);
}

class StateErrorCreate extends StatesRegister {
  final String error ;

  StateErrorCreate(this.error);

}
