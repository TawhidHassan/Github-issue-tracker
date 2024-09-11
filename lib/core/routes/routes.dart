import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ihb/features/issue/data/models/issue_model.dart';
import 'package:ihb/features/issue/presentation/pages/issue_details_page.dart';
import 'package:ihb/features/issue/presentation/pages/issue_page.dart';
import 'package:ihb/features/profile/presentation/pages/profile_page.dart';
import '../../Dependenci Injection/init_dependencies.dart';
import '../../features/Home/data/models/repository_model.dart';
import '../../features/Home/presentation/pages/Home_page.dart';
import '../../features/Home/presentation/pages/repos_issue.dart';
import '../../features/mainScreen/presentation/pages/mainScreen_page.dart';
import '../LocalDataBase/localdata.dart';
import '/core/routes/route_path.dart';
import '../../features/Error/presentation/error_page.dart';
import '../../features/Splash/presentation/Pages/splash_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'Home');
  static final _shellNavigatorIssuesKey =
      GlobalKey<NavigatorState>(debugLabel: 'Issue');
  static final _shellNavigatorProfilrKey =
      GlobalKey<NavigatorState>(debugLabel: 'Profile');

  static final GoRouter routerx = GoRouter(
    initialLocation: Routes.splashScreenPath,
    // navigatorKey: Get.key,
    debugLogDiagnostics: true,
    routes: [
      /// splash
      GoRoute(
        name: Routes.splashScreen,
        path: Routes.splashScreenPath,
        builder: (context, state) => SplashPage(),
        redirect:  (context, state) async {
          DBHelper dbHelper=serviceLocator();
          // if(await dbHelper.onbordingCheck()){
          //   // context.goNamed( Routes.mainPage);
          //   // Logger().w("sss");
          //   AppRouter.router.goNamed(Routes.mainPage);
          //
          //   // context.goNamed(Routes.mainPage);
          //   // return Routes.MainPagePath;
          // }else{
          //   // Logger().w("ddd");
          //   // context.goNamed( Routes.LoginPage);
          //   AppRouter.router.goNamed(Routes.onboardingScreen);
          //   // context.goNamed(Routes.onboardingScreen);
          //   // return Routes.onboardingScreenPath;
          // }
        },
      ),


      GoRoute(
        name: Routes.issuesDetailsPage,
        path: Routes.issuesDetailsPagePath,
        builder: (context, state) => IssueDetailsPage(
          issueModel: state.extra as IssueModel,
        ),
      ),

      ///Bottom nav bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          // first branch (A)
          StatefulShellBranch(
            initialLocation: Routes.mainPagePath,
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              // top route inside branch
              GoRoute(
                  name: Routes.mainPage,
                  path: Routes.mainPagePath,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: HomePage(),
                  ),
                routes: [
                  GoRoute(
                      name: Routes.repoIssuesPage,
                      path: Routes.repoIssuesPagePath,
                      pageBuilder: (context, state) =>  NoTransitionPage(
                        child: ReposIssue(repositoryModel: state.extra as RepositoryModel,),
                      ),

                  ),

                ]
              ),

            ],
          ),

          //------------------------------------live message section


          StatefulShellBranch(
            navigatorKey: _shellNavigatorIssuesKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.issuesPage,
                path: Routes.issuesPagePath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: IssuePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfilrKey,
            routes: [
              // top route inside branch
              GoRoute(
                name: Routes.profilePage,
                path: Routes.profilePagePath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProfilePage(),
                ),
              ),
            ],
          ),

        ],
      ),

      GoRoute(
        name: Routes.ErrorPage,
        path: Routes.ErrorPagePath,
        pageBuilder: (context, state) => NoTransitionPage(
          child: ErrorPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );

  static GoRouter get router => routerx;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
