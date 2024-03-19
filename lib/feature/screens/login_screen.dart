import 'package:flutter/material.dart';
import '/core/constants/constants.dart';
import '/feature/screens/mobile_screen.dart';
import '/feature/screens/sign_up_screen.dart';

import '/feature/screens/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  
  // @override
  // void dispose() {
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  // }

  // void loginUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().loginUser(
  //       email: _emailController.text, password: _passwordController.text);

  //   if (res == 'success') {
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const ResponsiveLayout(
  //           webScreenLayout: WebScreenLayout(),
  //           mobileScreenLayout: MobileScreenLayout(),
  //         ),
  //       ),
  //     );
  //   } else {
  //     showSnackBar(res, context);
  //   }
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  void navigateToSignup() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                'Hello Again!',
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(192, 0, 0, 0),
                    letterSpacing: 1.2),
              ),

             const Spacer(),
              // Text field input for email
              TextFieldInput(
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
                hintText: 'Enter your email',
                inputLabel: 'Email',
              ),
              const SizedBox(
                height: 24,
              ),
              // Text field input for password
              TextFieldInput(
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                isPassword: true,
                inputLabel: 'Password',
              ),
              const SizedBox(
                height: 24,
              ),
              // button for login
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MobileScreen())),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    color: Constants.primaryColor,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : const Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 239, 232, 232),
                              letterSpacing: 1.2),
                        ),
                ),
              ),
             const SizedBox(height: 30,),
              
             const Text('Or', style: TextStyle(fontSize: 20,),),
              // Transitioning to sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "You don't have an account ? ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: navigateToSignup,
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
