/// Base class for all use cases
/// [T] is the return type of the use case
/// [P] is the type of the parameter
///
/// For example, if the use case is to get a list of movies,
/// then [T] will be List<Movie> and [P] will be int (page number)
///
abstract class BaseUseCase<T, P> {

  /// Executes the use case
  ///
  /// [params] is the parameter to be passed to the use case
  /// Returns the result of the use case
  ///
  T execute(P params);
}
