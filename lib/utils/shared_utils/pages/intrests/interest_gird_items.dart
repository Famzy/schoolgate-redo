import 'package:flutter/material.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';

class GridItem extends StatefulWidget {
  final Key? key;
  InterestSelectionEntity? item;
  final ValueChanged<bool>? isSelected;
  GridItem({this.key, this.item, this.isSelected}) : super(key: key);

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected!(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: creatorYellow,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              // color: studentGreen,
              image: DecorationImage(
                image: NetworkImage(
                  "${widget.item!.imageUrl}",
                ),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          isSelected
              ? const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_circle,
                color: studentGreen,
              ),
            ),
          )
              : Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[
                  Colors.black38,
                  Colors.transparent
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.item!.title}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: whiteColor,
                    fontFamily: "ProductSans",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.0),
          //   child: Image.asset(
          //     "${widget.item!.imageUrl}",
          //     color: Colors.black54.withOpacity(isSelected ? 0.9 : 0),
          //     colorBlendMode: BlendMode.color,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 5, bottom: 10),
          //     child: Text(
          //       "${widget.item!.title}",
          //       style: TextStyle(
          //         fontFamily: 'ProductSans',
          //         fontSize: 12,
          //         fontWeight: FontWeight.bold,
          //         color: whiteColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class InterestSelectionEntity {
  String? imageUrl;
  String? title;
  InterestSelectionEntity({this.imageUrl, this.title});
}
