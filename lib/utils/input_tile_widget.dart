import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';

class TextInputTile extends StatefulWidget {
  const TextInputTile(
      {Key? key,
      required this.tileName,
      required this.tileIcon,
      this.validator,
      this.inputType,
      this.isPassword = false,
      required this.controller})
      : super(key: key);

  final String tileName;
  final String tileIcon;
  final bool isPassword;
  final TextInputType? inputType;
  final String Function(String?)? validator;
  final TextEditingController controller;

  @override
  _TextInputTileState createState() => _TextInputTileState();
}

class _TextInputTileState extends State<TextInputTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: whiteColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Text(
                            widget.tileName,
                            style: const TextStyle(
                                fontFamily: 'ProductSans',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: darkAshVariantLighter),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: widget.controller,
                            obscureText: widget.isPassword,
                            validator: widget.validator,
                            keyboardType: widget.inputType,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                                fontFamily: 'ProductSans',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: primaryBlackVariantLighter),
                          ),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(widget.tileIcon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
