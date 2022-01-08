import 'package:flutter/material.dart';
import 'package:schoolgate/utils/shared_utils/widgets/custom_button.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';

class CreatorInterestPage extends StatefulWidget {
  @override
  _CreatorInterestPageState createState() => _CreatorInterestPageState();
}

class _CreatorInterestPageState extends State<CreatorInterestPage> {
  final List<Map<String?, dynamic>> interestsList = [
    {
      "imageUrl": "assets/images/sample_image_1.png",
      "title": "IT & Software",
    },
    {
      "imageUrl": "assets/images/sample_image_2.png",
      "title": "Business",
    },
    {
      "imageUrl": "assets/images/sample_image_3.png",
      "title": "Development",
    },
    {
      "imageUrl": "assets/images/sample_image_1.png",
      "title": "Finance",
    },
    {
      "imageUrl": "assets/images/sample_image_2.png",
      "title": "Health",
    },
    {
      "imageUrl": "assets/images/sample_image_1.png",
      "title": "Design",
    },
    {
      "imageUrl": "assets/images/sample_image_2.png",
      "title": "Art",
    },
    {
      "imageUrl": "assets/images/sample_image_3.png",
      "title": "Productivity",
    },
  ];
  bool isIcon = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height / 2.5;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: whiteVariant,
          child: Column(
            children: [
              const SizedBox(
                height: 78,
              ),
              const Text(
                'Welcome to Schoolgate',
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkAsh,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Please select your interests',
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: creatorYellow,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "To help us give you the best suggestions, tell us what "
                  "you're interested in and we'll select the best content "
                  "tailored for you",
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  // SvgPicture.asset(AssetsPath.backgroundCloudGreen),
                  Column(
                    children: [
                      Column(
                        children: [
                          GridView.builder(
                            padding: const EdgeInsets.all(10),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: interestsList.length,
                            // interest.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    // childAspectRatio: 1.5,
                                    childAspectRatio: (width / height),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  // color: studentGreen,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      interestsList[index]['imageUrl'],
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.dstATop,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      interestsList[index]['title'],
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: whiteColor,
                                        fontFamily: "ProductSans",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 65,
                          ),
                          InkWell(
                            onTap: () => {
                              // Get.off(() => CreatorLandingPage(AuthResponse()))
                            },
                            child: const CustomButton(
                                buttonColor: creatorYellow, buttonText: 'Done'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
