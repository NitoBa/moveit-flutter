import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../app_colors.dart';
import '../size_config.dart';

class WidgetButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final IconData suffixIcon;
  final double textFontSize;
  final Function onPressed;
  const WidgetButton({
    Key key,
    this.height,
    this.width,
    this.text,
    this.suffixIcon,
    this.onPressed,
    this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (isHover) {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.blue2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Spacer(),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: textFontSize,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Icon(
                FeatherIcons.logIn,
                color: Colors.white,
                size: getProportionateScreenHeight(24),
              ),
              Spacer(),
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
