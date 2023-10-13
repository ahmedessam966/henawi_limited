class ClientModel {
  final String clientName;
  final num amountDue;
  final num totalAmount;
  final List quotations;
  final List invoices;
  final String clientEmail;

  ClientModel(
      {required this.clientName,
      required this.amountDue,
      required this.totalAmount,
      required this.quotations,
      required this.invoices,
      required this.clientEmail});
}
