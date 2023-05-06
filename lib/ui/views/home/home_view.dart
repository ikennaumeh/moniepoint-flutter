import 'package:flutter/material.dart';
import 'package:moniepoint/ui/shared/item_card.dart';
import 'package:moniepoint/ui/utilities/device_scaler.dart';
import 'package:moniepoint/ui/utilities/palette.dart';
import 'package:moniepoint/ui/views/home/item_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      expandedHeight: 200,
                      backgroundColor: Palette.white,
                      flexibleSpace: FlexibleSpaceBar(
                        background: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Image.asset(
                              "assets/images/photo1.jpg",
                              width: deviceWidth,
                              fit: BoxFit.cover,
                            ),
                            Image.asset("assets/images/photo2.jpg", width: deviceWidth, fit: BoxFit.cover),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: ContentsHeader(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 7
                        ),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const ItemDetailsView(),
                              ),
                              ),
                            child: const ItemCard());
                        }, 
                        childCount: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                searchBar
              ],
            ),
          ),
        ));
  }
}



Widget get searchBar {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              cursorColor: Palette.grey,
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Palette.grey,
                ),
                border: OutlineInputBorder(borderSide: BorderSide(color: Palette.grey)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Palette.grey)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Badge(
              backgroundColor: Palette.pink,
              label: Text("1"),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Badge(
              backgroundColor: Palette.pink,
              label: Text("9+"),
              child: Icon(Icons.comment_outlined),
            ),
          ),
        ],
      ),
    ),
  );
}

class ContentsHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: Palette.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Sale Product",
                  style: TextStyle(fontSize: 16.sf, fontWeight: FontWeight.w600, color: Palette.textColor),
                ),
                Text(
                  "See more",
                  style: TextStyle(fontSize: 14.sf, fontWeight: FontWeight.w600, color: Palette.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 65;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
