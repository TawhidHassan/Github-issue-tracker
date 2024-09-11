// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => OwnerModel(
      json['login'] as String?,
      json['name'] as String?,
      json['location'] as String?,
      json['email'] as String?,
      json['bio'] as String?,
      (json['public_repos'] as num?)?.toInt(),
      (json['public_gists'] as num?)?.toInt(),
      (json['followers'] as num?)?.toInt(),
      (json['following'] as num?)?.toInt(),
      json['message'] as String?,
      (json['id'] as num?)?.toInt(),
      json['node_id'] as String?,
      json['avatar_url'] as String?,
      json['gravatar_id'] as String?,
      json['url'] as String?,
      json['html_url'] as String?,
      json['followers_url'] as String?,
      json['following_url'] as String?,
      json['gists_url'] as String?,
      json['starred_url'] as String?,
      json['subscriptions_url'] as String?,
      json['organizations_url'] as String?,
      json['repos_url'] as String?,
      json['events_url'] as String?,
      json['received_events_url'] as String?,
      json['site_admin'] as bool?,
    );

Map<String, dynamic> _$OwnerModelToJson(OwnerModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'bio': instance.bio,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'followers': instance.followers,
      'following': instance.following,
      'message': instance.message,
      'id': instance.id,
      'node_id': instance.nodeId,
      'avatar_url': instance.avatarUrl,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'site_admin': instance.siteAdmin,
    };
