enum DeliveryStatus {
  orderOnTheWay('order on the way'),
  orderDelivered('order delivered');

  final String value;
  const DeliveryStatus(this.value);

  String toJson() => value;

  static DeliveryStatus fromString(String value) {
    return DeliveryStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw ArgumentError('Invalid DeliveryStatus value: \$value'),
    );
  }
}
