import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/share/components/components.dart';

class ChatsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates> (
      listener : (context , builder ) {},
      builder : (context , builder ) {
          return ListView.separated(
              itemBuilder: (context , index ) => buildChatItem(),
              separatorBuilder: (context , index ) => myDivider(),
              itemCount: 10);
        }

    );



  }

  Widget buildChatItem ()=> InkWell(
    onTap: (){},
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children:  [
          CircleAvatar(
            backgroundImage:
            NetworkImage('https://img.freepik.com/free-photo/beautiful-woman-wearing-hijab_23-2149288928.jpg?size=626&ext=jpg&uid=R79215799&ga=GA1.2.1667610189.1663195053'),
            radius: 25.0,
          ),
          SizedBox(width: 10.0,),
          Text('sara Elgamal',
          ),

        ],
      ),
    ),
  );
}
