import 'dart:developer';

import 'package:a/app_error/app_error.dart';
import 'package:a/main.dart';
import 'package:a/model/model.dart';
import 'package:a/usecase/fatch_terms_condition.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fatchTermCondition() async {
    Either<AppError, TermsConditionModelEntity> response = await locator<FatchProductData>().call();
    log("----->  ${response}");
  }
}
