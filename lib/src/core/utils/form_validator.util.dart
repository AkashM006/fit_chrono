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
