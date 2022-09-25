import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/models/user_model.dart';
import 'package:social_app/style/color.dart';

class ChatDetails extends StatelessWidget {
  UserModel? userModel;
  ChatDetails({this.userModel});



  @override
  Widget build(BuildContext context) {
    return Scaffold
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
      body :
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
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
                child: Text('Hello'),
              ),
            ),
            Align(
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
                child: Text('hi'),
              ),
            ) ,
            Spacer(),
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
                      onPressed: (){},
                      child: Icon( Icons.send, color: Colors.white,), ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
