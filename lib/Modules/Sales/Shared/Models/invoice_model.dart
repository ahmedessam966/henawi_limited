class InvoiceModel {
  final String client;
  final String invoiceDate;
  final num invoiceTotal;
  final Map items;
  final String invoiceType;
  final String paymentTerms;
  final String invoiceNumber;
  final String issuedBy;
  final String channel;

  InvoiceModel(
      {required this.client,
      required this.issuedBy,
      required this.invoiceDate,
      required this.invoiceTotal,
      required this.items,
      required this.invoiceType,
      required this.paymentTerms,
      required this.invoiceNumber,
      required this.channel});
}
