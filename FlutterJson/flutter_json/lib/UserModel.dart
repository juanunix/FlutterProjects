import 'dart:convert';

class UsersModel {
  final int id;
  final String first_name;
  final String last_name;
  final String avatar;


  UsersModel(this.id, this.first_name, this.last_name, this.avatar);



  /*factory UsersModel.fromJson(Map<String,dynamic> json){

    return UsersModel(id : json['id'],first_name : json['first_name'].toString(), last_name : json['first_name'].toString(),avatar : json['first_name'].toString(),);

    //return UsersModel( id : json['id'], first_name : json['first_name'], last_name : json['last_name'], avatar : json['avtar']);
  }*/

  UsersModel.fromJson(Map json):
        id = json['id'],
        first_name = json['first_name'],
        last_name = json["last_name"],
        avatar = json['avatar'];
  Map toJson() {
    return {'id': id, 'first_name':first_name, 'last_name': last_name, 'avatar': avatar};
  }
}
