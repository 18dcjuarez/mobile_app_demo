import 'package:flutter/material.dart';
import 'package:mobile_app_demo/src/store/photo/photo_store.dart';
import 'package:mobile_app_demo/src/theme/styles.dart';
import 'package:mobile_app_demo/src/widgets/mobile_app_demo_widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<PhotoStore>(context).getPhotos();
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          backgroundColor: CustomColors.mainBlue,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Expanded(child: MobileAppDemoAppBar()),
                Expanded(
                  flex: 9,
                  child: Container(
                    color: CustomColors.mainGreen,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          color: CustomColors.mainLime,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: CustomColors.colorGrey.withOpacity(0.5),
                                height: 30,
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          child: Container(
            height: 30,
            width: 60,
            color: CustomColors.mainOrange,
          ),
        )
      ],
    );
  }
}
