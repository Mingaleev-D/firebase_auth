import 'package:firebase_auth_bloc_demo/firebase_auth/data/repositories/user_repo.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/presentation/manager/authentication/authentication_bloc.dart';
import 'package:firebase_auth_bloc_demo/firebase_auth/presentation/pages/authentication_page.dart';
import 'package:firebase_auth_bloc_demo/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(FirebaseUserRepo()));
}

class MyApp extends StatelessWidget {
  final UserRepo userRepo;

  const MyApp(this.userRepo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepo),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const AuthenticationPage(),
      ),
    );
  }
}
