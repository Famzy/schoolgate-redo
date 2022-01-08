import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schoolgate/utils/assets.dart';
import 'package:schoolgate/utils/shared_utils/widgets/custom_button.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({Key? key}) : super(key: key);

  @override
  _SelectUserTypeState createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: primaryBlack,
        child: Column(
          children: [
            const SizedBox(height: 160),
            SvgPicture.asset(
              SvgAssets.schoolGateImageWithCap,
            ),
            const SizedBox(height: 43),
            const Text(
              'Select User Type',
              style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: whiteColor),
            ),
            const SizedBox(height: 90),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(ImageAssets.cloudBackgroundWithout),
                Column(
                  children: [
                    InkWell( onTap: () {},
                          // Get.to(() => UserSignIn(userType: 'Creator'),
                          // binding: HomeBinding()),
                     child: const CustomButton(
                          buttonColor: creatorYellow,
                          buttonText: 'Content Creator'),
                    ),
                    const SizedBox( height: 38,),
                    InkWell( onTap: () {},
                      // => Get.to(() => UserSignIn(userType: 'Student'),
                      //     binding: HomeBinding()),
                      child: const CustomButton(
                         buttonColor: studentGreen, buttonText: 'Student'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}