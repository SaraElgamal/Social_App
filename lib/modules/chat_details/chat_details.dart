import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/message_model.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/style/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';



class ChatDetails extends StatelessWidget {
  UserModel? userModel;
  ChatDetails({this.userModel});

var TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (BuildContext context) {
         SocialCubit.get(context).getMessages
           (receiverId: userModel!.uid!);

          return BlocConsumer<SocialCubit,SocialStates>
          (builder: (context, state) {
            return
              Scaffold
                (
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(
                    children:  [
                      CircleAvatar(
                        backgroundImage:
                        NetworkImage('${userModel?.image}'),
                        radius: 20.0,
                      ),
                      SizedBox(width: 10.0,),
                      Text('${userModel?.name}',
                        style: TextStyle(fontSize: 18.0),
                      ),

                    ],
                  ),

                ),
                body : ConditionalBuilder(
                    condition: SocialCubit.get(context).messages.length > 0,
                    builder: (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                  itemBuilder: (context , index)
                                  {
                                    var messages = SocialCubit.get(context).messages[index];
                                    if(SocialCubit.get(context).model?.uid ==
                                        messages.senderId
                                    )
                                     return buildMyMessages(messages);
                                     return buildMessages(messages);

                                  } ,
                                  separatorBuilder: (context , index) => SizedBox(height: 10.0,),
                                  itemCount: SocialCubit.get(context).messages.length ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.grey[300]!,

                                ),
                              ),
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.end,
                                children:
                                [
                                  Expanded (

                                    child: TextFormField(
                                    controller: TextController,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.grey[400],
                                      ),
                                      hintText: 'type your message here....',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  ),
                                  Container(
                                    height: 50.0 ,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: MaterialButton(

                                      minWidth: 1.0,
                                      color: defaultColor,
                                      onPressed: (){
                                        SocialCubit.get(context).sendMessage
                                          (
                                            receiverId: userModel!.uid!,
                                            dateTime: DateTime.now().toString(),
                                            text: TextController.text);

                                        TextController.text = '';

                                      },
                                      child: Icon( Icons.send, color: Colors.white,), ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ) ,

                    fallback: (context) => Center(child: CircularProgressIndicator())),

              );
    },
            listener: (context, state){});
        }
      );




  }
  Widget buildMessages (MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(

      padding: EdgeInsets.symmetric(vertical: 10.0,
          horizontal: 20.0),

      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20.0),
          topStart: Radius.circular(20.0),
          topEnd: Radius.circular(20.0),
        ),
      ),
      child: Text(model.text!),
    ),
  );
  Widget buildMyMessages (MessageModel model) =>  Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(

      padding: EdgeInsets.symmetric(vertical: 10.0,
          horizontal: 20.0),

      decoration: BoxDecoration(
        color: defaultColor.withOpacity(.4),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(20.0),
          topStart: Radius.circular(20.0),
          topEnd: Radius.circular(20.0),
        ),
      ),
      child: Text(model.text!),
    ),
  ) ;
}
