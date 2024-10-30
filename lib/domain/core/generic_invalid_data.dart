class GenericInvalidData<T> {
  GenericInvalidData(
    this.code,
    this.message,
    this.details,
  );

  final String? code;
  final String? message;
  final T? details;

  factory GenericInvalidData.empty() => GenericInvalidData('', '', null);
}
