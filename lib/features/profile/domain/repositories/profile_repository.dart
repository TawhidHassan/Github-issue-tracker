import 'package:fpdart/src/either.dart';
import 'package:ihb/core/error/failures.dart';
import 'package:ihb/features/Home/data/models/owner_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, OwnerModel>> searchUser(String search);

// Future<Either<Failure, LoginResponseModel>> login(String email);

}
