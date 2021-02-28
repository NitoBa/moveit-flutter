import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../shared/app_colors.dart';
import '../../../../shared/components/widget_button.dart';
import '../../../../shared/size_config.dart';
import '../components/input_text.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig();
    return Scaffold(
      backgroundColor: AppColors.blue1,
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(-getProportionateScreenWidth(68), 0),
            child: WebsafeSvg.asset(
              "assets/images/Simbolo.svg",
              height: getProportionateScreenHeight(660),
              width: getProportionateScreenWidth(768),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  WebsafeSvg.asset(
                    "assets/images/Logo.svg",
                    height: getProportionateScreenHeight(76),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(66),
                  ),
                  Text(
                    "Bem-vindo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenHeight(36),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  InputText(
                    hintText: "Digite seu email",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(18),
                  ),
                  InputText(
                    hintText: "Digite sua senha",
                    isPasswordInput: true,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  WidgetButton(
                    height: getProportionateScreenHeight(80),
                    width: getProportionateScreenWidth(420),
                    textFontSize: getProportionateScreenHeight(30),
                    text: "Login",
                    suffixIcon: FeatherIcons.logIn,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(152),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      radius: 10,
                      child: Row(
                        children: [
                          Text(
                            "cadastre-se agora",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: getProportionateScreenHeight(20),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          Icon(
                            FeatherIcons.arrowRight,
                            color: Colors.white,
                            size: getProportionateScreenHeight(22),
                          ),
                        ],
                      ),
                      onTap: () => Get.toNamed('/login/register'),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                width: getProportionateScreenWidth(200),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
