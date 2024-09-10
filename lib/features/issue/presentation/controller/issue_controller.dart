
import 'package:get/get.dart';
import '../../domain/usecase/issue_use_case.dart';


class IssueController extends GetxController implements GetxService{
  IssueUseCase? issueUseCase;
  IssueController({ issueUseCase });


}

