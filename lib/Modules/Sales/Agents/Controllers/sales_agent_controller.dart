// ignore_for_file: avoid_function_literals_in_foreach_calls, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:henawi_limited/Services/API/database_services.dart';
import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../Global/Controllers/exceptions_handler.dart';
import '../../Shared/Models/invoice_model.dart';
import '../../Shared/Models/po_model.dart';
import '../../Shared/Models/quotation_model.dart';
import '../../Shared/Models/user_quotations_model.dart';
import '../../Shared/Models/user_sales_model.dart';

class SalesAgentController with ChangeNotifier {
  final List _fetchedPOs = [];

  int _viewIndex = 0;
  int get viewIndex => _viewIndex;

  bool _isFetchingIndicator = false;
  bool get isFetchingIndicator => _isFetchingIndicator;

  num _totalSalesAmount = 0;
  num get totalSalesAmount => _totalSalesAmount;

  int _totalAvailablePOs = 0;
  int get totalAvailablePOs => _totalAvailablePOs;

  final List<PurchaseOrderModel> _poList = [];
  List<PurchaseOrderModel> get poList => _poList;

  final List<UserSalesModel> _userSalesList = [];
  List<UserSalesModel> get userSalesList => _userSalesList;

  final List<UserQuotationsModel> _userQuotationsList = [];
  List<UserQuotationsModel> get userQuotationsList => _userQuotationsList;

  final List _fetchedInvoiceNumbers = [];
  final List _fetchedQuotationNumbers = [];
  final List _fetchedClients = [];

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  void startFetchingIndicator() {
    _isFetchingIndicator = !_isFetchingIndicator;
    notifyListeners();
  }

  void resetTotalSalesAmount() {
    _totalSalesAmount = 0;
    notifyListeners();
  }

  void changeViewIndex(int index) {
    _viewIndex = index;
    notifyListeners();
  }

  void setPOCount(int value) {
    _totalAvailablePOs = value;
    notifyListeners();
  }

  // void fetchMoreInvoices(BuildContext context) {
  //   _loadedPage++;
  //   getAllInvoices(context);
  // }

  Future getUserSales(String name, BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb
          .collection('INVOICES')
          .getFullList(
              batch: 10,
              filter: 'Issued_By = "$name"',
              fields: 'Invoice_Number, Invoice_Date, Invoice_Total',
              sort: '-Invoice_Date')
          .then((value) {
        value.forEach((element) {
          if (_fetchedInvoiceNumbers.contains(element.data['Invoice_Number'])) {
          } else {
            _fetchedInvoiceNumbers.add(element.data['Invoice_Number']);
            DateTime dateTime = DateTime.parse(element.data['Invoice_Date']);
            DateFormat dateFormat = DateFormat("dd MMMM yyyy");
            String formattedDate = dateFormat.format(dateTime);

            DateFormat timeFormat = DateFormat("HH:mm");
            String formattedTime = timeFormat.format(dateTime);

            final sale = UserSalesModel(
                invoiceNumber: element.data['Invoice_Number'],
                invoiceDate: '$formattedDate at $formattedTime',
                invoiceTotal: (element.data['Invoice_Total'] * 0.15) + element.data['Invoice_Total']);
            _totalSalesAmount += element.data['Invoice_Total'];

            _userSalesList.add(sale);
            notifyListeners();
          }
        });
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
      if (kDebugMode) {
        print(e.statusCode);
      }
    }
  }

  Future<InvoiceModel?> fetchSingleInvoiceDetails(String invoiceNumber, BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    RecordModel? recordModel;
    String clientName = '';
    try {
      await pb.collection('INVOICES').getFirstListItem('Invoice_Number = "$invoiceNumber"').then((value) {
        recordModel = value;
      });
      await pb.collection('CLIENTS').getOne('${recordModel?.data['Client']}').then((value) {
        clientName = value.data['Client_Name'];
      });
      DateTime dateTime = DateTime.parse(recordModel?.data['Invoice_Date']);
      DateFormat dateFormat = DateFormat("dd MMMM yyyy");
      String formattedDate = dateFormat.format(dateTime);

      DateFormat timeFormat = DateFormat("HH:mm");
      String formattedTime = timeFormat.format(dateTime);

      return InvoiceModel(
          client: clientName,
          issuedBy: recordModel?.data['Issued_By'],
          invoiceDate: '$formattedDate at $formattedTime',
          invoiceTotal: recordModel?.data['Invoice_Total'],
          items: recordModel?.data['Invoice_Breakdown'],
          invoiceType: recordModel?.data['Invoice_Type'],
          paymentTerms: recordModel?.data['Payment_Terms'],
          invoiceNumber: invoiceNumber,
          channel: recordModel?.data['Channel']);
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
      return null;
    }
  }

  Future getPurchaseOrders(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.collection('PURCHASE_ORDERS').getFullList(batch: 20, sort: '+PO_Date').then((value) {
        value.forEach((element) async {
          String clientName = '';
          if (_fetchedPOs.contains(element.data['PO_Number'])) {
          } else {
            _fetchedPOs.add(element.data['PO_Number']);
            DateTime dateTime = DateTime.parse(element.data['PO_Date']);
            DateFormat dateFormat = DateFormat("dd MMMM yyyy");
            String formattedDate = dateFormat.format(dateTime);

            DateFormat timeFormat = DateFormat("HH:mm");
            String formattedTime = timeFormat.format(dateTime);

            await pb.collection('CLIENTS').getOne(element.data['Client']).then((value) {
              clientName = value.data['Client_Name'];
            });

            final po = PurchaseOrderModel(
              request: element.data['Request'],
              poNumber: element.data['PO_Number'],
              poDate: '$formattedDate at $formattedTime',
              poClient: clientName,
              poStatus: element.data['Status'],
            );
            _poList.add(po);
            notifyListeners();
          }
        });
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future<QuotationModel?> fetchSingleQuotationDetails(String quotationNumber, BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    RecordModel? recordModel;
    String clientName = '';
    try {
      await pb
          .collection('QUOTATIONS')
          .getFirstListItem('Quotation_Number = "$quotationNumber"')
          .then((value) {
        recordModel = value;
      });
      await pb.collection('CLIENTS').getOne('${recordModel?.data['Client']}').then((value) {
        clientName = value.data['Client_Name'];
      });
      DateTime dateTime = DateTime.parse(recordModel?.data['Quotation_Date']);
      DateFormat dateFormat = DateFormat("dd MMMM yyyy");
      String formattedDate = dateFormat.format(dateTime);

      DateFormat timeFormat = DateFormat("HH:mm");
      String formattedTime = timeFormat.format(dateTime);

      return QuotationModel(
          client: clientName,
          createdBy: recordModel?.data['Created_By'],
          quotationDate: '$formattedDate at $formattedTime',
          quotationTotal: recordModel?.data['Quotation_Total'],
          proposal: recordModel?.data['Proposal_Breakdown'],
          proposedType: recordModel?.data['Proposition_Type'],
          proposedTerms: recordModel?.data['Proposed_Terms'],
          quotationNumber: quotationNumber);
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
      return null;
    }
  }

  Future getUserQuotations(String name, BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb
          .collection('QUOTATIONS')
          .getFullList(
              filter: 'Created_By = "$name"',
              fields: 'Quotation_Number, Quotation_Date, Quotation_Total',
              sort: '-Quotation_Date')
          .then((value) {
        value.forEach((element) {
          if (_fetchedQuotationNumbers.contains(element.data['Quotation_Number'])) {
          } else {
            _fetchedQuotationNumbers.add(element.data['Quotation_Number']);
            DateTime dateTime = DateTime.parse(element.data['Quotation_Date']);
            DateFormat dateFormat = DateFormat("dd MMMM yyyy");
            String formattedDate = dateFormat.format(dateTime);

            DateFormat timeFormat = DateFormat("HH:mm");
            String formattedTime = timeFormat.format(dateTime);

            final quotation = UserQuotationsModel(
                quotationNumber: element.data['Quotation_Number'],
                quotationDate: '$formattedDate at $formattedTime',
                quotationTotal: (element.data['Quotation_Total'] * 0.15) + element.data['Quotation_Total']);

            _userQuotationsList.add(quotation);
            notifyListeners();
          }
        });
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
      if (kDebugMode) {
        print(e.statusCode);
      }
    }
  }
}
