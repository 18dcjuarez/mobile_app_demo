import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app_demo/src/data/routes/app_routes.dart';
import 'package:mobile_app_demo/src/store/photo/photo_store.dart';
import 'package:mobile_app_demo/src/theme/styles.dart';
import 'package:mobile_app_demo/src/widgets/mobile_app_demo_widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PhotoStore photoStore;

  @override
  void didChangeDependencies() {
    photoStore = Provider.of<PhotoStore>(context);
    photoStore.getPhotos();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(
        builder: (context) => Stack(
              alignment: Alignment.center,
              children: [
                Scaffold(
                  backgroundColor: CustomColors.mainBlue,
                  body: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Expanded(
                          child: MobileAppDemoAppBar(
                            appBarButton: true,
                            appBarCallback: () => setState(() {
                              photoStore.clearSelectedPhotos();
                            }),
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: size.height * 0.02,
                                  mainAxisSpacing: size.height * 0.02,
                                ),
                                itemCount: photoStore.photos.length,
                                itemBuilder: (context, index) =>
                                    MobileAppDemoPhotoTile(
                                  photoModel: photoStore.photos[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: MobileAppDemoButton(
                    callback: photoStore.selectedPhotos.isNotEmpty
                        ? () async => await Navigator.pushNamed(
                            context, AppRoutes.favouritePage)
                        : null,
                    text: photoStore.selectedPhotos.isNotEmpty
                        ? 'Next'
                        : 'Select Photo',
                  ),
                ),
                if (photoStore.isLoading) const MobileAppDemoLoader()
              ],
            ));
  }
}
