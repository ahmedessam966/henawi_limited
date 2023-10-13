// ignore_for_file: public_member_api_docs, sort_constructors_first
class PurchaseOrderModel {
  final String poNumber;
  final String poDate;
  final String poClient;
  final String poStatus;
  final Map request;

  PurchaseOrderModel(
      {required this.poNumber,
      required this.poDate,
      required this.poClient,
      required this.poStatus,
      required this.request});
}
