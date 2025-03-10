

class ApiClient {

  ApiClient._();

  static const String baseUrl = "https://mypharmacy.fly.dev/api/";
  static const String accLogin = "${baseUrl}Account/login";
  static const String accLoginVerify = "${baseUrl}Account/verifyOtpOnLogIn";
  static const String accCreateOtp = "${baseUrl}Account/createOtp";
  static const String accSignUpVerify = "${baseUrl}Account/verifyOtpOnSignUp";
  static const String getPharmacyUser = "${baseUrl}Account/getPharmacyUsers";
  static const String getDoctorUser = "${baseUrl}Account/getDoctorUsers";
  static const String accCompleteProfile = "${baseUrl}Account/completeProfile";
  static const String getUserProfile = "${baseUrl}Account/getUserProfile";
  static const String getProductList = "${baseUrl}Product";
  static const String addAddress = "${baseUrl}Address";
  static const String editProfile = "${baseUrl}Account/updateProfile";


}