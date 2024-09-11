
import 'package:fpdart/fpdart.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';
import '../../../../core/error/failures.dart';
import '../entities/issue.dart';
import '../repositories/issue_repository.dart';
import '../../../../core/usecase/usecase.dart';


class IssueUseCase implements UseCase<Issue, GetIssueParams> {
final IssueRepository? issueRepository;
IssueUseCase({this.issueRepository});
    @override
    Future<Either<Failure, Issue>> call(GetIssueParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }


  @override
  Future<Either<Failure, IssueResponseModel>> searchIssue(String page, String search) {
  // TODO: implement call
  return issueRepository!.searchIssue(page,search);
  }

  @override
  Future<Either<Failure, IssueModel>>getIssueDetails(String id) {
  // TODO: implement call
  return issueRepository!.getIssueDetails(id);
  }



}


class GetIssueParams {
final int? page;

GetIssueParams({
this.page,

});
}