// import 'dart:convert';
// import 'dart:io';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import '../../data/local/session_manager.dart';
// import '../../generated/locales.g.dart';
// import '../../utility/constants.dart';
// import 'api_client.dart';
// import 'connectivity_manager.dart';
//
//
//
// class ApiProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.baseUrl = ApiClient.baseUrl;
//     httpClient.maxAuthRetries = 3;
//   }
//
//   Future<Either<String, dynamic>?> getMethod<T>(
//       String url,
//       // String? token,
//       {Map<String, dynamic>? query}
//       ) async {
//     try {
//       if (await ConnectivityManager().checkInternet()) {
//         String? token = SessionStorage().getAuthToken();
//         var response = await get(url, query: query,headers:{
//           'Authorization': 'Bearer $token',
//         'Content-Type' : 'application/json'
//         } );
//         // var response = await get( url, query: query, headers: token != null ? {'Authorization': 'Bearer $token'} : null, );
//         debugPrint('test==>> API: $url');
//         return _handleResponse(response);
//       } else {
//         return Left(LocaleKeys.checkYourInternetConnection.tr);
//       }
//     } catch (e, s) {
//       debugPrint('test==>> error: $e \n $s');
//       return Left(LocaleKeys.somethingWentWrong.tr);
//     }
//   }
//
//   Future<Either<String, dynamic>?> postMethod<T>(String url, dynamic bodyPart,
//       {Progress? uploadProgress, Map<String, File>? files}) async {
//     try {
//       if (await ConnectivityManager().checkInternet()) {
//         String? token = SessionStorage().getAuthToken();
//         debugPrint('test==>> POST');
//         debugPrint('test==>> token: $token');
//         debugPrint('test==>> body: $bodyPart');
//         debugPrint('test==>> API: $url');
//
//         final form = FormData({...bodyPart});
//
//         if (files != null) {
//           files.forEach((key, value) {
//             String fileName = value.path.split('/').last;
//             form.files.add(
//                 MapEntry(key, MultipartFile(value, filename: fileName)));
//           });
//         }
//
//         var response = await post(url, bodyPart, headers: _getHeaders(token)
//
//         );
//         print("=====>>RESPONSE BODY");
//         print("=====${response.body}");
//
//         return _handleResponse(response);
//       } else {
//         return Left(LocaleKeys.checkYourInternetConnection.tr);
//       }
//     } catch (e, s) {
//       debugPrint('test==>> error: $e \n $s');
//       return Left(LocaleKeys.somethingWentWrong.tr);
//     }
//   }
//
//   Future<Either<String, dynamic>?> putMethod<T>(String url, dynamic body,
//       {Progress? uploadProgress, Map<String, File>? files}) async {
//     try {
//       if (await ConnectivityManager().checkInternet()) {
//         String? token = SessionStorage().getAuthToken();
//         final form = FormData({...body});
//
//         if (files != null) {
//           files.forEach((key, value) {
//             String fileName = value.path.split('/').last;
//             form.files.add(
//                 MapEntry(key, MultipartFile(value, filename: fileName)));
//           });
//         }
//
//         var response = await put(url, form, headers: _getHeaders(token));
//         return _handleResponse(response);
//       } else {
//         return Left(LocaleKeys.checkYourInternetConnection.tr);
//       }
//     } catch (e, s) {
//       debugPrint('test==>> error: $e \n $s');
//       return Left(LocaleKeys.somethingWentWrong.tr);
//     }
//   }
//
//   Map<String, String> _getHeaders(String? token) {
//     final headers = <String, String>{};
//     if (token != null) {
//       headers['Authorization'] = 'Bearer $token';
//       headers['Content-Type'] = 'application/json';
//
//     }else {
//       headers['Content-Type'] = 'application/json';
//     }
//
//     debugPrint("=====${headers.toString()}");
//     return headers;
//   }
//
//   Either<String, dynamic> _handleResponse(Response response) {
//     debugPrint("=====StatusCOde${response.statusCode}");
//     switch (response.statusCode) {
//       case Constants.isSuccess200:
//       case Constants.isSuccess201:
//         return Right(response.bodyString);
//       case Constants.isCode400:
//         var responseJson = json.decode(response.body);
//         var message = responseJson['detail'];
//         return Left(message);
//       case Constants.isCode401:
//         var responseJson = json.decode(response.body.toString());
//         var message = responseJson['response']['detail'];
//         return Left(message);
//       case Constants.isCode500:
//         return Left(LocaleKeys.serverError.tr);
//       default:
//         return Left("Something went wrong.");
//     }
//   }
// }
//
//
//
//
// /*
//
// class ApiProvider extends GetConnect {
//
//   @override
//   void onInit() {
//     httpClient.baseUrl = ApiClient.baseUrl;
//     httpClient.maxAuthRetries = 3;
//   }
//
//   Future<Either<String, dynamic>?> getMethod<T>(String url,
//       // String? token,
//           {
//         Map<String, dynamic>? query,
//       }) async {
//     try {
//       if (await ConnectivityManager().checkInternet()) {
//         var response = await get(url, query: query, headers: {
//           // if (token != null) ...{
//           //   'Authorization': 'Bearer $token',
//           // }
//         });
//         debugPrint('test==>> API: $url');
//         switch (response.statusCode) {
//           case Constants.isSuccess200:
//           case Constants.isSuccess201:
//           // var responseBody = json.encode(result.body );
//           // return Right( response.body);
//             return Right(response.bodyString);
//           case Constants.isCode400:
//             var responseJson = json.decode(response.body.toString());
//             var message = responseJson['response']['message'];
//             return Left(message);
//           case Constants.isCode401:
//             var responseJson = json.decode(response.body.toString());
//             var message = responseJson['response']['message'];
//             return Left(message);
//           case Constants.isCode500:
//             return Left(LocaleKeys.serverError.tr);
//           default:
//             return Left(LocaleKeys.somethingWentWrong.tr);
//         }
//       } else {
//         return Left(LocaleKeys.checkYourInternetConnection.tr);
//       }
//     } catch (e, s) {
//       debugPrint('test==>> error: $e \n $s');
//       return Left(LocaleKeys.somethingWentWrong.tr);
//     }
//   }
//
//   Future<Either<String, dynamic>?> postMethod<T>(String url,
//       dynamic bodyPart, {
//         Progress? uploadProgress,
//         Map<String, File>? files,
//       }) async {
//     try {
//       if (await ConnectivityManager().checkInternet()) {
//         String? token = SessionStorage().getAuthToken();
//         debugPrint('test==>> POST');
//         debugPrint('test==>> token: $token');
//         debugPrint('test==>> body: $bodyPart');
//         debugPrint('test==>> API: $url');
//         final form = FormData({
//           ...bodyPart,
//         });
//         if (files != null) {
//           files.forEach((key, value) {
//             String fileName = value.path
//                 .split('/')
//                 .last;
//             form.files.add(
//                 MapEntry(key, MultipartFile(value, filename: fileName)));
//           });
//         }
//         // var result = await post( url, form, uploadProgress: uploadProgress, headers: {
//         var response = await post(url, bodyPart, headers: {
//           if (token != null) ...{
//             'Authorization': 'Bearer $token',
//           }
//         });
//         switch (response.statusCode) {
//           case Constants.isSuccess200:
//           case Constants.isSuccess201:
//           // var responseBody = json.encode(result.body );
//           return Right( response.body);
//             // return Right(response.bodyString);
//           case Constants.isCode400:
//             var responseJson = json.decode(response.body.toString());
//             var message = responseJson['response']['message'];
//             return Left(message);
//           case Constants.isCode401:
//             var responseJson = json.decode(response.body.toString());
//             var message = responseJson['response']['message'];
//             return Left(message);
//           case Constants.isCode500:
//             return Left(LocaleKeys.serverError.tr);
//           default:
//             return Left(LocaleKeys.somethingWentWrong.tr);
//         }
//       } else {
//         return Left(LocaleKeys.checkYourInternetConnection.tr);
//       }
//     } catch (e, s) {
//       debugPrint('test==>> error: $e \n $s');
//       return Left(LocaleKeys.somethingWentWrong.tr);
//     }
//   }
//
//   Future<Either<String, dynamic>?> putMethod<T>(String url,
//       dynamic body, {
//         Progress? uploadProgress,
//         Map<String, File>? files,
//       }) async {
//     try {
//       if (await ConnectivityManager().checkInternet()) {
//         String? token = SessionStorage().getAuthToken();
//         final form = FormData({
//           ...body,
//         });
//         if (files != null) {
//           files.forEach((key, value) {
//             String fileName = value.path
//                 .split('/')
//                 .last;
//             form.files.add(
//                 MapEntry(key, MultipartFile(value, filename: fileName)));
//           });
//         }
//         var response = await put(
//             url, form, uploadProgress: uploadProgress, headers: {
//           if (token != null) ...{
//             'Authorization': 'Bearer $token',
//           }
//         });
//         debugPrint('test==>> API: $url');
//         switch (response.statusCode) {
//           case Constants.isSuccess200:
//           case Constants.isSuccess201:
//           // var responseBody = json.encode(result.body );
//           // return Right( response.body);
//             return Right(response.bodyString);
//           case Constants.isCode400:
//             var responseJson = json.decode(response.body.toString());
//             var message = responseJson['response']['message'];
//             return Left(message);
//           case Constants.isCode401:
//             var responseJson = json.decode(response.body.toString());
//             var message = responseJson['response']['message'];
//             return Left(message);
//           case Constants.isCode500:
//             return Left(LocaleKeys.serverError.tr);
//           default:
//             return Left(LocaleKeys.somethingWentWrong.tr);
//         }
//       } else {
//         return Left(LocaleKeys.checkYourInternetConnection.tr);
//       }
//     } catch (e, s) {
//       debugPrint('test==>> error: $e \n $s');
//       return Left(LocaleKeys.somethingWentWrong.tr);
//     }
//   }
// }
//
// */
//
//
// /*
//
//   Future<Either<String, dynamic>?> _returnResponse<T>( Response response ){
//   // dynamic _returnResponse(Response response ) {
//     debugPrint("test==>> response code ====>>>>>${response.statusCode}");
//     debugPrint("test==>> response body ====>>>>>${response.body}");
//     switch (response.statusCode) {
//       case Constants.isSuccess200:
//       case Constants.isSuccess201:
//         //     var responseBody = json.encode(result.body );
//         // return Right( response.body);
//         return Right( response.bodyString);
//       case Constants.isCode400:
//         var responseJson = json.decode(response.body.toString());
//         var message = responseJson['response']['message'];
//         return Left(message);
//       case Constants.isCode401:
//         var responseJson = json.decode(response.body.toString());
//         var message = responseJson['response']['message'];
//         return Left(message);
//       case Constants.isCode500:
//         return Left(LocaleKeys.serverError.tr);
//       default:
//         return Left(LocaleKeys.somethingWentWrong.tr);
//
//     }
//   }
// */
//
// /// token expire logic
// /*  if (commonResponse.isTokenExpired) {
//           /// Show token expired popup
//           Utils.showPopupDialog(LocaleKeys.error.tr, commonResponse.responseMessage!,
//               textConfirm: LocaleKeys.signIn.tr,
//               isDismissible: false,
//               onWillPop: () => Future.value(false),
//               onConfirm: () {
//                 Get.back();
//                 Get.offAllNamed(AppRoutes.loginPage);
//               },
//               confirmTextColor: AppColors.colorBE002D);
//           return null;
//         }*/
