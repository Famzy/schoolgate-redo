// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'navigation_service.dart';

class DeepLinkService {
  final NavigationService _navigationService;

  DeepLinkService({required NavigationService navigationService})
      : _navigationService = navigationService;

  //
  // void initDynamicLinks() async{
  //   PendingDynamicLinkData? data =
  //   await FirebaseDynamicLinks.instance.getInitialLink();
  //   Uri? deepLink = data!.link;
  //
  //   if (deepLink != null) {
  //     this.handleDeepLinks(deepLink);
  //   }
  //
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData? dynamicLink) async {
  //         Uri? deepLink = dynamicLink?.link;
  //
  //         if (deepLink != null) {
  //           this.handleDeepLinks(deepLink);
  //         }
  //       }, onError: (OnLinkErrorException e) async {
  //     print(e.message);
  //   });
  // }
  void handleDeepLinks(Uri url) {
    try {
      // List<String> normalizedUrl = url.pathSegments;
      // if (normalizedUrl[0] != null && normalizedUrl[1] != null) {
      //   _navigationService
      //       .navigateTo("${normalizedUrl[0]}/${normalizedUrl[1]}");
      // }
    } on Exception catch (e) {
      // print(e.toString());
    }
  }

  // Future<String> createDynamicLink(bool short, String link) async {
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://sproutly.page.link/',
  //     link: Uri.parse(link),
  //     androidParameters: AndroidParameters(
  //         packageName: 'xyz.sproutly.mobile.gardners', minimumVersion: 16),
  //     dynamicLinkParametersOptions: DynamicLinkParametersOptions(
  //       shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
  //     ),
  //     iosParameters: IosParameters(
  //       bundleId: 'xyz.sproutly.mobile.gardners',
  //       minimumVersion: '0',
  //     ),
  //   );
  //
  //   Uri url;
  //   if (short) {
  //     final ShortDynamicLink shortLink = await parameters.buildShortLink();
  //     url = shortLink.shortUrl;
  //   } else {
  //     url = await parameters.buildUrl();
  //   }
  //
  //   return url.toString();
  // }
}
