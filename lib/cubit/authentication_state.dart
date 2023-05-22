import 'package:equatable/equatable.dart';
import 'package:fireauth/fireauth.dart';

enum AuthenticationStatus { initial, logging, success, error }

class AuthenticationState extends Equatable {
  final User? user;
  final bool loading;
  final String email;
  final String password;
  final AuthenticationStatus status;

  const AuthenticationState(
      {this.user,
      this.loading = false,
      required this.email,
      required this.password,
      required this.status});

  factory AuthenticationState.initial() {
    return const AuthenticationState(
        email: '', password: '', status: AuthenticationStatus.initial);
  }

  AuthenticationState copyWith(
      {User? user,
      bool? loading,
      String? email,
      String? password,
      AuthenticationStatus? status}) {
    return AuthenticationState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
