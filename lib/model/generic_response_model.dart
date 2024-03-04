import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GenericResponseModel {
  final bool status;
  final String message;
  final Map<String, dynamic> data;
  final List meta;
  final List pagination;

  GenericResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
      'meta': meta,
      'pagination': pagination,
    };
  }

  factory GenericResponseModel.fromMap(Map<String, dynamic> map) {
    return GenericResponseModel(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: Map<String, dynamic>.from((map['data'] as Map<String, dynamic>)),
      meta: List.from((map['meta'] as List)),
      pagination: List.from((map['pagination'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenericResponseModel.fromJson(String source) =>
      GenericResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
