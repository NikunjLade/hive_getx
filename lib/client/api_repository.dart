// import 'package:dartz/dartz.dart';
// import 'package:mypharmacy/app/app_class.dart';
// import 'api_client.dart';
// import 'api_provider.dart';
//
// class APIRepository extends ApiProvider {
//
//
//
//   Future<Either<String, dynamic>?> loginAccount(params) async {
//     var response = await postMethod<String>(ApiClient.accLogin,params);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, String>?> loginVerify (params) async {
//     var response = await postMethod<String>(ApiClient.accLoginVerify,params);
//    return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, dynamic>?> createSignUp(params) async {
//     var response = await postMethod<String>(ApiClient.accCreateOtp,params);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//
//   Future<Either<String, String>?> signUpVerify (params) async {
//     var response = await postMethod<String>(ApiClient.accSignUpVerify,params);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//
//   Future<Either<String, String>?> getPharmacyUsers() async {
//     var response = await getMethod<String>(ApiClient.getPharmacyUser);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//
//   Future<Either<String, String>?> getDoctorUsers() async {
//     var response = await getMethod<String>(ApiClient.getDoctorUser);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, String>?> completeProfile (params) async {
//     var response = await postMethod<String>(ApiClient.accCompleteProfile,params);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, String>?> getUserProfile (params) async {
//     AppClass().showLoading(true);
//     var response = await getMethod<String>(ApiClient.getUserProfile);
//     AppClass().showLoading(false);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, String>?> getProductList (int pageIndex,String brandId,String categoryId,String sort,String search) async {
//
//     var response = await getMethod<String>("${ApiClient.getProductList}?PageIndex=${pageIndex}&PageSize=10&BrandId=${brandId}&CategoryId=${categoryId}&Sort=${sort}&Search=${search}");
//
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, String>?> getProductDetails (int productId) async {
//     AppClass().showLoading(true);
//     var response = await getMethod<String>("${ApiClient.getProductList}/${productId}");
//     AppClass().showLoading(false);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//
//
//   Future<Either<String, dynamic>?> editProfile(params) async {
//     var response = await postMethod<String>(ApiClient.editProfile,params);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//   Future<Either<String, dynamic>?> addAddress(params) async {
//     var response = await postMethod<String>(ApiClient.addAddress,params);
//     return response?.fold((l) => Left(l), (r) => Right(r));
//   }
//
//
// }