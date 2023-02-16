import 'package:flutter/material.dart';
import 'package:twake/core/presentation/resources/image_path.dart';
import 'package:twake/core/presentation/utils/dimensions_config.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => OrientationBuilder(
        builder: (context, orientation) {
          Dim.init(constraints, orientation);
          return Scaffold(
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: Color(0xFF004DFF),
              child: Center(
                child: Column(
                  children: [
                    Spacer(),
                    SizedBox(
                      height: Dim.heightPercent(5),
                    ),
                    SizedBox(
                      width: Dim.widthPercent(45),
                      child: Image.asset(
                        imageTwakeLaunchLogo,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: Dim.widthPercent(30),
                      child: Image.asset(
                        imageLinagoraLaunchLogo,
                      ),
                    ),
                    SizedBox(
                      height: Dim.heightPercent(5),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
