class AppUrl{
  static const String baseUrl="http://10.109.20.109:3000/api/v1";
  // static const String baseUrl="https://umeed-e-hayat.up.railway.app/api/v1";
  static const String loginUrl="$baseUrl/user/login";
  static const String signupOTPUrl="$baseUrl/user/signup/sendotp";
  static const String signupUrl="$baseUrl/user/signup";
  static const String resetPasswordOtpUrl="$baseUrl/user/resetPassword/otp";
  static const String resetPasswordUrl="$baseUrl/user/resetPassword";
  static const String getUserUrl="$baseUrl/user/get";
  static const String getAllDonorsUrl="$baseUrl/user/get/all/donors";
  static const String updateUser="$baseUrl/user/update";
  //for Request blood
  static const String getRequestListUrl="$baseUrl/request/active/requests";
  static const String addRequestUrl="$baseUrl/request/post";
}