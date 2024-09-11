// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryResponseModel _$RepositoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    RepositoryResponseModel(
      (json['total_count'] as num?)?.toInt(),
      json['incomplete_results'] as bool?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => RepositoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepositoryResponseModelToJson(
        RepositoryResponseModel instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
