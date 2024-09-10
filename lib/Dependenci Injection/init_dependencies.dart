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


part 'init_dependencies.main.dart';
