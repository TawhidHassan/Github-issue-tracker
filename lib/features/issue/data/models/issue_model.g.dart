// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) => IssueModel(
      json['url'] as String?,
      json['repository_url'] as String?,
      json['labels_url'] as String?,
      json['comments_url'] as String?,
      json['events_url'] as String?,
      json['html_url'] as String?,
      (json['id'] as num?)?.toInt(),
      json['node_id'] as String?,
      (json['number'] as num?)?.toInt(),
      json['title'] as String?,
      json['user'] == null
          ? null
          : OwnerModel.fromJson(json['user'] as Map<String, dynamic>),
      json['locked'] as bool?,
      json['assignee'],
      json['assignees'] as List<dynamic>?,
      json['milestone'],
      (json['comments'] as num?)?.toInt(),
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      json['closed_at'],
      json['active_lock_reason'],
      json['draft'] as bool?,
      json['body'] as String?,
      json['timeline_url'] as String?,
      json['performed_via_github_app'],
      json['state_reason'] as String?,
      (json['score'] as num?)?.toInt(),
      json['state'] as String?,
    );

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'state': instance.state,
      'repository_url': instance.repositoryUrl,
      'labels_url': instance.labelsUrl,
      'comments_url': instance.commentsUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'id': instance.id,
      'node_id': instance.nodeId,
      'number': instance.number,
      'title': instance.title,
      'user': instance.user,
      'locked': instance.locked,
      'assignee': instance.assignee,
      'assignees': instance.assignees,
      'milestone': instance.milestone,
      'comments': instance.comments,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'closed_at': instance.closedAt,
      'active_lock_reason': instance.activeLockReason,
      'draft': instance.draft,
      'body': instance.body,
      'timeline_url': instance.timelineUrl,
      'performed_via_github_app': instance.performedViaGithubApp,
      'state_reason': instance.stateReason,
      'score': instance.score,
    };
