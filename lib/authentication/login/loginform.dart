import 'package:bynryapp/authentication/forgetPassword/forget_password.dart';
import 'package:bynryapp/authentication/signup/signup.dart';
import 'package:bynryapp/common/snackbar/myCustonSnackbar.dart';

import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:bynryapp/utils/constants/text_strings.dart';
import 'package:bynryapp/utils/validators/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iconsax/iconsax.dart';

class loginform extends StatefulWidget {
  const loginform({
    super.key,
  });

  @override
  State<loginform> createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  /// variables
  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();
  bool loginobscureText = true;

// auth
  FirebaseAuth auth = FirebaseAuth.instance;

// methods
  void signInUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await auth.signInWithEmailAndPassword(
          email: loginEmail.text.toString(),
          password: loginPassword.text.toString());
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: MySnackbarWidget(
            errorText: "No user found!",
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 2),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: MySnackbarWidget(
            errorText: "Wrong Password!",
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: MySnackbarWidget(
            errorText: e.code,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 2),
        ));
      }
      // snack bar
    }
  }

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          // -------- form ----------

          //email
          TextFormField(
            controller: loginEmail,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Password
          TextFormField(
            controller: loginPassword,
            validator: (value) => TValidator.validatePassword(value),
            expands: false,
            obscureText: loginobscureText,
            decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        loginobscureText = !loginobscureText;
                      });
                    },
                    icon: Icon(
                        loginobscureText ? Iconsax.eye_slash : Iconsax.eye))),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections / 2,
          ),

          ///Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                  child: const Text(TTexts.forgetPassword)),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// login Button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      signInUser();
                    }
                  },
                  child: const Text(TTexts.login))),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(TTexts.dontHaveAccount),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: const Text(TTexts.signup)),
            ],
          )
        ],
      ),
    );
  }
}
