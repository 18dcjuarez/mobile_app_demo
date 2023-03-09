import 'package:flutter/material.dart';
import 'package:mobile_app_demo/src/data/routes/app_routes.dart';
import 'package:mobile_app_demo/src/store/photo/photo_store.dart';
import 'package:mobile_app_demo/src/theme/styles.dart';
import 'package:mobile_app_demo/src/widgets/mobile_app_demo_widgets.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoStore = Provider.of<PhotoStore>(context);
    return Scaffold(
      backgroundColor: CustomColors.mainBlue,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Expanded(
              child: MobileAppDemoAppBar(
                backButton: true,
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                color: CustomColors.mainGreen,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                  ),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.height * 0.02,
                      mainAxisSpacing: size.height * 0.02,
                    ),
                    itemCount: photoStore.selectedPhotos.length,
                    itemBuilder: (context, index) => MobileAppDemoPhotoTile(
                        photoModel: photoStore.selectedPhotos[index],
                        callback: () {
                          photoStore.selectPhotoDetail(
                              photoStore.selectedPhotos[index]);
                          Navigator.pushNamed(
                            context,
                            AppRoutes.detailPage,
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
