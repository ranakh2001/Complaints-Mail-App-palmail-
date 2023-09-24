import 'package:finalproject/models/user.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../controller/auth_controller.dart';
import '../guest/guest-screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const id = '/loginScreen';

  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCofController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  void submitLogin() {
    if (_formKey.currentState!.validate()) {
      final body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      login(body).then((user) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', userToJson(user!));
        if (mounted) {
          Navigator.pushNamed(context, GuestScreen.id);
        }
      }).catchError((err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.red,
        ));
      });
      // if (user.user!.role != null && user.user!.role!.id == 1) {
      //   // Handle guest user
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => GuestScreen(), // Pass the user object here
      //     ),
      //   );
      // } else if (user.user!.role != null && user.user!.role!.id == 3) {
      //   // Handle editor user
      //   Navigator.pushNamed(context, HomePage.id);
      // } else if (user.user!.role != null && user.user!.role!.id == 4) {
      //   // Handle admin user
      //   Navigator.pushNamed(context, AdminScreen.id);
      // } else {
      //   print('Other user');
      // }

      // }).catchError((err){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err),),);
      // });
    }
  }

  void submitRegister() async {
    if (_formKey2.currentState!.validate()) {
      try {
        final newUser = await registerUser(
          emailController.text,
          passwordController.text,
          passwordCofController.text,
          namecontroller.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration completed successfully'),
            backgroundColor: Colors.green,
          ),
        );
        emailController.clear();
        passwordController.clear();
        passwordCofController.clear();
        namecontroller.clear();
      } catch (e) {
        print('Registration error: $e');
      }
    }
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //fix the error when open keyboard
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Container(
              height: 270,
              width: 571,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                gradient: LinearGradient(
                  colors: [kgrdiantC1, kgrdiantC2],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Image.asset('assets/images/palestine_bird.png'),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'ديوان رئيس الوزراء',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 220,
                bottom: 120,
                left: 15,
                right: 15,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(70),
                  child: Container(
                    height: 600,
                    width: 420,
                    decoration: BoxDecoration(
                      color: kscaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffEAEAF5),
                            ),
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme:
                                  Theme.of(context).colorScheme.copyWith(
                                        surfaceVariant: Colors.transparent,
                                      ),
                            ),
                            child: TabBar(
                              unselectedLabelColor: Colors.blue,
                              labelColor: Colors.white,
                              indicatorColor: Colors.white,
                              indicatorWeight: 2,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              controller: tabController,
                              tabs: const [
                                Tab(text: "Login"),
                                Tab(text: "Sign Up"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        // Login Tab View
                        Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  controller: emailController,
                                  label: 'Enter Email',
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter the email';
                                    } else if (!EmailValidator.validate(
                                        value)) {
                                      return 'please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextField(
                                  label: 'Password',
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter password';
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  autofillHints: const [AutofillHints.password],
                                ),
                                CustomButton(
                                  onPressed: submitLogin,
                                  //submitLogin,
                                  text: 'Login',
                                  padding: const EdgeInsets.only(top: 80),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Sign Up Tab View
                        Center(
                          child: Form(
                            key: _formKey2,
                            child: Column(
                              children: [
                                CustomTextField(
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter the email';
                                    } else if (!EmailValidator.validate(
                                        value)) {
                                      return 'please enter a valid email';
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  label: 'Enter email or username',
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: [],
                                ),
                                CustomTextField(
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter password';
                                    }
                                    return null;
                                  },
                                  controller: passwordCofController,
                                  label: 'Password',
                                  autofillHints: [],
                                ),
                                CustomTextField(
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter name';
                                    }
                                    return null;
                                  },
                                  controller: passwordController,
                                  label: 'Confirm password',
                                  autofillHints: [],
                                ),
                                CustomTextField(
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'please enter Password Confirmation';
                                    }
                                    return null;
                                  },
                                  controller: namecontroller,
                                  label: 'name',
                                  autofillHints: [],
                                ),
                                CustomButton(
                                  onPressed: submitRegister,
                                  text: 'Sign Up',
                                  padding:
                                      const EdgeInsets.only(top: 50, bottom: 8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
