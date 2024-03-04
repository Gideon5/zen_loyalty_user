import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zen_app/screens/home_screen.dart';

// import '../widgets/text_field_input.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  bool _isLoading = false;
  late Map<String, dynamic> responseData = {};
  late Map<String, dynamic> customerData = {};

  Future<void> signUp() async {
    setState(() {
      _isLoading = true;
    });
    print('hello pressed');
    final String url =
        'https://eloyaltyhttpendpoints.azurewebsites.net/api/CreateCustomerUser';
    final Map<String, dynamic> userData = {
      "userName": _userNameController.text,
      "password": _passwordController.text,
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      // Handle successful signup
      setState(() {
        responseData = json.decode(response.body);
      });
      print("Signup Successful!");
      // print(json.decode(response.body));
      // Print response body

      final int userId = responseData['customer']['customerUserId'];
      final String token = responseData['token'];

      final String getUrl =
          'https://eloyaltyhttpendpoints.azurewebsites.net/api/GetCustomerUser?id=$userId&code=$token';

      final res = await http.get(Uri.parse(getUrl));

      // if (res.statusCode == 200) {
      //   // final customerUserData = json.decode(response.body);
      //   setState(() {
      //     customerData = json.decode(res.body);
      //   });
      //   print('logged in');
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => HomeScreen()));
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   // Implement the logic to handle customer user `data
      //   print("Customer user data: $customerData");
      //   // Implement the logic to set the authentication state based on your app's requirements
      // } else {
      //   print("Error fetching customer user data: ${res.statusCode}");
      //   // print(res);
      // }
    } else {
      setState(() {
        _isLoading = false;
      });
      // Handle signup failure
      print("Signup Failed!");
      // print(response);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(customerData);
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
                  const SizedBox(height: 64),
                  Text(
                    'Sign Up',
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
                        Icons.phone,
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

                  // TextFieldInput(
                  //     textEditingController: _userNameController,
                  //     hintText: "Username",
                  //     textInputType: TextInputType.text),
                  // const SizedBox(height: 24),

                  //Text field for email

                  // const SizedBox(height: 24),
                  // TextFieldInput(
                  //   textEditingController: _passwordController,
                  //   hintText: "Password",
                  //   textInputType: TextInputType.text,
                  //   isPass: true,
                  // ),
                  // const SizedBox(height: 24),

                  const SizedBox(height: 24),
                  InkWell(
                    onTap: signUp,
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
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            )
                          : const Text(
                              'Sign up',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                        child: Text("Already have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          margin: EdgeInsetsDirectional.only(start: 3),
                          child: Text(
                            "Login",
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
