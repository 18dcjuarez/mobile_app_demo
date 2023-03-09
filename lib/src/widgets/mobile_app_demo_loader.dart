part of 'mobile_app_demo_widgets.dart';

class MobileAppDemoLoader extends StatelessWidget {
  const MobileAppDemoLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: CustomColors.colorBlack.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          color: CustomColors.mainOrange,
        ),
      ),
    );
  }
}
