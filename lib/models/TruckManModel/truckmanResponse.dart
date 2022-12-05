import 'package:json_annotation/json_annotation.dart';
import 'package:truckman/models/TruckManModel/truckman.dart';

part 'truckmanResponse.g.dart';

@JsonSerializable()
class TruckManResponse {
  int? code;
  String? message;
  TruckMan? truckMan;
  bool? isValid;
  bool? isSuccessStatusCode;

  TruckManResponse(
      this.code,
        this.message,
        this.truckMan,
        this.isValid,
        this.isSuccessStatusCode);


  factory TruckManResponse.fromJson(Map<String, dynamic> json) => _$TruckManResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TruckManResponseToJson(this);



}