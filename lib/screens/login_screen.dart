
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zen_app/resources/auth_methods.dart';
import 'package:zen_app/responsive/mobile_screen_layout.dart';
import 'package:zen_app/screens/signup_screen.dart';
import 'package:zen_app/state/user/auth_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final AuthBloc _authBloc = AuthBloc(authMethods: AuthMethods());

  

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _authBloc.dispose();
    super.dispose();
  }


   Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    _authBloc.login(
      userName: _userNameController.text,
      password: _passwordController.text,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32),
          // padding: EdgeInsets.symmetric(horizontal: 32, vertical: 120),
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            // margin: const EdgeInsets.only(bottom: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 2),
                  //image
                  Image.asset('assets/images/zen-square.jpg'),
                  const SizedBox(height: 94),

                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),

                  //circular widget to acceptt and show slecetde file

                  const SizedBox(height: 24),
                  TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                      hintText: 'Phone Number',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .green), // Change border color when focused
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _userNameController,
                  ),

                  const SizedBox(height: 24),
                  TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.green,
                      ),
                      hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .green), // Change border color when focused
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 24),
                  InkWell(
                    onTap: login,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(255, 14, 160, 21),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      child: _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : const Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Flexible(child: Container(), flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Dont have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          margin: EdgeInsetsDirectional.only(start: 3),
                          child: const Text(
                            "Sign up here",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )

                  //Button login
                  //Transitioning to signup
                ]),
          ),
        ),
      ),
    );
  }
}
