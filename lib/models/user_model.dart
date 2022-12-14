class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  bool? isVerified;
  String? image;
  String? bio;
  String? cover;

  UserModel({
    this.name,
      this.email,
      this.phone,
      this.uid,
   this.isVerified,
   this.image,
   this.bio,
   this.cover,
     });


  UserModel.fromJson(Map<String,dynamic>? json)
  {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    uid = json?['uid'];
    isVerified = json?['isVerified'];
    image = json?['image'];
    bio = json?['bio'];
    cover = json?['cover'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'uid' : uid,
      'isVerified' : isVerified,
      'image' : image,
      'bio' : bio,
      'cover' : cover,
    };
  }


}