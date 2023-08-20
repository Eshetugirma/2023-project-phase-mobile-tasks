part of 'validator.dart';

/// Validator for date
///
/// Checks if the date is empty, in the past, or in invalid format
class DateValidator extends Validator {
  @override
  Either<ValidationFailure, void> validate(String value) {
    if (value.isEmpty) {
      return Left(ValidationFailure.emptyDate());
    }

    final date = DateTime.tryParse(value);

    if (date == null) {
      return Left(ValidationFailure.invalidDateFormat());
    }

    if (date.isBefore(DateTime.now())) {
      return Left(ValidationFailure.invalidDate());
    }

    return const Right(null);
  }
}
