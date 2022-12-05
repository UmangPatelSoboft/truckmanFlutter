
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truckman/models/TruckManModel/truckManVerifyOtp.dart';
import 'package:truckman/models/TruckManModel/truckManVerifyOtpResponse.dart';
import 'package:truckman/models/TruckManModel/truckman.dart';

import 'package:truckman/models/employee.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/TruckManModel/truckmanResponse.dart';
import '../models/employeeResponse.dart';
import 'logging.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://truckmanapi.rushkar.com/api',
      connectTimeout: 10000,
      receiveTimeout: 8000,
    ),
  )..interceptors.add(Logging());

  final Dio _truckManDio = Dio(
    BaseOptions(
      baseUrl: 'http://truckmanapi.rushkar.com/api',
      connectTimeout: 10000,
      receiveTimeout: 8000,
    ),
  )..interceptors.add(Logging());

final Dio _dioVerifyOtp = Dio(
    BaseOptions(
      baseUrl: 'http://truckmanapi.rushkar.com/api',
      connectTimeout: 10000,
      receiveTimeout: 8000,
    ),
  )..interceptors.add(Logging());

  /*Future<User?> getUser({required String id}) async {
    User? user;

    try {
      Response userData = await _dio.get('/users/$id');

      print('User Info: ${userData.data}');

      user = User.fromJson(userData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }*/

  /*Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        '/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }*/

  Future<EmployeeResponse?> Employee_SignIn(Employee employeeSignIn) async {
    EmployeeResponse? retrievedEmployeeResponse;

    try {
      Response response = await _dio.post(
        '/employee/Employee_SignIn',
        data: employeeSignIn.toJson(),
      );

      print('User created: ${response.data}');

      retrievedEmployeeResponse = EmployeeResponse.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedEmployeeResponse;
  }

  Future<truckManVerifyOtpResponse?> TruckMan_VerifyOtp(truckManVerifyOtp verifyOtp) async {
    truckManVerifyOtpResponse? retrievedVerifyOtp;

    try {
      Response response = await _dioVerifyOtp.post(
        '/truckman/Truckman_VerifyOtp',
        data: verifyOtp.toJson(),
      );

      print('User created: ${response.data}');

      retrievedVerifyOtp = truckManVerifyOtpResponse.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedVerifyOtp;
  }
  Future<TruckManResponse?> TruckMan_SignIn(TruckMan truckmanSignIn) async {
    TruckManResponse? retrievedTruckManResponse;
    try {
      Response response = await _truckManDio.post(
        '/truckman/Truckman_SendOTP',
        data: truckmanSignIn.toJson(),
      );
      print('User created: ${response.data}');

      final apimsg = retrievedTruckManResponse!.message.toString();


      retrievedTruckManResponse = TruckManResponse.fromJson(response.data);

      if(response.statusCode == 200){
          Fluttertoast.showToast(
              msg: apimsg.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
           );
      }else
        {
            Fluttertoast.showToast(
                msg: apimsg.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
        }
    }
    catch (e) {
      print('Error creating user: $e');
    }
    return retrievedTruckManResponse;
  }
      // if((response.statusCode ?? 0) >= 200 &&
      //     (response.statusCode ?? 0) < 300){
      //   final apiMsg = retrievedTruckManResponse.message;
      //   Fluttertoast.showToast(
      //       msg: apiMsg.toString(),
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0
      //   );
      // }

    // on SocketException {
    //   throw 'No Internet connection';
    // } on DioError catch (e) {
    //   switch (e.type) {
    //     case DioErrorType.connectTimeout:
    //       throw 'Connection timeOut';
    //     case DioErrorType.sendTimeout:
    //       throw 'Connection timeOut';
    //     case DioErrorType.receiveTimeout:
    //       throw 'Connection timeOut';
    //     case DioErrorType.response:
    //     Fluttertoast.showToast(
    //       msg: 'Something went wrong',
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0,
    //     );
    //     break;
    //     case DioErrorType.cancel:
    //       throw 'Request Canceled by user';
    //     case DioErrorType.other:
    //       throw 'Something went wrong.';
    //   }
    // }


  Map<String, dynamic>? handleResponse(retrievedTruckManResponse) {
    try {
      if ((retrievedTruckManResponse.statusCode ?? 0) >= 200 &&
          (retrievedTruckManResponse.statusCode ?? 0) < 500) {
        return retrievedTruckManResponse.data;
      } else if (retrievedTruckManResponse.statusCode == 200){
        Fluttertoast.showToast(
          msg: 'Successfully....',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 12.0,
        );
      }else{
        throw 'Error occurred while Communication with Server, with StatusCode : ${retrievedTruckManResponse.statusCode}';
      }
    } catch (e) {
      rethrow;
    }
  }

/*Future<UserInfo?> updateUser({
    required UserInfo userInfo,
    required String id,
  }) async {
    UserInfo? updatedUser;

    try {
      Response response = await _dio.put(
        '/users/$id',
        data: userInfo.toJson(),
      );

      print('User updated: ${response.data}');

      updatedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error updating user: $e');
    }

    return updatedUser;
  }*/

/*Future<void> deleteUser({required String id}) async {
    try {
      await _dio.delete('/users/$id');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }*/
}
