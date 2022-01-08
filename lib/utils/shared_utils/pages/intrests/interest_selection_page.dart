import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolgate/core/models/shared_models/auth_response.dart';
import 'package:schoolgate/core/models/student_models/categories.dart';
import 'package:schoolgate/core/services/utils/storage_service.dart';
import 'package:schoolgate/utils/shared_utils/widgets/custom_button.dart';
import 'package:schoolgate/utils/theme/app_colors.dart';
import 'dart:io';

import 'interest_gird_items.dart';

class InterestSelectionPage extends StatefulWidget {
  List<Categories>? interestsList;
  String? uniqueID;
  AuthResponse? response;
  @override
  _InterestSelectionPageState createState() => _InterestSelectionPageState();

  InterestSelectionPage(this.interestsList, this.uniqueID, this.response, {Key? key}) : super(key: key);
}

class _InterestSelectionPageState extends State<InterestSelectionPage> {
  // AuthService _authService = AuthService();
  List<String> selectedInterest = [];
  bool isIcon = false;
  bool isLoading = false;

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
                            itemCount: widget.interestsList!.length,
                            // interest.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    // childAspectRatio: 1.5,
                                    childAspectRatio: (width / height),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return GridItem(
                                key: Key(index.toString()),
                                isSelected: (bool value) {
                                  setState(() {
                                    if (value) {
                                      selectedInterest.add(
                                          "${widget.interestsList![index].categoryid}");
                                    } else {
                                      selectedInterest.remove(
                                          "${widget.interestsList![index].categoryid}");
                                    }
                                  });
                                },
                                item: InterestSelectionEntity(
                                    imageUrl: widget
                                        .interestsList![index].featureImage,
                                    title: widget
                                        .interestsList![index].categoryName),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 65,
                          ),
                          InkWell(
                            // onTap: () async {
                            //   StorageService cachedData;
                            //   print(
                            //       "interest list: $selectedInterest userID: ${widget.uniqueID}");
                            //   setState(() {
                            //     isLoading = true;
                            //   });
                            //   await
                            //   // _authService
                            //   //     .setInterest(SelectedInterestModel(
                            //   //         uniqueid: widget.uniqueID,
                            //   //         preferences: selectedInterest))
                            //   //     .then((value)
                            //   //     {
                            //   //       // cacheUserBeforeProceeding(cachedData, value);
                            //   //     }
                            //   //
                            //   // );
                            // },
                            child: isLoading ? Platform.isIOS
                                ? const CupertinoActivityIndicator()
                                : const CircularProgressIndicator()
                                :  const CustomButton(
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

  // Future cacheUserBeforeProceeding(CachedData cachedData, Params value) async {
  //   await cachedData.cacheUser(user: value.response!.user);
  //   await cachedData.cacheAuthResponse(response: value.response);
  //   // Get.off(() => LandingPage(response: value.response!));
  //
  // }
}
