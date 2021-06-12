class OrderModel {
  int id;
  String status;
  String costumerName;
  String phone;
  String number;
  double total;
  int itemCount;
  String address;
  String date;
  String currency;
  String paymentStatus;

  OrderModel({
    this.id,
    this.status,
    this.costumerName,
    this.phone,
    this.number,
    this.total,
    this.address,
    this.currency,
    this.date,
    this.itemCount,
    this.paymentStatus,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    String value = json["total"].toString();

    return OrderModel(
      id: json["id"] ?? 0,
      costumerName: json["customer_name"] ?? "",
      number: json["number"] ?? "",
      status: json["status"] ?? "",
      phone: json["customer_phone"] ?? "",
      total: double.tryParse(value) ?? 0.0,
      //total: json["total"],
      itemCount: json["item_count"] ?? 0,
      address: json["address"] ?? "",
      date: json["date"] ?? "",
    );
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) =>
      OrderModel.fromJson(map);

  static List<OrderModel> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((order) => OrderModel.fromJson(order)).toList();
}
