import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  static UserModel? sessionUser; // Utilisation d'un type nullable

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
      };

  static void saveUser(UserModel user) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = json.encode(user.toMap());
    pref.setString("user", data);
    pref.commit();
  }
  
  static void getUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = pref.getString("user");
  var decode = json.decode(data!);
  sessionUser = UserModel.fromJson(decode);
}


  static Future<void> logOut() async {
  try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("user");
    sessionUser = null;
  } catch (error) {
    print("Error logging out: $error");
  }
}


}
