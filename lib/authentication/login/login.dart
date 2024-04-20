import 'package:bynryapp/authentication/login/login_header.dart';
import 'package:bynryapp/authentication/login/loginform.dart';
import 'package:bynryapp/common/containers/primary_header_container.dart';
import 'package:bynryapp/utils/constants/sizes.dart';

import 'package:bynryapp/utils/styles/spacing_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------ header

            TPrimaryHeaderContainer(
                height: 300,
                child: Padding(
                  padding: TspacingStyle.paddingWithAppBarheight,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      LoginHeader(),
                    ],
                  ),
                )),

            ///------ form
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: loginform(),
            )
          ],
        ),
      ),
    );
  }
}
