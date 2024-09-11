import 'package:ihb/features/Home/data/models/repository_model.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'issues_response_model.g.dart';

@JsonSerializable()
class IssueResponseModel {

  @JsonKey(name: "total_count")
  int? totalCount;
  @JsonKey(name: "incomplete_results")
  bool? incompleteResults;
  @JsonKey(name: "items")
  List<IssueModel>? items;


  IssueResponseModel(this.totalCount, this.incompleteResults, this.items);

  factory IssueResponseModel.fromJson(Map<String, dynamic> json) => _$IssueResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueResponseModelToJson(this);
}