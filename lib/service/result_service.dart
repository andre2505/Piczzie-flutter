class ResultService{
  ResultService._();

  factory ResultService.success(success) = SuccessState;

  factory ResultService.error(String foo) = ErrorState;

  factory ResultService.errorNetwork(String foo) = ErrorNetwork;
}

class SuccessState<T> extends ResultService {
  SuccessState(this.value) : super._();

  final T value;
}

class ErrorState extends ResultService {
  ErrorState(this.msg) : super._();

  final String msg;
}

class ErrorNetwork extends ResultService {
  ErrorNetwork(this.msg) : super._();

  final String msg;
}
