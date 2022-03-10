import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/utils/colors.dart';
import 'package:instaclone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //logo image
              SvgPicture.asset(
                'assets/logo.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              //text field EMAIL
              TextFieldInput(
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 18,
              ),
              //text field password
              TextFieldInput(
                hintText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
                textEditingController: _passwordController,
              ),
              const SizedBox(
                height: 24,
              ),
              //submit button
              Container(
                child: const Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: blueColor,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //signup button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("You don't have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    child: const Text(
                      " Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
              const SizedBox(
                height: 0,
              ),
              const Text(
                'Made with 🤍 by Omar',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
