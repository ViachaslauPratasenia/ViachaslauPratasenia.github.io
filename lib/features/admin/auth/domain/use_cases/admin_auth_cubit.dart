import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminAuthCubit extends Cubit<bool> {
  AdminAuthCubit() : super(false);

  Future<void> login({required String email, required String password}) async {
    try {
      // login to firebase auth
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      final token = await credential.user;
      print('asdas');
    } catch (e) {

      print('asdas');
    }
  }
}