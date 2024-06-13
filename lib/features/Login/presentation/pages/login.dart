import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memora/config.dart';
import 'package:memora/config/routes/app_router.dart';
import 'package:memora/core/enums/enums.dart';
import 'package:memora/features/Home/presentation/pages/home.dart';
import 'package:memora/features/Login/presentation/bloc/login_bloc.dart';
import 'package:memora/features/detection/presentation/test.dart';
import 'package:memora/features/mainScreen/presentation/pages/mainScreen.dart';
import '../../../../core/components/reusable_components.dart';
import '../../../../core/utilies/app_colors.dart';
import '../widgets/field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  var loginBloc = getIt<LoginBloc>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.status == RequestStatus.success) {
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => Home(
              //             userUID: state.credential!.user!.uid,
              //           )),
              //   (route) => false,
              // );
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(
                      userUID: state.credential!.user!.uid,
                    ),
                  ),
                  (route) => false);
            }
            if (state.status == RequestStatus.failure) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Error"),
                        content: Text(state.failures?.message ?? ""),
                      ));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15.h,
                  ),
                  Text("Hi!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black)),
                  Text("Welcome", style: Theme.of(context).textTheme.bodyLarge),
                  Text(
                    "I'm waiting for you,please enter your details.",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.deepgrayColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1.h,
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
                          return "Enter your e-mail";
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
                        if (val == "" || val.isEmpty) {
                          return "Enter your password";
                        }
                      },
                      txt: "Enter Your Password",
                      type: TextInputType.text),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05.h,
                  ),
                  useButton(
                      onClick: () {
                        loginBloc.add(LOgin(email.text, password.text));
                      },
                      txt: "Login",
                      context: context,
                      bgcolor: AppColors.primaryColor,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.deepgrayColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutesName.signUp);
                        },
                        child: Text("Signup",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
