import 'package:flutter/material.dart';
import 'package:moniepoint/ui/utilities/device_scaler.dart';
import 'package:moniepoint/ui/utilities/palette.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/shirt.png",),
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite_rounded, color: Palette.pink,),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          left: 0,
          child: ColoredBox(  
            color: Palette.white,                          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.scale,),
                Text(
                  "Shirt",
                  style: TextStyle(
                    fontSize: 11.sf,
                    fontWeight: FontWeight.w500,
                    color: Palette.textColor
                  ),
                ),
                SizedBox(height: 3.scale,),
                Text(
                  "Essential's Men's Short Sleeve Crewneck T-Shirt",
                  style: TextStyle(
                    fontSize: 12.sf,
                    fontWeight: FontWeight.w600,
                    color: Palette.textColor
                  ),
                ),
                SizedBox(height: 3.scale,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Palette.amber, size: 20,),
                          const SizedBox(width: 2,),
                          Text(
                            "4.9 | 2556",
                            style: TextStyle(
                              fontSize: 9.sf,
                              color: Palette.grey,
                              fontWeight: FontWeight.w600
                            ),
                          ), 
                        ],
                      ),
                      const Text(
                        "\$20.00",
                        style: TextStyle(
                          color: Palette.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}