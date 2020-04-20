import 'dart:async';
import 'package:login_bloc/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get email => _emailController.stream.transform(validaEmail);
  Stream<String> get password => _passwordController.stream.transform(validaPassword);

  Stream<bool> get submitValid => Observable.combineLatest2(email,password,(a,b)=>true);

  Function(String) get changeEmail=> _emailController.sink.add;
  Function(String) get changePassword=> _passwordController.sink.add;

  submit(){
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email $validEmail');
    print('Password $validPassword');
  }

  dispose(){
    _emailController.close(); 
    _passwordController.close();
  }

}
