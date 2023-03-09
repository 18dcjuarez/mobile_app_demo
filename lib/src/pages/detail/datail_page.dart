import 'package:flutter/material.dart';
import 'package:mobile_app_demo/src/store/photo/photo_store.dart';
import 'package:mobile_app_demo/src/theme/styles.dart';
import 'package:mobile_app_demo/src/widgets/mobile_app_demo_widgets.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final selectedPhoto = Provider.of<PhotoStore>(context).selectedPhotoDetail;
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
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              selectedPhoto.url.toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: CustomColors.mainLime.withOpacity(0.3),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.02,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                      children: [
                                        const TextSpan(text: 'Album ID: '),
                                        TextSpan(
                                          text: '${selectedPhoto.albumId}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                      children: [
                                        const TextSpan(text: 'Photo ID: '),
                                        TextSpan(
                                          text: '${selectedPhoto.id}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.headline1,
                                  children: [
                                    const TextSpan(text: 'Title: '),
                                    TextSpan(
                                      text: '${selectedPhoto.title}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.headline1,
                                  children: [
                                    const TextSpan(text: 'URL: '),
                                    TextSpan(
                                      text: '${selectedPhoto.url}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.headline1,
                                  children: [
                                    const TextSpan(text: 'Thumbnail: '),
                                    TextSpan(
                                      text: '${selectedPhoto.thumbnailUrl}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
