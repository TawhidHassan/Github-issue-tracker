import '/core/extentions/custom_extentions.dart';

class ApiEndpoint {
  ///staging
  static const String mainDomain = "https://staging-ihb-api.encodebd.com";
  static const String baseUrl = "$mainDomain/api/v1/";
  static const String imageBaseUrl = "https://staging-ihbbsrmbackend.sgp1.digitaloceanspaces.com/";

      ///------------------------------End point----------------------------------------
  static  String OTP_SEND= 'customer-auth/send-otp'.addBaseURl;
  static  String OTP_VERIFY= 'customer-auth/verify-otp'.addBaseURl;
  static  String SIGN_UP= 'customer-auth/signup'.addBaseURl;
  static  String SIGN_IN= 'customer-auth/login'.addBaseURl;

  static  String FORGET_OTP_SET= 'customer-auth/send-forgot-password-otp'.addBaseURl;
  static  String FORGET_OTP_VERIFY= 'customer-auth/verify-forgot-password-otp'.addBaseURl;
  static  String SETUP_NEW_PASSWORD= 'customer-auth/reset-password'.addBaseURl;

  static  String GET_USER_PROFILE = 'customer-panel/profile/'.addBaseURl;
  static  String UPDATE_USER_PROFILE = 'customer-panel/profile/'.addBaseURl;
  static  String IMAGE_UPLOAD = 'data-dump/upload-File/'.addBaseURl;


  static  String POLICY_URL= 'common-data/data'.addBaseURl;
  static  String FAQ_URL= 'faq/data'.addBaseURl;

  static  String SLIDER_URL= 'slide/data/'.addBaseURl;
  static  String DIVISION_URL= 'division/data'.addBaseURl;

  static  String DISTRICT_URL= 'district/data/?divisionId='.addBaseURl;

  static  String NEAR_SHOP_URL= 'retailer/nearest-retailer'.addBaseURl;
  static  String SHOP_DETAILS_URL= 'retailer/retailer-details/'.addBaseURl;
  static  String PRODUCT_CATEGORY_URL= 'customer-panel/category-product/retailer-product-category?retailerId='.addBaseURl;
  static  String PRODUCT_URL= 'customer-panel/category-product/retailer-category-product?retailerId='.addBaseURl;


  static  String CATEGORY_URL= 'blog-category/data/'.addBaseURl;
  static  String CATEGORY_BLOG_URL= 'blog/data?limit=10&pageNo=1&categoryId='.addBaseURl;
  static  String SCRATCH_TYPE_URL= 'scratch-type/data'.addBaseURl;

  static  String BEST_SELLING_URL= 'customer-panel/category-product/best-selling-product?retailerId='.addBaseURl;
  static  String PRODUCT_DETAILS_URL= 'customer-panel/category-product/product-details/'.addBaseURl;

  static  String BUILD_SERVICE_URL= 'scratch-type/setup-data/'.addBaseURl;
  static  String EXPERT_LIST_URL= 'expert-category/data/?limit=0&pageNo=0&status=true'.addBaseURl;
  static  String EXPERT_PERSON_LIST_URL= 'expert/data?'.addBaseURl;

  static  String READY_MIX_URL= 'ready-mix/data'.addBaseURl;
  static  String CREATE_ORDER_URL= 'customer-panel/order'.addBaseURl;
  static  String GET_MY_ORDER_URL= 'customer-panel/order/order-list'.addBaseURl;
  static  String AAD_WISHLIST_URL= 'customer-panel/wish-list'.addBaseURl;

  static  String STEEL_BAR_URL= 'product-category/data/?limit=0&pageNo=0&status=true&parentCategoryId='.addBaseURl;



  static  String GET_ALL_CHARACTERS = 'character'.addBaseURl;
  static  String BANK_LIST_URL = 'bank/data'.addBaseURl;
  static  String GET_CHARACTER_DETAILS = 'character'.addBaseURl;



  static  String GET_ALL_LOCATION = 'location'.addBaseURl;

  static  String GET_ALL_EPISODE = 'episode'.addBaseURl;
//! auth
  static String categoryUrl = 'app-home-notices'.addBaseURl;


}
