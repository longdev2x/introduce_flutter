sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success({required this.data});
}

class Error<T> extends Result<T> {
  final Exception exception;
  const Error({required this.exception});
}


extension ResultWhen<T> on Result<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(Exception exception) error,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Error<T>) {
      return error((this as Error<T>).exception);
    }
    throw Exception('Unhandled case in Result.when');
  }
}
