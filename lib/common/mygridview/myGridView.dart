import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gridviewMap = [
      {
        "title": "Bills",
        "path": "assets/icons/bill.png",
      },
      {
        "title": "Disconnect",
        "path": "assets/icons/unlink.png",
      },
      {
        "title": "Transfer",
        "path": "assets/icons/update.png",
      },
      {
        "title": "Services",
        "path": "assets/icons/support.png",
      },
      {
        "title": "Complaints",
        "path": "assets/icons/bad-review.png",
      },
      {
        "title": "Update",
        "path": "assets/icons/bill.png",
      },
      {
        "title": "Connect",
        "path": "assets/icons/update.png",
      },
      {
        "title": "Outage",
        "path": "assets/icons/unlink.png",
      },
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: gridviewMap.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(0.0),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "${gridviewMap.elementAt(index)['path']}"))),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${gridviewMap.elementAt(index)['title']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
