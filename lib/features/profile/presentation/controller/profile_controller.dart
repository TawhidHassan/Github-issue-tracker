
import 'package:get/get.dart';
import '../../domain/usecase/profile_use_case.dart';


class ProfileController extends GetxController implements GetxService{
  ProfileUseCase? profileUseCase;
  ProfileController({ profileUseCase });


}

