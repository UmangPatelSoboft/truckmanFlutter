import 'package:json_annotation/json_annotation.dart';

import 'employee.dart';

part 'employeeResponse.g.dart';

@JsonSerializable()
class EmployeeResponse{
  int? code;
  String? message;
  Employee employee;
  bool? isValid;
  bool? isSuccessStatusCode;

  EmployeeResponse(this.code, this.message, this.employee, this.isValid,
      this.isSuccessStatusCode);

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) => _$EmployeeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeResponseToJson(this);
}