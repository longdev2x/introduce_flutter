abstract class BaseUsecase<Type, Params> {
  Future<Type> execute(Params params);
}