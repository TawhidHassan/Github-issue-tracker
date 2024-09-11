import '/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///staging
  static const String mainDomain = "https://api.github.com";
  static const String baseUrl = "$mainDomain/";
  static const String imageBaseUrl = "https://api.github.com";

      ///------------------------------End point----------------------------------------
  static  String SEARCH_REPOSITORY= 'search/repositories?q='.addBaseURl;
  static  String SEARCH_REPOSITORY_ISSUE= 'repos/'.addBaseURl;

  static  String SEARCH_ISSUE= 'search/issues?q=is:issue+'.addBaseURl;
  static  String DETAILS_ISSUE= 'repos/'.addBaseURl;

  static  String USER_PROFILE= 'users/'.addBaseURl;


}
