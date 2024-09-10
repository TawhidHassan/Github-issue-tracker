import '../../../../core/network/connection_checker.dart';
import '../../data/datasource/Home_remote_source.dart';

 class HomeRepository {
  final ConnectionChecker ? connectionChecker;
  final HomeRemoteSource ?remoteSource;
  HomeRepository( {this.connectionChecker,this.remoteSource});
// Future<Either<Failure, LoginResponseModel>> login(String email);

}
