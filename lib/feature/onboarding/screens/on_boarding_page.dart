import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:schoolgate/utils/assets.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';



class OnBoardingPage extends StatefulWidget {


  const OnBoardingPage ({Key? key}) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with SingleTickerProviderStateMixin {
  int index = 0;
  bool _isLast = false;
  bool isStart = true;
  final _animationDuration = const Duration(milliseconds: 200);
  late AnimationController _animationController;
  late Animation<double> _startAnimation;
  late Animation<double> _fadeAnimation;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _pageController = PageController();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);

    _startAnimation =
        Tween(begin: 1.0, end: 1.0).animate(_animationController);
    _changeIndexOnSwap();
  }

  void _changeIndexOnSwap() {
    isStart = true;
    _pageController.addListener(() {
      index = _pageController.page!.toInt();
      _changeIndex(index);
    });
  }

  void _changeIndex(int newIndex) {
    if (newIndex > _onboardingcontents.length - 1) {

      // context.pushReplacement(InterestSelectionPage());
      return;
    }
    index = newIndex;
    _animationController.reset();
    _fadeAnimation = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ),
    );
    isStart = false;
    _animationController.forward();
    if (index == (_onboardingcontents.length - 1)) {
      _isLast = true;
    } else {
      _isLast = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryBlack,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 170),
                  child: Image.asset(ImageAssets.check)
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: _pageController,
                children: [
                  ..._onboardingcontents.map((onboardContent) => Container(
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        FadeTransition(
                            opacity:isStart == true ?
                            _startAnimation : _fadeAnimation,
                            child: SvgPicture.asset(onboardContent.assetPath,
                            )),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: FadeTransition(
                                    opacity: isStart == true ?
                                     _startAnimation : _fadeAnimation,
                                    child: Text(
                                      onboardContent.title,
                                      style: const TextStyle(
                                        fontFamily: 'ProductSans',
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: whiteColor
                                      ),
                                      textAlign: TextAlign.center,
                                    ))),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          onboardContent.msg,
                          style: const TextStyle(
                              fontFamily: 'ProductSans',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: whiteColor
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    index == 3 ? const SizedBox(
                      height: 50,
                      width: 31,
                    ) : TextButton(onPressed: (){
                      // _cachedData.setFreshInstall();

                      // Get.off(()=> SelectUserType());
                    }, child:
                    const Text('Skip', style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: whiteColor
                    ),
                    )),
                    const Spacer(flex: 1),
                    Padding(
                      padding: index != 3 ?  const EdgeInsets.only(right: 35.0) : const EdgeInsets.only(left: 25.0),
                      child: Center(
                          child: Row(
                            children: <Widget> [
                            for (int i = 0; i < _onboardingcontents.length; i++)
                            i == index ? _indicator(true) : _indicator(false)
                            ],
                          )
                        ),
                    ),
                    const Spacer(flex: 1),
                    index == 3 ? TextButton(onPressed: (){
                      // _controller.isFreshUserValue();
                      // Get.off(() => SelectUserType());
                    }, child:
                    const Text('Done', style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: whiteColor
                    ),
                    )) : InkWell(
                      onTap: () => {
                        _changeIndex(index + 1),
                        _pageController.jumpToPage(index)},
                      child: SvgPicture.asset(SvgAssets.forwardArrow),
                    )
                  ],
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 10,
      child: AnimatedContainer(

        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: isActive
            ? 10:8.0,
        width: isActive
            ? 12:8.0,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
              color: creatorYellow.withOpacity(0.72),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: const Offset(
                0.0,
                0.0,
              ),
            )
                : const BoxShadow(
              color: Colors.transparent,
            )
          ],
          shape: BoxShape.circle,
          color: isActive ? creatorYellow : const Color(0XFF464747).withOpacity(0.80),
        ),
      ),
    );
  }


  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

}

final _onboardingcontents = <OnboardContent> [
  OnboardContent(SvgAssets.onBoarding1SVG, "Learn from the best Tutors",
      "Schoolgate offers you a top-notch, \nindustry standard courses \nanywhere, anyway, anytime"),
  OnboardContent(
      SvgAssets.onBoarding2SVG,
      "Create Your Own Contents",
      "At Schoolgate, we believe everyone has \nsomething to offer. Quickly create your \ncontent and put them out for sale \nto thousands of Students on Schoolgate"),
  OnboardContent(SvgAssets.onBoarding3SVG, "Get Your Certificate of Completion",
      "Our courses comes with an industry \nrecognised certificate of completion at \nthe end of your courses"),
  OnboardContent(SvgAssets.onBoarding4SVGSchoolgate, "Let’s Go.",
      "Enter your world of amazing courses at \nthe most pocket friendly rate ever."),
];

class OnboardContent {
  final String assetPath;
  final String title;
  final String msg;

  OnboardContent(this.assetPath, this.title, this.msg);

}


