import 'package:bynryapp/common/snackbar/myCustonSnackbar.dart';
import 'package:bynryapp/utils/constants/image_strings.dart';
import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:bynryapp/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    /// sendPasswordResetMail

    void sendPasswordResetMail() async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          content: MySnackbarWidget(
            errorText: "Email sent succesfully",
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
          duration: Duration(seconds: 2),
        ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'channel-error') {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // image
            Image(
              image: const AssetImage(TImages.deliveredEmailIllustration),
              width: 200,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Title and Subtitle
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            // buttons

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(TTexts.done)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    sendPasswordResetMail();
                  },
                  child: const Text(TTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
