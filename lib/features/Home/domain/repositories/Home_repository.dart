import 'package:fpdart/src/either.dart';

import 'package:ihb/core/error/failures.dart';

import 'package:ihb/features/Home/data/models/repository_response_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';

import '../../../../core/network/connection_checker.dart';
import '../../data/datasource/Home_remote_source.dart';

abstract class HomeRepository {
  final ConnectionChecker ? connectionChecker;
  final HomeRemoteSource ?remoteSource;
  HomeRepository( {this.connectionChecker,this.remoteSource});


  Future<Either<Failure, RepositoryResponseModel>> searchRepository(String page,search);

  Future<Either<Failure, IssueResponseModel>> searchRepositoryIssue(String page, search);
// Future<Either<Failure, LoginResponseModel>> login(String email);

}
