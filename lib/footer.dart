import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_portfolio/header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  final String phoneNumber = "+918625014405";

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VxDevice(
          mobile: VStack(
            [
              "Got a project?\nLet's talk.".text.center.white.xl2.make(),
              10.heightBox,
              "prashantkawathe6@gmail.com"
                  .text
                  .color(Coolors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make()
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
          web: HStack(
            [
              "Got a project?\nLet's talk.".text.center.white.xl2.make(),
              10.widthBox,
              "prashantkawathe6@gmail.com"
                  .text
                  .color(Coolors.accentColor)
                  .semiBold
                  .make()
                  .box
                  .border(color: Coolors.accentColor)
                  .p16
                  .rounded
                  .make(),
            ],
            alignment: MainAxisAlignment.spaceAround,
          ).w(context.safePercentWidth * 70).scale150().p16(),
        ),
        10.heightBox,
        const Icon(
          FontAwesomeIcons.whatsapp,
          color: Colors.white,
        ).mdClick(() async {
          // ignore: deprecated_member_use, unused_local_variable
          final whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

          if (await canLaunchUrl(whatsappUrl)) {
            await launchUrl(
              whatsappUrl,
              mode: LaunchMode.externalApplication, // This forces the URL to open in an external browser or app.
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Could not launch WhatsApp")),
            );
            throw "Could not launch $whatsappUrl";
          }
        }).make(),
        const Text("Only for girls").color(Vx.gray500),
        20.heightBox,
        const CustomAppBar(),
        10.heightBox,
        "Thanks for scrolling, ".richText.semiBold.white.withTextSpanChildren(
            ["Have a nice day.".textSpan.gray500.make()]).make(),
        20.heightBox,
        const SocialAccounts(),
        20.heightBox,
        [
          Center(child: "Made by Prashant".text.orange500.make()),
          10.widthBox,
          const Icon(
            AntDesign.heart,
            color: Vx.red500,
            size: 14,
          )
        ].hStack(crossAlignment: CrossAxisAlignment.center)
      ],
      crossAlignment: CrossAxisAlignment.center,
    ).wFull(context).p16();
  }
}
