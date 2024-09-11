import 'package:fpdart/src/either.dart';

import 'package:ihb/core/error/failures.dart';

import 'package:ihb/features/Home/data/models/owner_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/profile_remote_source.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{

final ProfileRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

ProfileRepositoryImpl({required this.remoteSource,required this.connectionChecker});

  @override
  Future<Either<Failure, OwnerModel>> searchUser(String search)async {
    // TODO: implement searchUser
    try{
    if (!await (connectionChecker.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource.searchUser(search);
      if(data!.message!=null){
        return left(Failure(data!.message!));
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