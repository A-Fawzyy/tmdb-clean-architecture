/// State of a request
///
/// either [init], [loading], [success] or [error]
enum RequestState {
  /// Initial state
  initial,

  /// loading state; used to show loading
  loading,

  /// successfully loaded state; hides loading and shows data
  success,

  /// error state; shows error widget
  error,
}
