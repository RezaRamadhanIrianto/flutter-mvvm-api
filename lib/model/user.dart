import 'dart:convert';

import 'package:http/http.dart' as http;

class User{
  String id;
  String email;
  String firstName;
  String lastName;
  String avatar;


  User({
    this.id, this.email, this.lastName, this.firstName, this.avatar
  });
  //                                      String , Belakangnya tipe datanya dinamis
  factory User.createUser(Map<String, dynamic> object){
    
    var user =  User(
      id: object['id'].toString(),
      email: object['email'],
      firstName: object['first_name'],
      lastName: object['last_name'],
      avatar: object['avatar'],
    );
    
    return user;
  }
  // Paramenter yang di butuhkan untuk ke API
  static Future<User> getUsersFromAPI(int id) async{
    String apiURL = "https://reqres.in/api/users/" + id.toString();

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
  
    return User.createUser(userData);
  }
}
class UnitializedUser extends User{}