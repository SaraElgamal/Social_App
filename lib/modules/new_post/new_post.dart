import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/login/login.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/share/components/components.dart';
import 'package:social_app/style/IconBroken.dart';
import 'package:social_app/style/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPost extends  StatelessWidget {
var textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>
      (
      listener: (context, state){},
      builder: (context, state){

        return   Scaffold(
          appBar:
          appBarDefaultTheme(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                function: (){
                  var now = DateTime.now();
                if ( SocialCubit.get(context).postImage == null) {
                  SocialCubit.get(context).createPost(
                      dateTime: now.toString(),
                    text: textController.text,); }
                else {
                  SocialCubit.get(context).uploadPostImage
                    (dateTime: now.toString(),
                    text: textController.text,);
                }

              }, text:
                'Post',
              ),
            ],
          ),
          body:   Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(

              children: [
                if(state is LoadingCreatePostState)
         LinearProgressIndicator(),
          Row(
          children:  [
          CircleAvatar(
          backgroundImage:
              NetworkImage('https://img.freepik.com/free-photo/beautiful-woman-wearing-hijab_23-2149288928.jpg?size=626&ext=jpg&uid=R79215799&ga=GA1.2.1667610189.1663195053'),
          radius: 25.0,
        ),
        SizedBox(width: 10.0,),
        Expanded(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
        children: [
        Text('sara Elgamal',
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
        height: 1.4,
        ),

        ),
        SizedBox(width: 5.0,),


        ],
        ),


        ],
        ),
        ),
        ],
        ),
        SizedBox(height: 10.0,),
        Expanded(
        child: TextFormField(
          controller: textController,
        decoration: InputDecoration(
        hintText: 'what is in your mind ? ',
        hintStyle: TextStyle(
        fontSize: 16.0,
        ),
        border: InputBorder.none,
        ),
        ),
        ),
      SizedBox(height: 20.0,),
     if (SocialCubit.get(context).postImage != null)
     Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),

                        image: DecorationImage(

                          image: FileImage(SocialCubit.get(context).postImage!) as ImageProvider,
                          fit: BoxFit.cover,

                        ),),



                    ),
                    IconButton(
                      onPressed: (){
                        SocialCubit.get(context).removePostImage();
                      },
                      icon:
                      CircleAvatar(
                        radius: 10.0,
                        child: Icon(Icons.close, size: 16.0,),
                      ),


                    ),
                  ],
                ),
     SizedBox(height: 20.0,),
        Row(
        children: [
        Expanded(
        child: TextButton(
        onPressed: (){
          SocialCubit.get(context).getPostImage();
        },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        Icon(IconBroken.Image, color: defaultColor,),
        Text('Add Photos'),

        ],
        ),
        ),
        ),
        Expanded(
        child: TextButton(
        onPressed: (){},
        child:
        Text('# tags'),



        ),
        ),
        ],
        ),
        ],
        ),
        ),

        );
      },
    );


  }
}
