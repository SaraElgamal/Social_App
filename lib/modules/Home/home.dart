import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/style/IconBroken.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children:

          [
            Card(
              elevation: 5.0,
   clipBehavior: Clip.antiAliasWithSaveLayer,
              child:  Stack(

                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image(
                    image: NetworkImage('https://img.freepik.com/free-photo/pathway-middle-buildings-dark-sky-japan_181624-43078.jpg?w=996&t=st=1663261956~exp=1663262556~hmac=485a865e0c69d33fae864bd4da349d841c648b0903f2649561ebdb70330c7425'),
                  height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,

                  ),
                  Text ('To be continued...',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
                  ),
                ],
              ),
            ),
           ListView.separated(
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             itemBuilder: (context , index) => buildHomeItem(context),
               separatorBuilder: (context , index) => SizedBox(
                 height: 5.0,
               ),
               itemCount: 10,),





          ],
        ),
      ),
    );
  }
}
Widget buildHomeItem(context) =>  Card(
  elevation: 5.0,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
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
                      Icon(Icons.check_circle,
                        color: Colors.blue,
                        size: 16.0,
                      ),

                    ],
                  ),
                  Text('september 15, 2022 at 8.05 pm',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0,),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          child: Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey[300],
          ),
        ),
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Container(
          width: double.infinity,

          child: Wrap(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                ),
                child: MaterialButton(onPressed: (){},
                  minWidth: 1.0,
                  height: 25.0,
                  padding: EdgeInsets.zero,

                  child: Text(
                    '#software',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2.0,
                ),
                child: MaterialButton(onPressed: (){},
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  height: 25.0,
                  child: Text(
                    '#flutter',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0,),

            image: DecorationImage(

              image: NetworkImage(
                  'https://img.freepik.com/free-photo/teapot-cups-set-dishes-tea-drinking-wooden-tray_169016-19144.jpg?w=1380&t=st=1663269752~exp=1663270352~hmac=22e2bff2a85891883f1f5408c1729c9e06205b9df149453a9b3fdd5aa1198f76'),
              fit: BoxFit.cover,

            ),),



        ),
        Padding(

          padding: const EdgeInsets.symmetric(
            vertical: 7.0,
          ),
          child: Row(

            children: [
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(IconBroken.Heart,
                        size: 18.0,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 5.0,),
                      Text('120',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(IconBroken.Chat,
                        size: 18.0,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 5.0,),
                      Text('120 comments',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),

        ),
        Container(
          height: 1.0,
          width: double.infinity,
          color: Colors.grey[300],

        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children:  [
              CircleAvatar(
                backgroundImage:
                NetworkImage('https://img.freepik.com/free-photo/beautiful-woman-wearing-hijab_23-2149288928.jpg?size=626&ext=jpg&uid=R79215799&ga=GA1.2.1667610189.1663195053'),
                radius: 18.0,
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Text('write a comment...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize : 14.0,
                  ),

                ),

              ),
              Expanded(
                child: InkWell(
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(IconBroken.Heart,
                        size: 18.0,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 5.0,),
                      Text('Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),

        SizedBox(width: 10.0,),

      ],
    ),



  ),


);