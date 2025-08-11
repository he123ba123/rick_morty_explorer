import 'failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "Server error occurred";
    case CacheFailure:
      return "No cached data available";
    default:
      return "Unexpected error";
  }
}
