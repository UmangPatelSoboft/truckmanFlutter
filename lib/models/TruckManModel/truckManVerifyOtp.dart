import 'package:json_annotation/json_annotation.dart';

part 'truckManVerifyOtp.g.dart';

@JsonSerializable()
class truckManVerifyOtp {
  int? id;
  int? noOfTruckManRequest;
  int? customerCount;
  int? tripCount;
  int? paymentCount;
  int? noOfTruckRequest;
  int? noOfCustomerRequest;
  int? noOfPaymentRequest;
  String? firstName;
  String? email;
  String? password;
  String? customerSupportNumber;
  String? tDS;
  String? panCard;
  String? aadharCard;
  String? accountNumber;
  String? cancelCheque;
  String? vehicleRC;
  String? vehicleNumber;
  bool? isApprove;
  bool? isEnable;
  String? monthYears;
  String mobileNumber;
  String? profileImage;
  String? lastLogin;
  int? generalAccountStatusId;
  String? generalAccountStatusName;
  String deviceToken;
  String deviceType;
  String uDID;
  String iMEI;
  int oTP;
  bool? isSignup;
  String? tDSStr;
  String? panCardStr;
  String? aadharCardStr;
  String? cancelChequeStr;
  String? lastLoginStr;
  bool? isActive;
  String? createdDate;
  int? createdBy;
  String? updatedDate;
  int? updatedBy;
  String? deletedDate;
  int? deletedBy;
  String? createdDateStr;
  String? updatedDateStr;
  String? deletedDateStr;

  truckManVerifyOtp({this.id,
    this.noOfTruckManRequest,
    this.customerCount,
    this.tripCount,
    this.paymentCount,
    this.noOfTruckRequest,
    this.noOfCustomerRequest,
    this.noOfPaymentRequest,
    this.firstName,
    this.email,
    this.password,
    this.customerSupportNumber,
    this.tDS,
    this.panCard,
    this.aadharCard,
    this.accountNumber,
    this.cancelCheque,
    this.vehicleRC,
    this.vehicleNumber,
    this.isApprove,
    this.isEnable,
    this.monthYears,
    required this.mobileNumber,
    this.profileImage,
    this.lastLogin,
    this.generalAccountStatusId,
    this.generalAccountStatusName,
    required this.deviceToken,
    required this.deviceType,
    required this.uDID,
    required this.iMEI,
    required this.oTP,
    this.isSignup,
    this.tDSStr,
    this.panCardStr,
    this.aadharCardStr,
    this.cancelChequeStr,
    this.lastLoginStr,
    this.isActive,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.deletedDate,
    this.deletedBy,
    this.createdDateStr,
    this.updatedDateStr,
    this.deletedDateStr});

  factory truckManVerifyOtp.fromJson(Map<String, dynamic> json) => _$truckManVerifyOtpFromJson(json);

  Map<String, dynamic> toJson() => _$truckManVerifyOtpToJson(this);
}