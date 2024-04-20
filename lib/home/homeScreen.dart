import 'package:bynryapp/common/containers/primary_header_container.dart';
import 'package:bynryapp/common/myAppBar/home_appBar.dart';
import 'package:bynryapp/common/mygridview/myGridView.dart';
import 'package:bynryapp/utils/constants/colors.dart';
import 'package:bynryapp/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  void signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.speedometer), label: "DashBoard"),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.archive), label: "Usage"),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.repeat), label: "History"),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.call), label: "Support"),
            ]),
        backgroundColor: TColors.grey.withOpacity(0.1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///--Header --
              TPrimaryHeaderContainer(
                height: 250,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      THomeAppBar(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quick Actions",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: TColors.primary,
                                )),
                    Container(
                      height: 280,
                      child: MyGridView(),
                    ),
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: TColors.darkGrey.withOpacity(0.3)),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        Text(
                          "Gas | ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: TColors.black),
                        ),
                        Text(
                          "SA1234567",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: TColors.primary),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.defaultSpace,
                    ),
                    Container(
                      height: 110,
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(TSizes.cardRadiusMd),
                          color: TColors.lightGrey,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 0.1,
                                color: TColors.darkGrey)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.dollar_circle,
                                size: TSizes.iconLg * 1.5,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Bills",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: TColors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "20 JAN 2024",
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "43\$",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.orange),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
