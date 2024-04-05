import 'package:firebase_auth_bloc_demo/firebase_auth/presentation/manager/authentication/authentication_bloc.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/presentation/manager/sign_in/sign_in_bloc.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/presentation/pages/home_page.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return BlocProvider(
            create: (context) => SignInBloc(
                userRepository:
                    context.read<AuthenticationBloc>().userRepository),
            child: const HomePage(),
          );
        } else {
          return const WelcomePage();
        }
      },
    );
  }
}
