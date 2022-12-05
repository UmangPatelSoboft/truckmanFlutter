import 'package:json_annotation/json_annotation.dart';
import 'package:truckman/models/TruckManModel/truckManVerifyOtp.dart';

part 'truckManVerifyOtpResponse.g.dart';
@JsonSerializable()

class truckManVerifyOtpResponse {
  int? code;
  String? message;
  truckManVerifyOtp? truckmanVerifyOtp;
  bool? isValid;
  bool? isSuccessStatusCode;

  truckManVerifyOtpResponse(
      {this.code,
        this.message,
        this.truckmanVerifyOtp,
        this.isValid,
        this.isSuccessStatusCode});


  factory truckManVerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$truckManVerifyOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$truckManVerifyOtpResponseToJson(this);
  }
