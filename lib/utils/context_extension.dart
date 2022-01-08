// ignore_for_file: camel_case_extensions

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension ContextExtension on BuildContext {
  //todo add pushnamed function.

  Future<T?>? push<T>(Widget widget) {
    return Navigator.of(this)
        .push(MaterialPageRoute<T>(builder: (context) => widget));
  }

  Future<T?>? pushNamed<T>(String route) {
    return Navigator.of(this).pushNamed(route);
  }

  void closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus =
        FocusScope.of(context); // SHOULD BE builderContext
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  setToClipboard(
      {required BuildContext context,
      required String copyValue,
      required String snackBarMessage}) {
    return Clipboard.setData(ClipboardData(text: copyValue)).then((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(snackBarMessage)));
    });
  }

  Future<T?>? pushReplacement<T>(Widget widget) {
    return Navigator.of(this)
        .pushReplacement(MaterialPageRoute<T>(builder: (context) => widget));
  }

  Future<dynamic> navigateToAndCleanUntil(
      String routeName, String lastRouteName,
      {dynamic arguments}) async {
    try {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      return Navigator.of(this).pushNamedAndRemoveUntil(
          routeName, ModalRoute.withName(lastRouteName),
          arguments: arguments);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  void popToHome() => Navigator.of(this).popUntil((route) => route.isFirst);
  void pop() => Navigator.of(this).pop();

  Future<bool> maybePop<T>([T? data]) => Navigator.maybePop(this, data);

  void showSnackBar(SnackBar snackbar) =>
      Scaffold.of(this).showSnackBar(snackbar);

  void requestFocus(FocusNode nextFocus) =>
      FocusScope.of(this).requestFocus(nextFocus);
}

final currencyFormat = NumberFormat("#,##0.00", "en_US");

extension customIntExtension on int? {
  formatCurrency() {
    return this == null ? '-' : (currencyFormat.format(this));
  }
}

extension customDoubleExtension on double? {
  formatCurrency({String? currencySymbol = '₦'}) {
    return this == null
        ? '-'
        : ((currencySymbol != null ? (currencySymbol + ' ') : '') +
            currencyFormat.format(this));
  }
}
