import '../../../../core/network/connection_checker.dart';
import '../datasource/issue_remote_source.dart';
import '../../domain/repositories/issue_repository.dart';

class IssueRepositoryImpl implements IssueRepository{

final IssueRemoteSource remoteSource;
final ConnectionChecker connectionChecker;

IssueRepositoryImpl({required this.remoteSource,required this.connectionChecker});


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