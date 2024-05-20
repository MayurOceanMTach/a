import 'package:a/app_error/app_error.dart';
import 'package:a/common_api_call/common_api_call.dart';
import 'package:a/core/api_client.dart';
import 'package:a/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class DataSource {
  Future<Either<AppError, TermsConditionModelEntity>> getTermsAndCondition();
}

class DataSourceImpl extends DataSource {
  final ApiClient client;
  DataSourceImpl({required this.client});
  @override
  Future<Either<AppError, TermsConditionModelEntity>> getTermsAndCondition() async {
    final result = await commonApiCall<TermsConditionDataModel>(
      apiPath: 'page/terms-condition',
      apiCallType: APICallType.GET,
      client: client,
      //header: ApiConstatnts().headers,
      screenName: 'my_call_screen',
      fromJson: (json) {
        final termsConditionDataModel = TermsConditionDataModel.fromJson(json);
        return termsConditionDataModel;
      },
    );

    return result.fold(
      (appError) => Left(appError),
      (list) {
        //    if (list.data == null) {
        //     return const Left(AppError(errorType: AppErrorType.data, errorMessage: "Data Not Founds, try again!"));
        //    }
        return Right(list.data);
      },
    );
  }
}
