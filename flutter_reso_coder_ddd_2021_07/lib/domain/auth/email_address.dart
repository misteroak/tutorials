class EmailAddress {
  // !Note: Use Equatable instead of == and hashCode overrides
  final String value;

  const EmailAddress(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmailAddress && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'EmailAddress(value: $value)';
}
