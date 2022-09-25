class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  bool? isVerified;

  UserModel({
    this.name,
      this.email,
      this.phone,
      this.uid,
   this.isVerified,
     });


  UserModel.fromJson(Map<String,dynamic>? json)
  {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    uid = json?['uid'];
    isVerified = json?['isVerified'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uid' : uid,
      'isVerified' : isVerified,
    };
  }


}