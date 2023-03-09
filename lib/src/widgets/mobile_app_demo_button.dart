part of 'mobile_app_demo_widgets.dart';

class MobileAppDemoButton extends StatelessWidget {
  const MobileAppDemoButton({
    Key? key,
    required this.callback,
    this.height = 60,
    this.text = 'Button',
    this.textColor = CustomColors.colorWhite,
    this.backgroundColor = CustomColors.mainOrange,
    this.loading = false,
  }) : super(key: key);

  final String text;
  final double height;
  final Color textColor;
  final Function()? callback;
  final Color backgroundColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          color: callback == null ? CustomColors.colorGrey : backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  height: height / 2,
                  width: height / 2,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  text,
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.button?.copyWith(
                        color: callback == null
                            ? CustomColors.colorBlack
                            : CustomColors.colorWhite,
                      ),
                ),
        ),
      ),
    );
  }
}
