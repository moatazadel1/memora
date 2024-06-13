import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/config/routes/app_router.dart';
import 'package:memora/core/components/reusable_components.dart';
import 'package:memora/core/enums/enums.dart';
import 'package:memora/features/signUp/data/models/userModel.dart';
import 'package:memora/features/signUp/presentation/pages/Details.dart';
import '../../../../core/utilies/app_colors.dart';
import '../manager/sign_up_bloc.dart';
import '../widgets/field.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var bloc=BlocProvider.of<SignUpBloc>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 70.h,
          title: Text("Welcome", style: Theme.of(context).textTheme.bodyLarge),
          centerTitle: true,
        ),
        body: BlocConsumer<SignUpBloc, SignUpState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.signstatus == RequestStatus.success) {
              print( ">>>>>>>>>>>>>>>>>>>${state.credential?.user?.uid}");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Details(userUID: state.credential?.user?.uid,),), (
                  route) => false);
            }
            if (state.signstatus == RequestStatus.failure) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text("Error"),
                        content: Text(state.failures?.message ?? ""),
                      ));
            }
          },
          builder: (context, state) {
            if (state.signstatus == RequestStatus.loading) {
              return Center(child: CircularProgressIndicator());
            }
            return Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15.h,
                    ),
                    Text("Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.black)),
                    Text(
                      "write your information to sign up.",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.deepgrayColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1.h,
                    ),
                    Text("User Name",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01.h,
                    ),
                    Field(
                      controller: name,
                      onClick: (val) {
                        if (val == "" || val.isEmpty) {
                          return "Enter your name";
                        }
                      },
                      txt: "Enter Your user",
                      type: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04.h,
                    ),
                    Text(
                      "E-mail Address",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01.h,
                    ),
                    Field(
                        controller: email,
                        onClick: (val) {
                          if (val == "" || val.isEmpty) {
                            return "Enter your name";
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val);
                          if (!emailValid) {
                            return "Invalid e-mail.";
                          }
                        },
                        txt: "Enter Your email ",
                        type: TextInputType.emailAddress),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .04.h,
                    ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01.h,
                    ),
                    Field(
                       secure: true,
                        controller: password,
                        onClick: (val) {
                          if (val == null || val.isEmpty) {
                            return "Password is required.";
                          }
                          if (val.length < 6) {
                            return "Password is Weak.";
                          }
                        },
                        txt: "Enter Your Password",
                        type: TextInputType.text),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05.h,
                    ),
                    useButton(
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            UserModel userModel = UserModel(
                                email: email.text, userName: name.text);
                            bloc.add(Signup(
                                userModel:userModel , password: password.text));
                          }
                        },
                        txt: "Sign Up",
                        context: context,
                        bgcolor: AppColors.primaryColor,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
