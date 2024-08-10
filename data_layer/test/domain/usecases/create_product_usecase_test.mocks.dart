// Mocks generated by Mockito 5.4.4 from annotations
// in task6/test/domain/usecases/create_product_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:task6/core/error/failures.dart' as _i5;
import 'package:task6/features/product/domain/entities/product.dart' as _i6;
import 'package:task6/features/product/domain/repositories/product_repo.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepo extends _i1.Mock implements _i3.ProductRepo {
  MockProductRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Product>> add_product_repo(
          _i6.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #add_product_repo,
          [product],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>.value(
            _FakeEither_0<_i5.Failure, _i6.Product>(
          this,
          Invocation.method(
            #add_product_repo,
            [product],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>
      display_all_product_repo() => (super.noSuchMethod(
            Invocation.method(
              #display_all_product_repo,
              [],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Product>>(
              this,
              Invocation.method(
                #display_all_product_repo,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Product>> display_single_product_repo(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #display_single_product_repo,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>.value(
            _FakeEither_0<_i5.Failure, _i6.Product>(
          this,
          Invocation.method(
            #display_single_product_repo,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Product>> update_product_repo(
          _i6.Product? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #update_product_repo,
          [product],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>.value(
            _FakeEither_0<_i5.Failure, _i6.Product>(
          this,
          Invocation.method(
            #update_product_repo,
            [product],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>> delete_repo(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete_repo,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i5.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #delete_repo,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i2.Unit>>);
}
