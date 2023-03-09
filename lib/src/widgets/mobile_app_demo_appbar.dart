part of 'mobile_app_demo_widgets.dart';

class MobileAppDemoAppBar extends StatelessWidget {
  const MobileAppDemoAppBar({
    Key? key,
    this.title = '',
    this.textStyle,
    this.sizeHeight = 60,
    this.backButton = false,
    this.appBarButton = false,
    this.appBarCallback,
    this.onBackCallback,
    this.icon = Icons.star_outlined,
    this.backgroundColor = CustomColors.mainBlue,
  }) : super(key: key);

  final String title;
  final TextStyle? textStyle;
  final double sizeHeight;
  final bool backButton;
  final bool appBarButton;
  final Function()? appBarCallback;
  final Function()? onBackCallback;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final photoStore = Provider.of<PhotoStore>(context);
    return Container(
      color: backgroundColor,
      width: size.width,
      height: size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!backButton)
              const SizedBox(
                width: 30,
              )
            else
              GestureDetector(
                onTap: () => (onBackCallback == null)
                    ? Navigator.pop(context)
                    : onBackCallback,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: CustomColors.colorWhite,
                  size: 30,
                ),
              ),
            if (title.isEmpty)
              Column(
                children: [
                  Icon(
                    Icons.photo,
                    color: CustomColors.colorWhite,
                    size: size.height * 0.05,
                  ),
                  const Text('Mobile App Demo')
                ],
              )
            else
              Center(
                child: Text(
                  title,
                  style: (textStyle == null)
                      ? Theme.of(context).textTheme.headline2
                      : textStyle,
                ),
              ),
            if (!appBarButton)
              const SizedBox(
                width: 30,
              )
            else
              Observer(
                builder: ((context) => GestureDetector(
                      onTap: appBarCallback,
                      child: Stack(
                        children: [
                          Icon(
                            icon,
                            color: CustomColors.colorWhite,
                            size: 40,
                          ),
                          if (photoStore.selectedPhotos.isNotEmpty)
                            Positioned(
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 22,
                                  minHeight: 22,
                                ),
                                child: Center(
                                  child: Text(
                                    '${photoStore.selectedPhotos.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )),
              )
          ],
        ),
      ),
    );
  }
}
