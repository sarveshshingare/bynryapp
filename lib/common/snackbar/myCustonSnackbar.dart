import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MySnackbarWidget extends StatelessWidget {
  MySnackbarWidget(
      {super.key,
      required this.errorText,
      this.color = Colors.red,
      this.SvgColor,
      this.errorTextTitle = "Oh Snap!"});
  final String errorText;
  final String errorTextTitle;
  final Color color;
  Color? SvgColor = Colors.red.shade900;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(TSizes.md)),
          height: 90,
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      errorTextTitle,
                      style: const TextStyle(
                          color: Colors.white, fontSize: TSizes.fontSizeLg),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      errorText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: TSizes.fontSizeSm,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(TSizes.md)),
            child: SvgPicture.asset(
              "assets/icons/bubbles.svg",
              height: 48,
              width: 40,
              color: SvgColor,
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              "assets/icons/fail.svg",
              height: 40,
              color: SvgColor,
            ),
            Positioned(
              top: 10,
              child: SvgPicture.asset(
                "assets/icons/close.svg",
                height: 16,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
