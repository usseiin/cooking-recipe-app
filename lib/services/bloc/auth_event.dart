abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventSignIn extends AuthEvent {
  final String email;
  final String password;
  const AuthEventSignIn(this.email, this.password);
}

class AuthEventSignUp extends AuthEvent {
  final String email;
  final String password;
  const AuthEventSignUp(this.email, this.password);
}

class AuthEventSignInWithGoogle extends AuthEvent {
  const AuthEventSignInWithGoogle();
}

class AuthEventSignInWithFacebook extends AuthEvent {
  const AuthEventSignInWithFacebook();
}

class AuthEventSignOut extends AuthEvent {
  const AuthEventSignOut();
}

class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

class AuthEventForgetPassword extends AuthEvent {
  final String email;
  const AuthEventForgetPassword(this.email);
}
