
class ResultModel {

  int? statusCode;
  String? message;

  ResultModel({
    this.statusCode,
    this.message,
  });
  ResultModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode']?.toInt();
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}
