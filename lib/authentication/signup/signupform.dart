import 'package:bynryapp/authentication/login/login.dart';
import 'package:bynryapp/common/snackbar/myCustonSnackbar.dart';
import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:bynryapp/utils/constants/text_strings.dart';
import 'package:bynryapp/utils/validators/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Signupform extends StatefulWidget {
  const Signupform({Key? key}) : super(key: key);

  @override
  State<Signupform> createState() => _SignupformState();
}

class _SignupformState extends State<Signupform> {
  // Variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  bool obscureText = true;

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    void createUser() async {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: MySnackbarWidget(
            errorTextTitle: "Congratulations!",
            color: Colors.green,
            SvgColor: Colors.green.shade900,
            errorText: "Account Created Succesfully!",
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 2),
        ));
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
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
    }

    return Form(
      key: signupFormKey,
      child: Column(
        children: [
          /// firstname
          TextFormField(
            controller: firstName,
            validator: (value) =>
                TValidator.validateEmptyText('First Name', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          ///lastname
          TextFormField(
            controller: lastName,
            validator: (value) =>
                TValidator.validateEmptyText('Last Name', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          TextFormField(
            controller: email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // phone no
          TextFormField(
            controller: phoneNumber,
            expands: false,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: password,
            validator: (value) => TValidator.validatePassword(value),
            expands: false,
            obscureText: obscureText,
            decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(obscureText ? Iconsax.eye_slash : Iconsax.eye))),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 1.5,
          ),

          // create account button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (signupFormKey.currentState!.validate()) {
                  createUser();
                }
              },
              child: const Text(TTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
