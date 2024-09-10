
import 'package:fpdart/fpdart.dart';
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

//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetIssueParams {
final int? page;

GetIssueParams({
this.page,

});
}