import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schoolgate/utils/shared_utils/dialogs/reset_password_dialog.dart';
import 'package:schoolgate/utils/shared_utils/widgets/custom_button.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';
import 'package:schoolgate/utils/utils.dart';
import '../../../input_tile_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required this.userType}) : super(key: key);

  final String userType;

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // final _controller = Get.put(ResetController()); // inject controller
  bool isStudent = true;
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.userType == 'Student') {
      isStudent = true;
    } else {
      isStudent = false;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: whiteVariant,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 65),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: isStudent
                          ? SvgPicture.asset(SvgAssets.backNavIconYellow)
                          : SvgPicture.asset(SvgAssets.backNavIconGreen)),
                ),
              ),
              const SizedBox(
                height: 78,
              ),
              const Text(
                'Recover Password',
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkAsh,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter your Email below',
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: isStudent ? studentGreen : creatorYellowLight,
                ),
              ),
              const SizedBox(height: 90),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  SvgPicture.asset(isStudent
                      ? SvgAssets.backgroundCloudGreen
                      : SvgAssets.backgroundCloudYellow),
                  Column(
                    children: [
                      Column(
                        children: [
                          TextInputTile(
                              tileIcon: SvgAssets.iconEmail,
                              tileName: 'Email',
                              controller: _emailController),
                          const SizedBox(
                            height: 65,
                          ),
                          InkWell(
                            onTap: () async {
                              // _controller.reset(_emailController.text);
                              showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: ResetPasswordDialog(
                                            userType: isStudent
                                                ? 'Student'
                                                : 'Creator'),
                                      ));
                            },
                            child: CustomButton(
                                buttonColor:
                                    isStudent ? studentGreen : creatorYellow,
                                buttonText: 'Send'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
