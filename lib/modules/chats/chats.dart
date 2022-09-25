import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/modules/chat_details/chat_details.dart';
import 'package:social_app/share/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class ChatsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates> (
      listener : (context , builder ) {},
      builder : (context , builder ) {
          return ConditionalBuilder(
              condition: SocialCubit.get(context).allUser.length > 0,
              builder: (context) =>  ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context , index ) => buildChatItem(SocialCubit.get(context).allUser[index],context),
                  separatorBuilder: (context , index ) => myDivider(),
                  itemCount: SocialCubit.get(context).allUser.length),
              fallback: (context) => Center(child: CircularProgressIndicator()));


        }

    );



  }

  Widget buildChatItem (UserModel model, context)=> InkWell(
    onTap: (){
  navigateTo(context, ChatDetails(
    userModel: model,
  ),);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children:  [
          CircleAvatar(
            backgroundImage:
            NetworkImage('${model.image}'),
            radius: 25.0,
          ),
          SizedBox(width: 10.0,),
          Text('${model.name}',
            style: TextStyle(fontSize: 18.0),
          ),

        ],
      ),
    ),
  );
}
