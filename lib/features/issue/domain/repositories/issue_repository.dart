import 'package:fpdart/src/either.dart';
import 'package:ihb/core/error/failures.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';

abstract class IssueRepository {
  Future<Either<Failure, IssueResponseModel>> searchIssue(String page, String search);
  Future<Either<Failure, IssueModel>> getIssueDetails(String id);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
