// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueResponseModel _$IssueResponseModelFromJson(Map<String, dynamic> json) =>
    IssueResponseModel(
      (json['total_count'] as num?)?.toInt(),
      json['incomplete_results'] as bool?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => IssueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IssueResponseModelToJson(IssueResponseModel instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
