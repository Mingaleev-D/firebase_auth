part of 'my_user_bloc.dart';

abstract class MyUserState extends Equatable {
  const MyUserState();
}

class MyUserInitial extends MyUserState {
  @override
  List<Object> get props => [];
}
