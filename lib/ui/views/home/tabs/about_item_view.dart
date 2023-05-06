import 'package:flutter/material.dart';
import 'package:moniepoint/ui/shared/about_item_row.dart';

class AboutViewTab extends StatelessWidget {
  const AboutViewTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
         AboutItemRow(
          title: "Brand",
          trailing: "ChArmkPR",
          nextTitle: "Color",
          nextTrailing: "Aprikot",
        ),    
        AboutItemRow(
          title: "Made in",
          trailing: "Lagos",
          nextTitle: "Shipped to",
          nextTrailing: "Abuja",
        ),   
        AboutItemRow(
          title: "Brand",
          trailing: "ChArmkPR",
          nextTitle: "Color",
          nextTrailing: "Aprikot",
        ),                 
        
      ],
    );
  }
}