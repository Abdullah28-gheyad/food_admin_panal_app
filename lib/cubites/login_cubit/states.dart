abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class GoogleLoginLoadingState extends LoginStates {}

class FacebookLoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {}