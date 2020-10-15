/// Container for the entirety of the app's state. An instance of
/// this class should be able to inform what is rendered at any
/// point in time.
class AppState {
  /// Full click history. For super important auditing purposes.
  /// The count of clicks becomes this list's `length` attribute.
  final List<DateTime> clicks;

  /// Default generative constructor. Const-friendly, for optimal
  /// performance.
  const AppState([List<DateTime> clicks])
      : clicks = clicks ?? const <DateTime>[];

  /// Convenience helper.
  int get count => clicks.length;

  /// Copy method that returns a new instance of AppState instead
  /// of mutating the existing copy.
  AppState copyWith(DateTime latestClick) => AppState([
        latestClick,
        ...clicks,
      ]);
}
