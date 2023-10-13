class QuotationModel {
  final String client;
  final String quotationDate;
  final num quotationTotal;
  final Map proposal;
  final String proposedType;
  final String proposedTerms;
  final String quotationNumber;
  final String createdBy;

  QuotationModel(
      {required this.client,
      required this.quotationDate,
      required this.quotationTotal,
      required this.proposal,
      required this.proposedType,
      required this.proposedTerms,
      required this.quotationNumber,
      required this.createdBy});
}
