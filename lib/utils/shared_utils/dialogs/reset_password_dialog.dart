import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:schoolgate/utils/shared_utils/widgets/custom_button.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';
import '../../app_strings.dart';

class ResetPasswordDialog extends StatelessWidget {
  const ResetPasswordDialog({Key? key, required this.userType})
      : super(key: key);

  final String userType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                AppStrings.resetPasswordText,
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: darkAshVariantAlternate,
                ),
              ),
            ),
            const SizedBox(height: 27),
            InkWell(
              onTap: () async {
                // Android: Will open mail app or show native picker.
                // iOS: Will open mail app if single mail app found.
                var result = await OpenMailApp.openMailApp();

                // If no mail apps found, show error
                if (!result.didOpen && !result.canOpen) {
                  showNoMailAppsDialog(context);

                  // iOS: if multiple mail apps found, show dialog to select.
                  // There is no native intent/default app system in iOS so
                  // you have to do it yourself.
                } else if (!result.didOpen && result.canOpen) {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return MailAppPickerDialog(
                        mailApps: result.options,
                      );
                    },
                  );
                }
              },
              child: CustomButton(
                  buttonColor:
                      userType == 'Student' ? studentGreen : creatorYellow,
                  buttonText: 'Go To Mail'),
            ),
          ],
        ),
      ),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
