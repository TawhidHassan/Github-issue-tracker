import 'package:json_annotation/json_annotation.dart';
import '../../../Home/data/models/owner_model.dart';
import '../../domain/entities/issue.dart';


part 'issue_model.g.dart';

@JsonSerializable()
class IssueModel {

  @JsonKey(name: "url")
  String? url;
  String? state;
  @JsonKey(name: "repository_url")
  String? repositoryUrl;
  @JsonKey(name: "labels_url")
  String? labelsUrl;
  @JsonKey(name: "comments_url")
  String? commentsUrl;
  @JsonKey(name: "events_url")
  String? eventsUrl;
  @JsonKey(name: "html_url")
  String? htmlUrl;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "node_id")
  String? nodeId;
  @JsonKey(name: "number")
  int? number;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "user")
  OwnerModel? user;

  @JsonKey(name: "locked")
  bool? locked;
  @JsonKey(name: "assignee")
  dynamic assignee;
  @JsonKey(name: "assignees")
  List<dynamic>? assignees;
  @JsonKey(name: "milestone")
  dynamic milestone;
  @JsonKey(name: "comments")
  int? comments;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "closed_at")
  dynamic closedAt;
  @JsonKey(name: "active_lock_reason")
  dynamic activeLockReason;
  @JsonKey(name: "draft")
  bool? draft;
  @JsonKey(name: "body")
  String? body;
  @JsonKey(name: "timeline_url")
  String? timelineUrl;
  @JsonKey(name: "performed_via_github_app")
  dynamic performedViaGithubApp;
  @JsonKey(name: "state_reason")
  String? stateReason;
  @JsonKey(name: "score")
  int? score;


  IssueModel(
      this.url,
      this.repositoryUrl,
      this.labelsUrl,
      this.commentsUrl,
      this.eventsUrl,
      this.htmlUrl,
      this.id,
      this.nodeId,
      this.number,
      this.title,
      this.user,
      this.locked,
      this.assignee,
      this.assignees,
      this.milestone,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.activeLockReason,
      this.draft,
      this.body,
      this.timelineUrl,
      this.performedViaGithubApp,
      this.stateReason,
      this.score,this.state);

  factory IssueModel.fromJson(Map<String, dynamic> json) => _$IssueModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}