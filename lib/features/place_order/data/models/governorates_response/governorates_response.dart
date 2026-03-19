import 'governorate.dart';

class GovernoratesResponse {
  List<Governorate>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  GovernoratesResponse({this.data, this.message, this.error, this.status});

  GovernoratesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Governorate>[];
      json['data'].forEach((v) {
        data!.add(Governorate.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['error'] = error;
    data['status'] = status;
    return data;
  }
}
