part of 'base_usecase.dart';

abstract class UseCaseWithoutParam<Result> {
  /// used in presenter (cubit or bloc)
  Future<Either<AppFailure, Result>> invoke() async {
    try {
      return await execute();
    } on CustomException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return Left(AppFailure(msg: e.toString()));
    }
  }

  /// used in useCase
  Future<Either<AppFailure, Result>> execute();
}
