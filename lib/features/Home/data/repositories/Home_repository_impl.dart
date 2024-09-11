import 'package:fpdart/src/either.dart';

import 'package:ihb/core/error/failures.dart';

import 'package:ihb/features/Home/data/models/repository_response_model.dart';
import 'package:ihb/features/issue/data/models/issues_response_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/Home_remote_source.dart';
import '../../domain/repositories/Home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{

final HomeRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

HomeRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, RepositoryResponseModel>> searchRepository(String page,search)async {
    // TODO: implement searchRepository
  try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.searchRepository(page,search);
      if(data!.items==null){
        return left(Failure("some things wrong"));
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
  Future<Either<Failure, IssueResponseModel>> searchRepositoryIssue(String page, search)async {
    // TODO: implement searchRepositoryIssue
    try{
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("no internet connection!!"));
      }else{
        final data = await remoteSource.searchRepositoryIssue(page,search);
        if(data!.items==null){
          return left(Failure("some things wrong"));
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