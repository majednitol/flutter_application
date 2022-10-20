class UserModel {
  String? id;
  String? fullname;
  String? email;
  UserModel({required this.id, required this.fullname, required this.email});
  //  Map to object
  UserModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    fullname = map['fullname'];
    email = map['email'];
  }
  //  object to map
  Map<String, dynamic> toMap() {
    return {'id': id, 'fullname': fullname, 'email': email};
  }

  
}

