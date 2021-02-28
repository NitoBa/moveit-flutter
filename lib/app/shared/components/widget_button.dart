import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../app_colors.dart';
import '../size_config.dart';

class WidgetButton extends StatefulWidget {
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
  _WidgetButtonState createState() => _WidgetButtonState();
}

class _WidgetButtonState extends State<WidgetButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: isHover ? AppColors.greenColor : AppColors.blue2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onHover: (hover) {
          setState(() {
            isHover = hover;
          });
        },
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: [
            Spacer(),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.textFontSize,
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
        onTap: widget.onPressed,
      ),
    );
  }
}
