import 'package:ihb/features/Home/data/models/repository_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Home.dart';


part 'repository_response_model.g.dart';

@JsonSerializable()
class RepositoryResponseModel {

  @JsonKey(name: "total_count")
  int? totalCount;
  @JsonKey(name: "incomplete_results")
  bool? incompleteResults;
  @JsonKey(name: "items")
  List<RepositoryModel>? items;


  RepositoryResponseModel(this.totalCount, this.incompleteResults, this.items);

  factory RepositoryResponseModel.fromJson(Map<String, dynamic> json) => _$RepositoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryResponseModelToJson(this);
}