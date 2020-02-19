import 'package:flutter/material.dart';
import 'package:login_bloc/bloc/bloc.dart';
// import 'package:login_bloc/bloc/provider.dart';
import 'package:provider/provider.dart';
import 'package:login_bloc/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Provider<Bloc>(
      builder: (context)=>Bloc(),
      dispose: (context,bloc)=>bloc.dispose(),
      child: MaterialApp(
        home: Scaffold(
          body: LoginScreen(),
        ),
      )
    );
  }
}