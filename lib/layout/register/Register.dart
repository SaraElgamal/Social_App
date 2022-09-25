
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/register/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:social_app/layout/register/cubit/state.dart';
import 'package:social_app/layout/social_layout/Social.dart';
import 'package:social_app/share/components/components.dart';
import 'package:social_app/share/network/local/cache_helper.dart';
import 'package:social_app/style/color.dart';


class Register extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer< RegisterCubit  ,StatesRegister>(
        listener: (context , state) {
       if(state is StateSuccessCreate)
       {
         navigateFinish(context, Social());
       }
        },
        builder: (context , state) {
          return    Scaffold(
          appBar: AppBar(),
          body: Center(
          child: SingleChildScrollView(
          child:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
          key : formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('REGISTER' , style:
              //to design text
              Theme.of(context).textTheme.headline4!.copyWith(
                color: defaultColor,
              ) ,

              ),
             const SizedBox(height: 15.0,),
              Text('Register now to join with friends ' , style:
              //to design text
              Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.grey[600],) ,),
              const SizedBox(height: 30.0,),

              defaultField
                (
                controller: nameController,
                validate: (String value){
                  if (value.isEmpty){
                    return 'name must not be empty';
                  }
                  return null;
                },
                label: 'User Name',
                prefix: Icons.person_outlined,
                keyboard: TextInputType.name,),
              const SizedBox(height: 15.0,),

              defaultField(controller: phoneController,
                validate: (String value){
                  if (value.isEmpty){
                    return 'Phone must not be empty';
                  }
                  return null;
                },
                label: 'User Phone',
                prefix: Icons.phone,
                keyboard: TextInputType.phone,),
              const SizedBox(height: 15.0,),

              defaultField(controller: emailcontroller,
                validate: (String value){
                  if (value.isEmpty){
                    return 'email must not be empty';
                  }
                  return null;
                },
                label: 'Email Address',
                prefix: Icons.email_outlined,
                keyboard: TextInputType.emailAddress,),
              const SizedBox(height: 15.0,),

              defaultField(controller: passwordcontroller,
                  onSubmitted: (value){

                    if (formKey.currentState!.validate()){

                      RegisterCubit.get(context).userRegister(
                        name: nameController.text,
                        phone: phoneController.text,
                        email: emailcontroller.text,
                        password: passwordcontroller.text, ); }
                  },
                  validate: (String value){
                    if (value.isEmpty){
                      return 'password must not be empty';
                    }
                    return null;
                  },
                  label: 'Password',
                  isPassword : RegisterCubit.get(context).isPassword,
                  prefix: Icons.lock_outline,
                  keyboard: TextInputType.visiblePassword,
                  suffix:   RegisterCubit.get(context).suffix,
                  onpressed: (){
                    RegisterCubit.get(context).changePasswordVisibility();

                  }

              ),
              const SizedBox(height: 20.0,),
              ConditionalBuilder(
                condition: true ,

                builder: (context) =>  defaultButton(

                  text: 'Sign Up',

                  function: (){

                    if (formKey.currentState!.validate()){

                      RegisterCubit.get(context).userRegister(
                        name: nameController.text,
                        phone: phoneController.text,
                        email: emailcontroller.text,
                        password: passwordcontroller.text,);


                    }

                  }
                  ,
                  isUpperCase: true,

                ),
                fallback: (context) => Center(child: CircularProgressIndicator()),
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
