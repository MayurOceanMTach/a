import 'package:a/app_error/app_error.dart';
import 'package:a/model/model.dart';
import 'package:a/repositories/data_repositories.dart';
import 'package:dartz/dartz.dart';

class FatchProductData {
  final DataRepositories dataRepositories;
  FatchProductData({required this.dataRepositories});

  Future<Either<AppError, TermsConditionModelEntity>> call() async {
    return await dataRepositories.getTermsCondition();
  }
}

