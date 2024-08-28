import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_portfolio/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameWidget = "Prashant\nKawathe\nApp\nDeveloper."
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
          child: VStack([
            ZStack(
              [
                const PictureWidget(),
                Row(
                  children: [
                    VStack([
                      if (context.isMobile) 50.heightBox else 10.heightBox,
                      const CustomAppBar().shimmer(primaryColor: Coolors.accentColor),
                      30.heightBox,
                      nameWidget,
                      20.heightBox,
                      VxBox()
                          .color(Coolors.accentColor)
                          .size(60, 10)
                          .make()
                          .px4()
                          .shimmer(primaryColor: Coolors.accentColor),
                      30.heightBox,
                      const SocialAccounts(),
                    ]).pSymmetric(
                      h: context.percentWidth * 10,
                      v: 32,
                    ),
                    Expanded(
                      child: VxResponsive(
                        medium: const IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                        large: const IntroductionWidget()
                            .pOnly(left: 120)
                            .h(context.percentHeight * 60),
                        fallback: const Offstage(),
                      ),
                    )
                  ],
                ).w(context.screenWidth)
              ],
            )
          ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.sm.make(),
          10.heightBox,
          "App Developer.\nCompleting my B.Tech in Computer Engineering.\nPassionate App Development seeking opportunity to work with organizations where I can fully utilize my skills in Flutter app development, Firebase, Dart & Web."
              .text
              .white
              .xl3
              .maxLines(10)
              .make()
              .w(context.isMobile
              ? context.screenWidth
              : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        ElevatedButton(
          onPressed: () async {
            final ByteData bytes = await rootBundle.load('assets/resume.pdf');
            final String dir = (await getApplicationDocumentsDirectory()).path;
            final String path = '$dir/resume.pdf';
            final File file = File(path);

            await file.writeAsBytes(bytes.buffer.asUint8List());

            OpenFile.open(path);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Coolors.primaryColor, backgroundColor: Coolors.accentColor, // text color
            shape: Vx.roundedSm as OutlinedBorder?,
          ),
          child: "View My Resume".text.make(),
        ).h(50)

      ],
      crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Coolors.accentColor,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 0, 0),
      transform: Matrix4.rotationY(pi),
      child: Image.asset(
        "assets/ganesh.JPG",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
        width: 500,
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      Center(
        child: const Icon(
          AntDesign.instagram,
          color: Colors.white,
        ).mdClick(() {
          // ignore: deprecated_member_use
          launch("https://www.instagram.com/prashant_kawathe_34");
        }).make(),
      ),
      20.widthBox,
      Center(
        child: const Icon(
          AntDesign.linkedin_square,
          color: Colors.white,
        ).mdClick(() {
          // ignore: deprecated_member_use
          launch("https://www.linkedin.com/in/prashant-kawathe-69753b28b");
        }).make(),
      ),
      20.widthBox,
      Center(
        child: const Icon(
          AntDesign.github,
          color: Colors.white,
        ).mdClick(() {
          // ignore: deprecated_member_use
          launch("https://github.com/parshya34");
        }).make(),
      )
    ].hStack();
  }
}
