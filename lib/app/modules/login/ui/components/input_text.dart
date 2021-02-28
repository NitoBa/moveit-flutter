import 'package:flutter/material.dart';

import '../../../../shared/app_colors.dart';
import '../../../../shared/size_config.dart';
import '../../../../shared/utils/extensions.dart';

class InputText extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordInput;
  const InputText({
    Key key,
    this.hintText,
    this.controller,
    this.isPasswordInput = false,
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool passwordIsVisible = false;

  _changedPasswordVisibility() {
    setState(() {
      passwordIsVisible = !passwordIsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(37),
      ),
      alignment: Alignment.center,
      height: getProportionateScreenHeight(80),
      width: getProportionateScreenWidth(420),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.blueGradientColors,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              scrollPadding: const EdgeInsets.all(0),
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (widget.isPasswordInput &&
                    value.isNotEmpty &&
                    !value.isValidPassword()) {
                  return "Sua senha deve conter entre 4 e 12 caracteres";
                } else {
                  return null;
                }
              },
              controller: widget.controller,
              obscureText: widget.isPasswordInput ? !passwordIsVisible : false,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenHeight(20),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                hintText: widget.hintText,
                errorStyle: TextStyle(
                  height: getProportionateScreenHeight(0.8),
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(12),
                ),
                hintStyle: TextStyle(
                  color: AppColors.textBlue,
                  fontSize: getProportionateScreenHeight(20),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.isPasswordInput) ...[
            InkWell(
              borderRadius: BorderRadius.circular(100),
              child: Icon(
                passwordIsVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
                size: getProportionateScreenHeight(24),
              ),
              onTap: _changedPasswordVisibility,
            )
          ]
        ],
      ),
    );
  }
}
