import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/modules/new_post/new_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/share/components/components.dart';
import 'package:social_app/style/IconBroken.dart';
class Social extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener :  (context , state ) {
        if (state is PostBottomNavState)
        {
           navigateTo(context, NewPost(), );
        }
      },
      builder: (context , state ){
        var cubit = SocialCubit.get(context);
      return  Scaffold(
        appBar: AppBar(
          title: Text(cubit.titles[cubit.currentIndex]),
          actions:  [
            IconButton( icon:  Icon( IconBroken.Search,),onPressed: (){},),
            IconButton( icon:  Icon( IconBroken.Notification,),onPressed: (){},),


          ],
        ),
        body: cubit.screens[cubit.currentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index)
          {
            cubit.changeBottomIndex(index);
          },
          items:

          [
          BottomNavigationBarItem(icon: Icon(IconBroken.Home,),
          label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(IconBroken.Chat,),
          label: 'Chats',
          ),
          BottomNavigationBarItem(icon: Icon(IconBroken.Upload,),
          label: 'Post',
          ),
          BottomNavigationBarItem(icon: Icon(IconBroken.Location,),
          label: 'Users',
          ),
          BottomNavigationBarItem(icon: Icon(IconBroken.Setting,),
          label: 'Settings',
          ),
        ],

        ),



      );
      },
    );
  }
}
