import 'package:bynryapp/authentication/forgetPassword/reset_password.dart';
import 'package:bynryapp/common/snackbar/myCustonSnackbar.dart';
import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:bynryapp/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    /// sendPasswordResetMail

    void sendPasswordResetMail() async {
      try {
        await auth.sendPasswordResetEmail(
            email: emailController.text.toString());

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPassword(
                      email: emailController.text.toString(),
                    )));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'channel-error') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: MySnackbarWidget(
              errorText: "Enter your email",
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
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // headings
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
            // textfields
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // submitButton
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      sendPasswordResetMail();
                    },
                    child: const Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}
