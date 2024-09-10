import 'package:fpdart/fpdart.dart';
import '../../../../features/Splash/data/models/SplashScreen_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/connection_checker.dart';
import '../datasource/SplashScreen_remote_source.dart';

class SplashScreenRepository {
final SplashScreenRemoteSource? remoteSource;
final ConnectionChecker? connectionChecker;

SplashScreenRepository({this.connectionChecker, this.remoteSource});


Future<Either<Failure, SplashScreenModel>> call(bool isPg)async {
  // TODO: implement login
  try{
    if (!await (connectionChecker!.isConnected)) {
      return left(Failure("no internet connection!!"));
    }else{
      final data = await remoteSource!.call(isPg);
      if(data.status!="success"){
        return left(Failure(data.status!));
      }else{
        return right(data);
      }
      // return right(episodes!.results!);
    }
  }on ServerException catch(e){
    return left(Failure(e.message));
  }
}
}