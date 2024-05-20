// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'package:a/common_api_call/common_api_call.dart';
import 'package:equatable/equatable.dart';

class TermsConditionDataModel extends ModelResponseExtend {
  final bool status;
  final String message;
  final TermsConditionModel data;

  TermsConditionDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TermsConditionDataModel.fromJson(Map<String, dynamic> json) => TermsConditionDataModel(
        status: json["status"],
        message: json["message"],
        data: TermsConditionModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class TermsConditionModel extends TermsConditionModelEntity {
  final String title;
  final String description;

  const TermsConditionModel({
    required this.title,
    required this.description,
  }) : super(
          description: description,
          title: title,
        );

  factory TermsConditionModel.fromJson(Map<String, dynamic> json) => TermsConditionModel(
        title: json["title"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class TermsConditionModelEntity extends Equatable {
  final String title;
  final String description;
  const TermsConditionModelEntity({
    required this.title,
    required this.description,
  });
  @override
  List<Object?> get props => [
        title,
        description,
      ];
}
