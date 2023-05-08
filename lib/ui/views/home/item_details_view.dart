import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moniepoint/ui/utilities/device_scaler.dart';
import 'package:moniepoint/ui/utilities/palette.dart';
import 'package:moniepoint/ui/views/home/tabs/about_item_view.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  double imageOpacity = 0;
  double rowOpacity = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(initAnimation);
  }

  void initAnimation() {
    setState(() {
      imageOpacity = 1;
      rowOpacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.white,
          elevation: 0,
          leading: AnimatedOpacity(
            opacity: imageOpacity,
            duration: const Duration(seconds: 1),
            child: GestureDetector(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Palette.black,
              ),
            ),
          ),
          actions: [
            AnimatedOpacity(
              opacity: imageOpacity,
              duration: const Duration(seconds: 1),
              child: const Icon(
                Icons.favorite_rounded,
                color: Palette.pink,
              ),
            ),
            AnimatedOpacity(
              opacity: imageOpacity,
              duration: const Duration(seconds: 1),
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.share_outlined,
                  color: Palette.black,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: imageOpacity,
              duration: const Duration(seconds: 1),
              child: const Padding(
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Palette.black,
                ),
              ),
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [content, footer],
        ),
      ),
    );
  }

  Widget get content {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: initAnimation,
            child: AnimatedOpacity(
              opacity: imageOpacity,
              duration: const Duration(seconds: 1),
              child: Image.asset("assets/images/shirt.png"),
            ),
          ),
          SizedBox(
            height: 10.scale,
          ),
          AnimatedOpacity(
            opacity: rowOpacity,
            duration: const Duration(seconds: 2),
            child: Row(
              children: [
                const Icon(
                  Icons.wysiwyg,
                  color: Palette.grey,
                  size: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "tokobaju.id",
                  style: TextStyle(fontSize: 12.sf, fontWeight: FontWeight.w600, color: Palette.grey),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: rowOpacity,
            duration: const Duration(seconds: 2),
            child: Padding(
              padding: EdgeInsets.only(top: 10.scale, bottom: 10.scale),
              child: Text(
                "Essential's Men's Short Sleeve Crewneck T-Shirt",
                style: TextStyle(
                  fontSize: 18.sf,
                  fontWeight: FontWeight.w600,
                  color: Palette.textColor,
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: rowOpacity,
            duration: const Duration(seconds: 2),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Palette.amber,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    "4.9 Ratings . 2.3k+ Reviews . 2.9k+ Sold",
                    style: TextStyle(fontSize: 14.sf, color: Palette.grey, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
             opacity: rowOpacity,
            duration: const Duration(seconds: 2),
            child: TabBar(
              indicatorColor: Palette.primary,
              dividerColor: Palette.grey,
              labelColor: Palette.primary,
              labelStyle: TextStyle(
                fontSize: 14.sf,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelColor: Palette.grey,
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sf,
                fontWeight: FontWeight.w700,
              ),
              tabs: const [
                Tab(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About Item",
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Reviews",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.scale,
          ),
          Expanded(
            child: AnimatedOpacity(
               opacity: rowOpacity,
            duration: const Duration(seconds: 2),
              child: const TabBarView(children: [
                AboutViewTab(),
                ColoredBox(
                  color: Palette.white,
                  child: Center(
                    child: Text("Empty"),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget get footer {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ColoredBox(
        color: Palette.white,
        child: SizedBox(
          height: 80.scale,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(fontSize: 14.sf, color: Palette.grey, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$20.00",
                        style: TextStyle(
                          fontSize: 17.sf,
                          color: Palette.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60.scale,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Palette.primary,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Palette.white,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "1",
                        style: TextStyle(fontSize: 14.sf, fontWeight: FontWeight.w600, color: Palette.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.scale,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Palette.textColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 14.sf, fontWeight: FontWeight.w600, color: Palette.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



