part of 'base_usecase.dart';

abstract class UseCase<Parameter, Result> {
  /// used in presenter (cubit or bloc)
  Future<Either<AppFailure, Result>> invoke(Parameter param) async {
    try {
      return await execute(param);
    } on CustomException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return Left(AppFailure(msg: e.toString()));
    }
  }

  /// used in useCase
  Future<Either<AppFailure, Result>> execute(Parameter param);
}
