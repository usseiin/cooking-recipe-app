// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cooking_recipe_app/services/auth_services.dart';

abstract class AuthState {
  final bool isLoading;
  String? loadingText;
  AuthState(this.isLoading, [this.loadingText = "please wait a moment"]);
}

class AuthStateSignedIn extends AuthState {
  final AuthUser user;
  AuthStateSignedIn(super.isLoading, this.user);
}

class AuthStateRegistring extends AuthState {
  AuthStateRegistring(super.isLoading);
}

class AuthStateLoggingIn extends AuthState {
  AuthStateLoggingIn(super.isLoading);
}

class AuthStateRetrievingPassword extends AuthState {
  AuthStateRetrievingPassword(super.isLoading);
}
