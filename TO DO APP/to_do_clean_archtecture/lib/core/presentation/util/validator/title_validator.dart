part of 'validator.dart';

/// Validator for description
///
/// Checks if the title is empty
class TitleValidator extends Validator {
  @override
  Either<ValidationFailure, void> validate(String value) {
    if (value.isEmpty) {
      return Left(ValidationFailure.emptyTitle());
    }

    return const Right(null);
  }
}
