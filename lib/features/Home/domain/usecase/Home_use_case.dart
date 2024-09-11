
import 'package:fpdart/fpdart.dart';
import 'package:ihb/features/Home/data/models/repository_response_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';
import '../../../../core/error/failures.dart';
import '../entities/Home.dart';
import '../repositories/Home_repository.dart';
import '../../../../core/usecase/usecase.dart';


class HomeUseCase implements UseCase<Home, GetHomeParams> {
final HomeRepository? homeRepository;
HomeUseCase({this.homeRepository});
    @override
    Future<Either<Failure, Home>> call(GetHomeParams params) {
    // TODO: implement call
    throw UnimplementedError();
    }

  @override
  Future<Either<Failure, RepositoryResponseModel>> searchRepository(String page,search) {
    // TODO: implement call
   return homeRepository!.searchRepository(page,search);
  }
  Future<Either<Failure, IssueResponseModel>> searchRepositoryIssue(String page,search) {
    // TODO: implement call
   return homeRepository!.searchRepositoryIssue(page,search);
  }




//
// @override
// Future<Either<Failure, LoginResponseModel>> call(GetLoginParams params) {
// // TODO: implement call
// return loginRepository!.login(params.email!,params.deviceToken!, params.password!, params.isPG!);
// }

}


class GetHomeParams {
final int? page;

GetHomeParams({
this.page,

});
}