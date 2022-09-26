import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/share/components/components.dart';
import 'package:social_app/style/IconBroken.dart';
import 'package:social_app/style/color.dart';
 // import 'package:firebase_storage/firebase_storage.dart';

class EditProfile extends  StatelessWidget {
var nameController = TextEditingController();
var phoneController = TextEditingController();
var bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates> (
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        nameController.text = userModel!.name!;
        phoneController.text = userModel!.phone!;
        bioController.text = userModel.bio!;
        return Scaffold(
          appBar: appBarDefaultTheme(context: context, title: 'Edit Profile' ,actions:
          [
            TextButton(
                onPressed: (){
                  SocialCubit.get(context).updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      bio: bioController.text);
                },
                child: Text('UPDATE'), ),
          ],
        ),
          body:  Padding(
            padding: const EdgeInsets.all(20.0),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state is LoadingUserUpdateDataState)
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                  ),

                                  image: DecorationImage(

                                    image: coverImage == null ? NetworkImage(
                                        '${userModel.cover}') : FileImage(coverImage) as ImageProvider,
                                    fit: BoxFit.cover,

                                  ),),



                              ),
                              IconButton(
                                onPressed: (){
                                  SocialCubit.get(context).getCoverImage();
                                },
                                  icon:
                                  CircleAvatar(
                                    radius: 20.0,
                                    child: Icon(IconBroken.Camera, size: 18.0,),
                                  ),


                                  ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage:
                                profileImage == null ?
                                NetworkImage('${userModel.image}') :



                                FileImage(profileImage) as ImageProvider ,

                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                SocialCubit.get(context).getProfileImage();
                              },
                              icon:
                              CircleAvatar(
                                radius: 20.0,
                                child: Icon(IconBroken.Camera, size: 18.0,),
                              ),


                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
       if (SocialCubit.get(context).profileImage != null || SocialCubit.get(context).coverImage != null)
                  Row(
                    children: 
                    [
                      if (SocialCubit.get(context).profileImage != null)
                      Expanded(

                        child: Column(
                          children: [
                            defaultButton(
                                text: 'Upload Image',
                                function: (){
                                  SocialCubit.get(context).uploadImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text) ;
                                }),
                            SizedBox(height: 5.0,),
                            if(state is LoadingUserUpdateDataState)
                            LinearProgressIndicator(),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.0,),
            if (SocialCubit.get(context).coverImage != null)
                      Expanded(

                        child: Column(
                          children: [
                            defaultButton(
                                text: 'Upload Cover',
                                function: (){
                                  SocialCubit.get(context).uploadImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text) ;
                                }),
                            SizedBox(height: 5.0,),
                            if(state is LoadingUserUpdateDataState)
                            LinearProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 20.0,),
                  defaultField(
                      controller: nameController,
                      validate: (String value){
                        if(value.isEmpty) {
                          return 'name must not be empty'; }
                        return null;
                      },
                      label: 'Name',
                      prefix: IconBroken.User,
                      keyboard: TextInputType.text),
                      SizedBox(height: 20.0,),
                  defaultField(
                      controller: bioController,
                      validate: (String value){
                        if(value.isEmpty) {
                          return 'bio must not be empty'; }
                        return null;
                      },
                      label: 'Bio',
                      prefix: IconBroken.Info_Circle,
                      keyboard: TextInputType.text),

                  SizedBox(height: 20.0,),
                  defaultField(
                      controller: phoneController,
                      validate: (String value){
                        if(value.isEmpty) {
                          return 'phone must not be empty'; }
                        return null;
                      },
                      label: 'Phone',
                      prefix: IconBroken.Call,
                      keyboard: TextInputType.phone),
                ],
              ),
            ),
          ),
        );


      },
    );
  }
}
