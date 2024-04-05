import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/data/models/user_model.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/data/repositories/user_repo.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepo _userRepository;

  SignUpBloc({required UserRepo userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        UserModel user = await _userRepository.signUp(
            myUser: event.user, password: event.password);
        await _userRepository.setUserData(myUser: user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
