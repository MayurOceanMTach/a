// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:a/app_error/app_error.dart';
import 'package:a/datasource/data_source.dart';
import 'package:a/model/model.dart';

abstract class DataRepositories {
  Future<Either<AppError, TermsConditionModelEntity>> getTermsCondition();
}

class DataRepositoriesImpl extends DataRepositories {
  final DataSource dataSource;
  DataRepositoriesImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppError, TermsConditionModelEntity>> getTermsCondition() async {
    return await dataSource.getTermsAndCondition();
  }
}
