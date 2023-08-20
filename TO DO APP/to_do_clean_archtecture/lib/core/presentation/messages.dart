import '../errors/failures.dart';
import 'util/input_converter.dart';
import 'util/validator/validator.dart';

const String cacheMissFailureMessage = 'Unable to find task';
const String cacheLoadFailureMessage = 'Unable to load task';
const String connectionFailureMessage = 'Unable to connect to server';
const String serverFailureMessage = 'Server responded with error';
const String operationFailureMessage = 'Unable to perform operation';
const String invalidDateFailureMessage = 'Date is in the past';
const String invalidDateFormatFailureMessage =
    'Date format is not correct. Please use YYYY-MM-DD';
const String emptyDateMessage = 'Please enter date';
const String emptyTitleMessage = 'Please enter title';
const String emptyDescriptionMessage = 'Please enter description';

/// Convert failure to user friendly message
String mapFailureToMessage(Failure failure) {
  if (failure == CacheFailure.cacheNotFound()) {
    return cacheMissFailureMessage;
  } else if (failure == CacheFailure.readError()) {
    return operationFailureMessage;
  } else if (failure == ServerFailure.connectionFailed()) {
    return connectionFailureMessage;
  } else if (failure == ServerFailure.invalidResponse()) {
    return serverFailureMessage;
  } else if (failure == ServerFailure.operationFailed()) {
    return operationFailureMessage;
  } else if (failure == InvalidInputFailure.invalidDateFormat()) {
    return invalidDateFormatFailureMessage;
  } else if (failure == InvalidInputFailure.invalidDate()) {
    return invalidDateFailureMessage;
  } else if (failure == ValidationFailure.invalidDateFormat()) {
    return invalidDateFormatFailureMessage;
  } else if (failure == ValidationFailure.invalidDate()) {
    return invalidDateFailureMessage;
  } else if (failure == ValidationFailure.emptyDate()) {
    return emptyDateMessage;
  } else if (failure == ValidationFailure.emptyDescription()) {
    return emptyDescriptionMessage;
  } else if (failure == ValidationFailure.emptyTitle()) {
    return emptyTitleMessage;
  }

  return 'Unexpected error';
}
