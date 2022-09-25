import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/social_layout/cubit/cubit.dart';
import 'package:social_app/layout/social_layout/cubit/states.dart';
import 'package:social_app/share/components/components.dart';
import 'package:social_app/style/IconBroken.dart';
import 'package:social_app/style/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/edit_profile/edit_profile.dart';

class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer< SocialCubit,SocialStates>
      (
      listener: (context , state) {},
      builder: (context , state) {
        var userModel = SocialCubit.get(context).model;
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                Container(
                  height: 190.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            ),

                            image: DecorationImage(

                              image: NetworkImage(
                                  '${userModel?.cover}'),
                              fit: BoxFit.cover,

                            ),),



                        ),
                      ),
                      CircleAvatar(
                        radius: 64.0,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage:  NetworkImage('${userModel?.image}'),

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0,),
                Text('${userModel?.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text('${userModel?.bio}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('100',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text('Posts',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('64',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text('Photos',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('10k',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text('Followers',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('6k',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text('Following',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 40.0,
                          child: OutlinedButton(

                            onPressed: (){}, child: Text('Add Photo',),),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      OutlinedButton(onPressed: (){
                        navigateTo(context, EditProfile(), );
                      },child: Icon( IconBroken.Edit,
                        color: defaultColor,)),
                    ],
                  ),
                ),
              ],
            ),
          );
      },
    );




  }
}
