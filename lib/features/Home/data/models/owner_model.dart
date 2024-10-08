import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/Home.dart';


part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel {

  @JsonKey(name: "login")
  String? login;
  String? name;
  String? location;
  String? email;
  String? bio;
  int? public_repos;
  int? public_gists;
  int? followers;
  int? following;
  String? message;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "node_id")
  String? nodeId;
  @JsonKey(name: "avatar_url")
  String? avatarUrl;
  @JsonKey(name: "gravatar_id")
  String? gravatarId;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "html_url")
  String? htmlUrl;
  @JsonKey(name: "followers_url")
  String? followersUrl;
  @JsonKey(name: "following_url")
  String? followingUrl;
  @JsonKey(name: "gists_url")
  String? gistsUrl;
  @JsonKey(name: "starred_url")
  String? starredUrl;
  @JsonKey(name: "subscriptions_url")
  String? subscriptionsUrl;
  @JsonKey(name: "organizations_url")
  String? organizationsUrl;
  @JsonKey(name: "repos_url")
  String? reposUrl;
  @JsonKey(name: "events_url")
  String? eventsUrl;
  @JsonKey(name: "received_events_url")
  String? receivedEventsUrl;
  @JsonKey(name: "site_admin")
  bool? siteAdmin;


  OwnerModel(
      this.login,
      this.name,
      this.location,
      this.email,
      this.bio,
      this.public_repos,
      this.public_gists,
      this.followers,
      this.following,
      this.message,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.siteAdmin);

  factory OwnerModel.fromJson(Map<String, dynamic> json) => _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}