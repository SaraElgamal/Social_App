
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layout/login/cubit/state.dart';
import 'package:social_app/layout/register/Register.dart';
import 'package:social_app/layout/social_layout/Social.dart';

import 'package:social_app/share/components/components.dart';
import 'package:social_app/share/network/local/cache_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:social_app/style/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

class SocialLogin extends StatelessWidget {

var emailcontroller = TextEditingController();
var passwordcontroller = TextEditingController();
var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,StatesLogin>(
     listener:  (context , state) {
       if(state is StateErrorLogin)
       {
          showToast(
            text: state.error,
            state: ToastStates.ERROR,
          );
          }

       if (state is StateSuccessLogin)
       {


         CacheHelper.saveData(

           key :  'uid',

            value : state.uid,

         ).then((value){

           navigateFinish(context, Social());
         });
       }

     },
        builder: (context , state ) {
       return  Scaffold(
         appBar: AppBar(),
         body:Center(
             child: SingleChildScrollView(
               child:  Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                 key : formKey,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('LOGIN' , style:
                     //to design text
                     Theme.of(context).textTheme.headline4!.copyWith(
                       color: defaultColor,
                     ) ,

                 ),
                   const  SizedBox(height: 15.0,),
                     Text('Login now to browse our hot offer ' , style:
                     //to design text
                     Theme.of(context).textTheme.bodyText1!.copyWith(
                       color: Colors.grey[600],) ,),
                   const  SizedBox(height: 30.0,),
                     defaultField(controller: emailcontroller,
                       validate: (String value)
                       {
                         if (value.isEmpty){
                           return 'email must not be empty';
                         }
                         return null;
                       },
                       label: 'Email Address',
                       prefix: Icons.email_outlined,
                       keyboard: TextInputType.emailAddress,),
                   const  SizedBox(height: 15.0,),

                     defaultField(
                         controller: passwordcontroller,
                         onSubmitted: (value){
    if (formKey.currentState!.validate()){
    LoginCubit.get(context).userLogin(
        email: emailcontroller.text,
    password: passwordcontroller.text); }
                         },
                         validate: (String value)
                         {
                           if (value.isEmpty){
                             return 'password must not be empty';
                           }
                           return null;
                         },
                         label: 'Password',
                         isPassword :   LoginCubit.get(context).isPassword,
                         prefix: Icons.lock_outline,
                         keyboard: TextInputType.visiblePassword,
                         suffix:   LoginCubit.get(context).suffix,
                         onpressed: (){
                    LoginCubit.get(context).changePasswordVisibility();

                         }

                     ),
                   const  SizedBox(height: 20.0,),
                     ConditionalBuilder(
                       condition: state is! StateLoadingLogin ,

                       builder: (context) =>  defaultButton(text: 'LOGIN',

                         function: (){
                         if (formKey.currentState!.validate()){

                           LoginCubit.get(context).userLogin(
                               email: emailcontroller.text,
                               password: passwordcontroller.text);

                         }

                         }
                         ,
                         isUpperCase: true,

                       ),
                       fallback: (context) => Center(child: CircularProgressIndicator()),
                     ),


                     SizedBox(height: 20.0,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        const Text('Don\'t have an account ? '),
                         defaultTextButton(
                           function : (){ navigateTo(context, Register());},
                           text: 'register ',),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
       );
        },
      ),
    );
  }
}
