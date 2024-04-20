import 'package:bynryapp/common/myAppBar/appbar.dart';
import 'package:bynryapp/utils/constants/colors.dart';
import 'package:bynryapp/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class THomeAppBar extends StatelessWidget {
  User user = FirebaseAuth.instance.currentUser!;
  THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void signOutUser() {
      FirebaseAuth.instance.signOut();
    }

    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: TColors.white),
          ),
          Text(
            user.email.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.grey),
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.user,
              color: TColors.white,
            )),
        IconButton(
            onPressed: () {
              signOutUser();
            },
            icon: Icon(
              Iconsax.logout,
              color: TColors.white,
            ))
      ],
    );
  }
}
