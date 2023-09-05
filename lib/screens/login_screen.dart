import 'package:finalproject/screens/widgets/custom_button.dart';
import 'package:finalproject/screens/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
      backgroundColor: const Color(0xffF9F6FF),
      body: DefaultTabController(
        length: 2,
        child: Stack(
          children: [
            Container(
              height: 270,
              width: 571,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
                color: Color(0xff194DFC),
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
                child: Container(
                  height: 600,
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          // Login Tab View
                          const Center(
                            child: Column(
                              children: [
                                CustomTextField(label: 'Enter Email',keyboardType: TextInputType.emailAddress,),
                                SizedBox(height: 5,),
                                CustomTextField(label: 'Password'),
                                CustomButton(text: 'Login', padding: EdgeInsets.only(top: 80),),
                              ],
                            ),
                          ),

                          // Sign Up Tab View
                          Center(
                            child: Column(
                              children: [
                                const CustomTextField(label: 'Enter email or username',keyboardType: TextInputType.emailAddress,),
                                const CustomTextField(label: 'Password',),
                                const CustomTextField(label: 'Confirm password',),
                                const CustomButton(text: 'Sign Up', padding: EdgeInsets.only(top: 50, bottom: 8),),
                                const Text('OR'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.add)),
                                  ],
                                ),
                              ],
                            ),
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
    );
  }
}



// TabBarView (Content)
// Expanded(
//   child: TabBarView(
//     children: [
//       Center(
//         child: Text("Login Content"),
//       ),
//       Center(
//         child: Text("Sign Up Content"),
//       ),
//     ],
//   ),
// ),
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 80),
//   child: TextField(
//     keyboardType: TextInputType.emailAddress,
//     decoration: InputDecoration(
//       labelText: 'Enter Email',
//     ),
//     onChanged: (value) {},
//   ),
// ),
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 80),
//   child: TextField(
//     keyboardType: TextInputType.emailAddress,
//     decoration: InputDecoration(
//       labelText: 'Password',
//       // You can add more decoration options here
//     ),
//     onChanged: (value) {},
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.only(top: 130),
//   child: ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30),
//       ),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: 80.0, vertical: 15),
//       child: Text(
//         'Login',
//         style: TextStyle(color: Colors.white),
//       ),
//     ),
//   ),
// ),


