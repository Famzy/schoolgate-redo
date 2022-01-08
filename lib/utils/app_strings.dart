class AppStrings {
  static const resetPasswordText =
      'Your password recovery mail has been sent to email address, please go to your mail and confirm and recover your password';
  static const String appName = "Schoolgate";
  static const String CACHE_INTEREST = "CACHE_INTEREST";
  static const String CACHED_AUTH_RESPONSE = "CACHED_AUTH_RESPONSE";
  static const String CACHED_USER = "CACHED_USER";
  static const String FRESH_INSTALL = "FRESH_INSTALL";
  static const String NEW_INSTALL = "NEW_INSTALL";
  static const String LOGGED_OUT = "LOGGED_OUT";
  static const String CREATOR_LOGGED_OUT = "CREATOR_LOGGED_OUT";
  static const String LOGGED_IN = "LOGGED_IN";
  static const String CREATOR_LOGGED_IN = "CREATOR_LOGGED_IN";
  static const String PENDING_VERIFICATION = "PENDING_VERIFICATION";
  static const String TOKEN_EXPIRED = "TOKEN_EXPIRED";
  static const String CACHE_STATE = "CACHE_STATE";
  static const String Oops = "Ooops..!";
  static const String NoCoursesYet = "You currently don’t have any course. \nPlease create a course";
  static const String NoInReviewCoursesYet = "You currently don’t have any course in Review. \nPlease create a course";
  static const String NoPublishedCoursesYet = "You currently don’t have any Published course. \nPlease create a course";
  static const String NoDownloadedCoursesYet = "You currently don’t have any Downloaded lesson. \nPlease download a lesson";
  static const String NoCartCoursesYet = "You currently don’t have any Course in cart. \nPlease add a course to cart";
  static const String NoPurchasedCoursesYet = "You currently have not purchased any courses yet. \nPlease purchase a course";
  static const String NoNetwork = "Seems you dont have Internet.... \nPlease check your internet connection and retry";
  static const String NotPurchasedThisCourse = "To get access to this content. \nPlease purchase this courses";
  static const String NoLiveSessions = "You currently don’t have any live sessions yet,. \nPlease create a course first, then you can click on the \n Add New button to schedule a live session";
  static const String NoLiveSessionsStudent = "You currently don’t have any live sessions yet,. \nOnce there is a live session, you'll see them here";

  // Validation defaults
  static const emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const phonePattern = r'^[0][1-9]\d{9}$';
  static const otpPattern = r'^[1-9]\d{5}$';
  static const urlDetectorPattern =
      r'^((http|ftp|https):\/\/)?([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:\/~+#-]*[\w@?^=%&\/~+#-])?';

  //Strings used in the app...
  static const List<String> WeekNumber = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '20',];
  static const List<String> displayPriority = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '20',];
  static const List<String> contentType = ["Video", "Audio", "Document"];
  static const List<String> videoContentAllowedExtensions = ['mov', 'mp4'];
  static const List<String> audioContentAllowedExtensions = ['mp3'];
  static const List<String> documentsContentAllowedExtensions = ['jpg', 'pdf', 'doc', 'docs'];
  static const List<String> allContentAllowedExtensions = ['jpg', 'pdf', 'doc', 'docs', 'mp3', 'mov', 'mp4'];
}
