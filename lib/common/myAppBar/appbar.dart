import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:bynryapp/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar(
      {Key? key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed})
      : super(key: key);

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: ClipOval(
                      child: Image.network(
                        "https://www.kindpng.com/picc/m/664-6643641_avatar-transparent-background-user-icon-hd-png-download.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
