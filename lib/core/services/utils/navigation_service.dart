import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolgate/core/routes/navigation_routes.dart';
import 'package:schoolgate/feature/onboarding/screens/splash_screen_page.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void pop() {
    return _navigationKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndCleanUntil(
      String routeName, String lastRouteName,
      {dynamic arguments}) async {
    try {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      return _navigationKey.currentState!.pushNamedAndRemoveUntil(
          routeName, ModalRoute.withName(lastRouteName),
          arguments: arguments);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> cleanTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TabNavigatorRoutes.studentDashboard:
        return MaterialPageRoute(
          builder: (_) => Container(child: const Text('Student Dashboard'),),
        );
      case TabNavigatorRoutes.studentBookmark:
        return _getPageRoute(
            routeName: settings.name, viewToShow: Container(child: const Text('Student Bookmark'))
        );
      case TabNavigatorRoutes.studentLiveSession:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: Container(child: const Text('Student Live Session'),)
        );
      case TabNavigatorRoutes.studentProfile:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: Container(child: const Text('Student Profile')),
        );

      case TabNavigatorRoutes.studentSearch:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: Container(child: const Text('Student Search')),
        );

      case TabNavigatorRoutes.tutorCourses:
        return _getPageRoute(viewToShow: Container(child: const Text('Normal Nav, not Named route'),));

      case TabNavigatorRoutes.onBoarding:
        return _getPageRoute(viewToShow: Container(child: const Text('All Users On-boarding'),));

      case TabNavigatorRoutes.splashScreen:
        return _getPageRoute(viewToShow: const SplashScreen());

      // case TabNavigatorRoutes.nameYourVirtualCardScreen:
      //   return _getPageRoute(viewToShow: NameYourVirtualCardScreen());
      //
      // case TabNavigatorRoutes.chooseVirtualCardDesign:
      //   return _getPageRoute(viewToShow: ChooseVirtualCardDesign());
      // case TabNavigatorRoutes.chooseUserName:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ChooseUserNameScreen(),
      //   );
      //
      // case TabNavigatorRoutes.openSavings:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: StartTheProcessScreen(),
      //   );
      // case TabNavigatorRoutes.kidsRequestNewCards:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: RequestNewCard(),
      //   );
      //
      // case TabNavigatorRoutes.aPennyForChild:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: const APennyForYourChildScreen(),
      //   );
      // case TabNavigatorRoutes.chooseJourney:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: const ChooseYourJourneyScreen(),
      //   );
      //
      // case TabNavigatorRoutes.allSet:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: AllSetScreen(),
      //   );
      // case TabNavigatorRoutes.createPassword:
      //   // PasswordType? params = settings.arguments as PasswordType?;
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: AddPasswordScreen(),
      //   );
      // case TabNavigatorRoutes.getPhone:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: Container(),
      //   );
      //
      // case TabNavigatorRoutes.farmPerks:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: Container(),
      //   );
      //
      // case TabNavigatorRoutes.parentOnboarding:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: const ParentOnboardingScreen(),
      //   );
      //
      // case TabNavigatorRoutes.kidsWelcomebackLoginScreen:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: KidsWelcomebackLoginScreen(),
      //   );
      //
      // case TabNavigatorRoutes.parentForgotPassword:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentForgotPasswordScreen(),
      //   );
      //
      // case TabNavigatorRoutes.childOnboarding:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: const ChildOnboardingScreen(),
      //   );
      //
      // case TabNavigatorRoutes.trasnactionLimits:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: TransferLimit(),
      //   );
      //
      // case TabNavigatorRoutes.verifyOtp:
      //   RouteParams? params = settings.arguments as RouteParams?;
      //
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: VerifyOtpScreen(
      //       type: params!.type,
      //     ),
      //   );
      //
      // case TabNavigatorRoutes.verifyEmail:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: GetEmailScreen(),
      //   );
      //
      // // case TabNavigatorRoutes.parentEditProfileAccountPinSettings:
      // // r
      //
      // case TabNavigatorRoutes.kycVerification:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: VerifyKYCScreen(),
      //   );
      //
      // case TabNavigatorRoutes.timeLocks:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: SetPlans(),
      //   );
      //
      // case TabNavigatorRoutes.parentDashboard:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentDashboardScreen(),
      //   );
      //
      // case TabNavigatorRoutes.parentDashboardMoreOptions:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentHomeMoreOptions(),
      //   );
      //
      // case TabNavigatorRoutes.parentDashboardSendMoney:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentHomeSendMoney(),
      //   );
      //
      // case TabNavigatorRoutes.parentDashboardChooseBeneficiary:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentHomeChooseBeneficiary(),
      //   );
      //
      // case TabNavigatorRoutes.parentDashboardChooseBank:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentHomeChooseBank(),
      //   );
      //
      // case TabNavigatorRoutes.notifications:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: NotificationsScreen(),
      //   );
      //
      // case TabNavigatorRoutes.startParentSetupProcess:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentAccountSetup(),
      //   );
      //
      // case TabNavigatorRoutes.parentSetupProcess:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentAccountSetupProcess(),
      //   );
      //
      // case TabNavigatorRoutes.parentComplianceDocuments:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ComplianceDocuments(),
      //   );
      //
      // case TabNavigatorRoutes.kidDashboard:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ChildDashboardScreen(),
      //   );
      //
      // case TabNavigatorRoutes.selectTheme:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: SelectThemeScreen(),
      //   );
      //
      // case TabNavigatorRoutes.editChildProfile:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: EditChildProfileScreen(),
      //   );
      //
      // case TabNavigatorRoutes.kidsLogin:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: KidsLoginScreen(),
      //   );
      //
      // case TabNavigatorRoutes.login:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: LoginScreen(),
      //   );
      // case TabNavigatorRoutes.editProfile:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentEditProfileScreen(),
      //   );
      //
      // case TabNavigatorRoutes.transferSuccessful:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: TransferSuccessful(),
      //   );
      //
      // case TabNavigatorRoutes.requestMoney:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: RequestMoney(),
      //   );
      // case TabNavigatorRoutes.kidsRequestMoney:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: MoneyRequestScreen(),
      //   );
      //
      // case TabNavigatorRoutes.kidsRequestMoneyAmount:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: KidsRequestMoneyScreen(),
      //   );
      //
      // case TabNavigatorRoutes.kidsRequestMoneyResponse:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: KidsMoneyRequstSuccess(),
      //   );
      //
      // case TabNavigatorRoutes.createPin:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: EnterPinScreen(),
      //   );
      // case TabNavigatorRoutes.retrieveWardPinScreen:
      //   KidUserModel ward = settings.arguments as KidUserModel;
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ParentRetrieveWardPinScreen(
      //       ward: ward,
      //     ),
      //   );
      //
      // case TabNavigatorRoutes.setNewPinParents:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: SetParentNewPinScreen(),
      //   );
      //
      // case TabNavigatorRoutes.validatePin:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: ConfirmPinScreen(),
      //   );
      // case TabNavigatorRoutes.childMoney:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: KidsMoneyScreen(),
      //   );
      //
      // case TabNavigatorRoutes.childMoneySavings:
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     viewToShow: MoneySavings(),
      //   );

      // case TabNavigatorRoutes.childMoneyAllowance:
      // return _getPageRoute(
      //   routeName: settings.name,
      //   viewToShow: AllowanceScreen(),
      // );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  PageRoute _getPageRoute(
      {String? routeName, required Widget viewToShow, Object? arguments}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => viewToShow,
      settings: RouteSettings(name: routeName, arguments: arguments),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      // transitionDuration: Duration(seconds: 4),
    );
  }
}

// class RouteParams {
//   PasswordType? type;
//   String? title;
//   // SignUpModel? model;
//   String? otpId;
//   RouteParams({
//     this.type,
//     this.title,
//     this.otpId,
//   });
// }

// enum PasswordType { RESET, UPDATE, CREATE, VERIFY, VALIDATE }
