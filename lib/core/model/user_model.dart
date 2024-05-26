import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  DocumentReference? id;

  UserModel({
    this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(json, DocumentReference id) => UserModel(
        id: id,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
      );

  factory UserModel.init() => UserModel(
        name: "",
        email: "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };

  Map<String, dynamic> toJsonUpdate() => {
        "name": name,
        "email": email,
      };

  UserModel copyWith({
    String? name,
    String? email,
    DocumentReference? id,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
