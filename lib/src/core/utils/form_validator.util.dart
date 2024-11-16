String? requiredValidator(String name, String? value) {
  if (value == null || value.isEmpty) return '$name is required';

  return null;
}

String? cannotBeginWithDigitValidator(String name, String? value) {
  final isEmpty = requiredValidator(name, value);

  if (isEmpty != null) return isEmpty;

  final regex = RegExp(r'^\d');
  if (regex.hasMatch(value!)) return "$name cannot start with a digit";

  return null;
}

String? mustBeNumber(String name, String? value) {
  final isEmpty = requiredValidator(name, value);

  if (isEmpty != null) return isEmpty;

  final regex = RegExp(r'^\d+$');
  if (!regex.hasMatch(value!)) return "$name must be a valid number";

  return null;
}

String? numberGreaterThanZero(String name, String? value) {
  final isNumber = mustBeNumber(name, value);

  if (isNumber != null) return isNumber;

  final parsedValue = int.parse(value!);

  if (parsedValue <= 0) return "$name must be more than 0";

  return null;
}
