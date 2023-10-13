class InvoiceItemModel {
  final String itemName;
  final double unitPrice;
  final int quantity;
  final String description;
  final String issuedBy;

  InvoiceItemModel(this.issuedBy,
      {required this.itemName, required this.unitPrice, required this.quantity, required this.description});
}
