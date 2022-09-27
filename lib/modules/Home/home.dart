import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/style/IconBroken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length > 0 && SocialCubit.get(context).model?.uid != null ,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                children:

                [
                  Card(
                    elevation: 5.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(

                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/pathway-middle-buildings-dark-sky-japan_181624-43078.jpg?w=996&t=st=1663261956~exp=1663262556~hmac=485a865e0c69d33fae864bd4da349d841c648b0903f2649561ebdb70330c7425'),
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,

                        ),
                        Text('To be continued...',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildHomeItem(SocialCubit.get(context).posts[index],context, index),
                    separatorBuilder: (context, index) =>
                        SizedBox(
                          height: 5.0,
                        ),
                    itemCount: SocialCubit.get(context).posts.length,),


                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},

    );
  }

  Widget buildHomeItem(PostModel model,context, index) =>
      Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    NetworkImage(
                        '${SocialCubit.get(context).model?.image}'),
                    radius: 25.0,
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('${SocialCubit.get(context).model?.name}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
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
                          Text('${model.dateTime}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
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
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 10.0,
                  start: 10.0,
                ),
                child: Text(
                  '${model.text}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                width: double.infinity,

                child: Wrap(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2.0,
                      ),
                      child: MaterialButton(onPressed: () {},
                        minWidth: 1.0,
                        height: 25.0,
                        padding: EdgeInsets.zero,

                        child: Text(
                          '#software',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2.0,
                      ),
                      child: MaterialButton(onPressed: () {},
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        height: 25.0,
                        child: Text(
                          '#flutter',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    if (model.postImage != '' )
                  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0,),

                    image: DecorationImage(

                      image: NetworkImage(
                          '${model.postImage}'),
                      fit: BoxFit.cover,

                    ),),


                ),
              ),

              Padding   (

                padding: const EdgeInsets.symmetric(
                  vertical: 7.0,
                ),
                child: Row(

                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {

                        },
                        child: Row(
                          children: [
                            Icon(IconBroken.Heart,
                              size: 18.0,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: 5.0,),
                            Text('${SocialCubit.get(context).likes[index]}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconBroken.Chat,
                              size: 18.0,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: 5.0,),
                            Text('0 comments',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
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
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      NetworkImage(
                          '${SocialCubit.get(context).model?.image}'),
                      radius: 18.0,
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[400],
                          ),
                          hintText: 'write a comment ...',
                          border: InputBorder.none,
                        ),
                      ),

                    ),
                    Expanded(
                      child: InkWell(

                        onTap: () {
                          SocialCubit.get(context).likesPost(SocialCubit.get(context).postId[index]);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(IconBroken.Heart,
                              size: 18.0,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: 5.0,),
                            Text('Like',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .caption,
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

}