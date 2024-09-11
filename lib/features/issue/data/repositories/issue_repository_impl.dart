import 'package:fpdart/src/either.dart';

import 'package:ihb/core/error/failures.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';

import 'package:ihb/features/issue/data/models/issues_response_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/issue_remote_source.dart';
import '../../domain/repositories/issue_repository.dart';

class IssueRepositoryImpl implements IssueRepository{

final IssueRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

IssueRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, IssueResponseModel>> searchIssue(String page, String search)async {
    // TODO: implement searchIssue
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.searchIssue(page,search);
      if(data==null){
        return left(Failure("Some things wrongs"));
      }else{
        return right(data);
      }
      // return right(episodes!.results!);
    }
  }on ServerException catch(e){
    return left(Failure(e.message));
  }
  }

  @override
  Future<Either<Failure, IssueModel>> getIssueDetails(String id)async {
    // TODO: implement getIssueDetails
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.getIssueDetails(id);
        if(data==null){
          return left(Failure("Some things wrongs"));
        }else{
          return right(data);
        }
        // return right(episodes!.results!);
      }
    }on ServerException catch(e){
      return left(Failure(e.message));
    }
  }


// @override
// Future<Either<Failure, LoginResponseModel>> login(String email,String deviceToken, String pass, bool isPG) async{
//   // TODO: implement login
//   try{
//     if (!await (connectionChecker.isConnected)) {
//       return left(Failure("no internet connection!!"));
//     }else{
//       final data = await remoteSource.login(email,deviceToken,pass,isPG);
//       if(data!.status!="success"){
//         return left(Failure(data.message!));
//       }else{
//         return right(data);
//       }
//       // return right(episodes!.results!);
//     }
//   }on ServerException catch(e){
//     return left(Failure(e.message));
//   }
// }
}