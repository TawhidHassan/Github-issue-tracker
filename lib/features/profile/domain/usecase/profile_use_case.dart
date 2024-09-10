
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';
import '../../../../core/usecase/usecase.dart';


class ProfileUseCase implements UseCase<Profile, GetProfileParams> {
final ProfileRepository? profileRepository;
ProfileUseCase({this.profileRepository});
    @override
    Future<Either<Failure, Profile>> call(GetProfileParams params) {
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


class GetProfileParams {
final int? page;

GetProfileParams({
this.page,

});
}