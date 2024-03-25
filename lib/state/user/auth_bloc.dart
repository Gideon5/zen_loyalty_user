import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_app/resources/Auth_methods.dart';

// Define authentication events
abstract class AuthEvent {}

// Define initial event
class AuthInitial extends AuthState {}

// Define login event
class AuthLogin extends AuthEvent {
  final String userName;
  final String password;

  AuthLogin({required this.userName, required this.password});
}

// Define authentication states
abstract class AuthState {}

// Define loading state
class AuthLoading extends AuthState {}

// Define success state
class AuthSuccess extends AuthState {
  final Map<String, dynamic> userData;
  final Map<String, dynamic> customerData;

  AuthSuccess({required this.userData, required this.customerData});
}

// Define error state
class AuthError extends AuthState {}


// Define AuthBloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthMethods authMethods;

  AuthBloc({required this.authMethods}) : super(AuthInitial()); 

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLogin) {
      yield AuthLoading();

      try {
        final tokenResult = await authMethods.getToken(
          userName: event.userName,
          password: event.password,
        );

        if (tokenResult.containsKey('error')) {
          yield AuthError();
        } else {
          final userId = tokenResult['userId'];
          final token = tokenResult['token'];

          final customerDataResult = await authMethods.getCustomerData(
            userId: userId,
            token: token,
          );

          if (customerDataResult.containsKey('error')) {
            yield AuthError();
          } else {
            yield AuthSuccess(
              userData: tokenResult,
              customerData: customerDataResult,
            );
          }
        }
      } catch (e) {
        yield AuthError();
      }
    }
  }

  void login({required String userName, required String password}) {}
}
