import 'package:bynryapp/utils/constants/colors.dart';
import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:bynryapp/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.loginTitle,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: TColors.white),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: TColors.white),
        ),
      ],
    );
  }
}
