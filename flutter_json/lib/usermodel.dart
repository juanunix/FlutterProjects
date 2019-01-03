class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel(this.id, this.firstName, this.lastName, this.avatar);

  UserModel.fromJson(Map json):
        id = json['id'],
        firstName = json['first_name'],
        lastName = json["last_name"],
        avatar = json['avatar'];

  Map toJson() {
    return {'id': id, 'first_name':firstName, 'last_name': lastName, 'avatar': avatar};
  }
}