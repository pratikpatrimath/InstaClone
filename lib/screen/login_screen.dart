import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone/resources/auht_methods.dart';
import 'package:instaclone/responsive/mobilescreen.dart';
import 'package:instaclone/responsive/responsive_layout.dart';
import 'package:instaclone/responsive/webscreen.dart';
import 'package:instaclone/screen/signup.dart';
import 'package:instaclone/utils/colors.dart';
import 'package:instaclone/utils/utils.dart';
import 'package:instaclone/widgets/text_field_input.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isloading = false;

  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  loginuser() async {
    setState(() {
      isloading = true;
    });
    String res = await AuthMethods().loginUser(
        email: emailcontroller.text, password: passwordcontroller.text);
    if (res == 'success') {
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const ResponsiveLayout(
                mobilescreen: MobileScreen(),
                webscreen: WebScreen(),
              ),
            ),
            (route) => false);

        setState(() {
          isloading = false;
        });
      }
    } else {
      setState(() {
        isloading = false;
      });
      if (context.mounted) {
        showSnackBar(context, res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              flex: 1,
            ),
            SvgPicture.asset(
              "assets/ic_instagram.svg",
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            TextFieldInput(
                textEditingController: emailcontroller,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress),
            const SizedBox(
              height: 24,
            ),
            TextFieldInput(
                textEditingController: passwordcontroller,
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                isPass: true),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: loginuser,
              child: Container(
                child: isloading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: blueColor),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Signupscreen()));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
