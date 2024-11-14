abstract class Usecase<Type, Params> {
  const Usecase();
  Type call({required Params params});
}
