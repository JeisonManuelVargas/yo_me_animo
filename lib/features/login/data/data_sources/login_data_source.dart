import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/model/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> getDataUser({required String id});

  Future<String> validateUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final String userCollection = 'users';

  LoginDataSourceImpl({
    required this.db,
    required this.auth,
  });

  @override
  Future<String> validateUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  @override
  Future<UserModel> getDataUser({required String id}) async {
    final res = await db.collection(userCollection).doc(id).get();
    return UserModel.fromJson(res.data(), res.reference);
  }
}
