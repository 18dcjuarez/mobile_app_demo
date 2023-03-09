part of 'mobile_app_demo_widgets.dart';

class MobileAppDemoPhotoTile extends StatefulWidget {
  const MobileAppDemoPhotoTile({
    Key? key,
    required this.photoModel,
    required this.callback,
  }) : super(key: key);
  final PhotoModel photoModel;
  final Function() callback;

  @override
  State<MobileAppDemoPhotoTile> createState() => _MobileAppDemoPhotoTileState();
}

class _MobileAppDemoPhotoTileState extends State<MobileAppDemoPhotoTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => setState(() {
        widget.callback();
      }),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.photoModel.thumbnailUrl.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: CustomColors.colorGrey.withOpacity(0.5),
                  width: double.maxFinite,
                  height: size.height * 0.07,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.photoModel.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
          ),
          if (widget.photoModel.isSelected)
            Center(
              child: Icon(
                Icons.star,
                color: CustomColors.mainOrange.withOpacity(0.7),
                size: 80,
              ),
            )
        ],
      ),
    );
  }
}
