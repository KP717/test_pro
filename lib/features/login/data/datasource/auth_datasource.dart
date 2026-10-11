

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDatasource {
  Future<UserCredential> signInWithGoogle();
}


@LazySingleton(as: AuthDatasource)
class AuthDatasourceImpl extends AuthDatasource{

  @override
  Future<UserCredential> signInWithGoogle() async{

      final googleUser = await GoogleSignIn.instance.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

      return FirebaseAuth.instance.signInWithCredential(credential);

  }

}