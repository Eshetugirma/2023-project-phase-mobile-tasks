import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

part 'date_validator.dart';
part 'description_validator.dart';
part 'title_validator.dart';

/// Base class for all validators
abstract class Validator {
  Either<ValidationFailure, void> validate(String value);
}

/// Failure class for validation exceptions
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});

  factory ValidationFailure.emptyTitle() =>
      const ValidationFailure(message: 'Please enter title');

  factory ValidationFailure.emptyDate() =>
      const ValidationFailure(message: 'Please enter date');

  factory ValidationFailure.emptyDescription() =>
      const ValidationFailure(message: 'Please enter description');

  factory ValidationFailure.invalidDateFormat() =>
      const ValidationFailure(message: 'Invalid date format');

  factory ValidationFailure.invalidDate() =>
      const ValidationFailure(message: 'Invalid date');

  @override
  List<Object?> get props => [message];
}
