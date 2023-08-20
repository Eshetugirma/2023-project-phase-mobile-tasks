part of 'validator.dart';

/// Validator for description
///
/// Checks if the description is empty
class DescriptionValidator extends Validator {
  @override
  Either<ValidationFailure, void> validate(String value) {
    if (value.isEmpty) {
      return Left(ValidationFailure.emptyDescription());
    }

    return const Right(null);
  }
}
