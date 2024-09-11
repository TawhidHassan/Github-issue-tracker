import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../core/LocalDataBase/localdata.dart';
import '../core/network/api_services.dart';
import '../core/network/connection_checker.dart';
import '../features/Home/data/datasource/Home_remote_source.dart';
import '../features/Home/data/repositories/Home_repository_impl.dart';
import '../features/Home/domain/repositories/Home_repository.dart';
import '../features/Home/domain/usecase/Home_use_case.dart';
import '../features/Splash/data/datasource/SplashScreen_remote_source.dart';
import '../features/Splash/data/repositories/SplashScreen_repository.dart';
import '../features/issue/data/datasource/issue_remote_source.dart';
import '../features/issue/data/repositories/issue_repository_impl.dart';
import '../features/issue/domain/repositories/issue_repository.dart';
import '../features/issue/domain/usecase/issue_use_case.dart';
import '../features/profile/data/datasource/profile_remote_source.dart';
import '../features/profile/data/repositories/profile_repository_impl.dart';
import '../features/profile/domain/repositories/profile_repository.dart';
import '../features/profile/domain/usecase/profile_use_case.dart';


part 'init_dependencies.main.dart';
