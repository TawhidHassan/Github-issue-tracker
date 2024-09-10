import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/issue.dart';


part 'issue_model.g.dart';

@JsonSerializable()
class IssueModel extends Issue {

  String? name;
  IssueModel(this.name,);





  factory IssueModel.fromJson(Map<String, dynamic> json) => _$IssueModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}