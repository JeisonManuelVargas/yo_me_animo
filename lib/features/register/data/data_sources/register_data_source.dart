import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_me_animo/core/model/user_model.dart';

abstract class RegisterDataSource {
  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> createDataUser({
    required String id,
    required UserModel userModel,
  });
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final String userCollection = 'users';

  RegisterDataSourceImpl({
    required this.db,
    required this.auth,
  });

  @override
  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  @override
  Future<UserModel> createDataUser({
    required String id,
    required UserModel userModel,
  }) async {
    final reference = db.collection(userCollection).doc(id);
    reference.set(userModel.toJson());
    return userModel;
  }
}
