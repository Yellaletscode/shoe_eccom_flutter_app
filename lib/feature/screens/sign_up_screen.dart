import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../core/constants/data/utils.dart';
import '../auth/auth_methods.dart';
import '/core/constants/constants.dart';
import '/feature/screens/login_screen.dart';
import '/feature/screens/mobile_screen.dart';
import '/feature/screens/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }



  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    _isLoading = true;
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      if (mounted) {
        showSnackBar(res, context);
      }
    } else {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MobileScreen(),
          ),
        );
      }
    }
  }

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              // svg image
            
             const Spacer(),
              // circular widget to accept and show our selected file
              Stack(
                children: [
                  
                      const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                            'https://www.shutterstock.com/image-vector/vector-flat-illustration-grayscale-avatar-600nw-2264922221.jpg',
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              // textField input for username
              TextFieldInput(
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
                hintText: 'Full Name', inputLabel: 'Your Full Name',
              ),
              const SizedBox(
                height: 24,
              ),
              // Text field input for email
              TextFieldInput(
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
                hintText: 'Enter your email', inputLabel: 'Email address',
              ),
              const SizedBox(
                height: 24,
              ),
              // Text field input for password
              TextFieldInput(
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                isPassword: true, inputLabel: 'Password',
              ),
              const SizedBox(
                height: 24,
              ),
      
              
              
              
              InkWell(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MobileScreen())),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    color: Constants.primaryColor,
                  ),
                  child: const Text(
                          'Create my account',
                          style: TextStyle(fontSize: 22, color: Color.fromARGB(231, 255, 255, 255)),
                        ),
                ),
              ),
const SizedBox(height: 20,),
              Text('Or', style: TextStyle(fontSize: 20,),),
              
              
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "I already have an account.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.grey
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Log me in",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
