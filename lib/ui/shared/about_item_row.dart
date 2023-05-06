import 'package:flutter/material.dart';
import 'package:moniepoint/ui/utilities/device_scaler.dart';
import 'package:moniepoint/ui/utilities/palette.dart';

class AboutItemRow extends StatelessWidget {
  final String title, trailing, nextTitle, nextTrailing;

  const AboutItemRow({
    super.key,
    required this.title,
    required this.trailing,
    required this.nextTitle,
    required this.nextTrailing
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.scale),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$title: ",
                style: TextStyle(
                  fontSize: 12.sf,
                  fontWeight: FontWeight.w600,
                  color: Palette.grey,
                ),
              ),
              Text(
                trailing,
                style: TextStyle(
                  fontSize: 13.sf,
                  fontWeight: FontWeight.w600,
                  color: Palette.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 80,
          ),
          Row(
            children: [
              Text(
                "$nextTitle: ",
                style: TextStyle(
                  fontSize: 12.sf,
                  fontWeight: FontWeight.w600,
                  color: Palette.grey,
                ),
              ),
              Text(
                nextTrailing,
                style: TextStyle(
                  fontSize: 13.sf,
                  fontWeight: FontWeight.w600,
                  color: Palette.textColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
