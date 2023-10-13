// ignore_for_file: avoid_function_literals_in_foreach_calls, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Shared/Models/client_model.dart';
import 'package:intl/intl.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../Global/Controllers/exceptions_handler.dart';
import '../../../../Services/API/database_services.dart';
import '../../Shared/Models/invoice_model.dart';
import '../../Shared/Models/revenue_item_model.dart';

class SalesManagerController with ChangeNotifier {
  int _loadedPage = 1;

  String _lastInvoiceNumber = '';
  String get lastInvoiceNumber => _lastInvoiceNumber;

  String _lastDraftInvoiceNumber = '';
  String get lastDraftInvoiceNumber => _lastDraftInvoiceNumber;

  String _lastFetched = '';
  String get lastFetched => _lastFetched;

  int _viewIndex = 0;
  int get viewIndex => _viewIndex;

  bool _isFetchingIndicator = false;
  bool get isFetchingIndicator => _isFetchingIndicator;

  final List _fetchedGross = [];
  final List _fetchedSerials = [];
  final List _fetchedTopAchievers = [];
  final List _fetchedInvoices = [];
  final List _fetchedClients = [];

  final List<InvoiceModel> _createdInvoice = [];
  List<InvoiceModel> get createdInvoice => _createdInvoice;

  final Map _demandedList = {};
  Map get demandedList => _demandedList;

  final Map _topAchievers = {};
  Map get topAchievers => _topAchievers;

  num _totalGrossSales = 0;
  num get totalGrossSales => _totalGrossSales;

  final List<InvoiceModel> _allInvoicesList = [];
  List<InvoiceModel> get allInvoicesList => _allInvoicesList;

  int _totalAvailablePOs = 0;
  int get totalAvailablePOs => _totalAvailablePOs;

  int _totalAvailableQuotations = 0;
  int get totalAvailableQuotations => _totalAvailableQuotations;

  final List<OnlineRevenueItemModel> _onlineRevenueList = [];
  List<OnlineRevenueItemModel> get onlineRevenueList => _onlineRevenueList;

  final List<ClientModel> _clientsList = [];
  List<ClientModel> get clientsModel => _clientsList;

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  void startFetchingIndicator() {
    _isFetchingIndicator = !_isFetchingIndicator;
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

  void fetchMoreInvoices(BuildContext context) {
    _loadedPage++;
    getAllInvoices(context);
  }

  Future getLastInvoiceNumber(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    await pb
        .collection('INVOICES')
        .getList(fields: 'Invoice_Date, Invoice_Number', sort: '-Invoice_Date')
        .then((value) {
      DateFormat dateFormat = DateFormat("dd MMMM yyyy");
      String formattedDate = dateFormat.format(DateTime.now());

      DateFormat timeFormat = DateFormat("HH:mm");
      String formattedTime = timeFormat.format(DateTime.now());
      _lastInvoiceNumber = value.items.first.data['Invoice_Date'];
      _lastFetched = '$formattedDate - $formattedTime';
      notifyListeners();
    });
  }

  Future getTotalGrossPerMonth(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    String currentDate = DateTime.now().toUtc().toString();
    String previousDate = DateTime.now().subtract(const Duration(days: 30)).toUtc().toString();
    try {
      await pb
          .collection('INVOICES')
          .getFullList(
              filter: 'Invoice_Date <= "$currentDate" && Invoice_Date >= "$previousDate"',
              fields: 'Invoice_Date, Invoice_Number, Invoice_Total')
          .then((value) {
        for (var element in value) {
          if (_fetchedGross.contains(element.data['Invoice_Number'])) {
          } else {
            _fetchedGross.add(element.data['Invoice_Number']);
            _totalGrossSales += element.data['Invoice_Total'];
            notifyListeners();
          }
        }
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future getTotalPO(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.collection('PURCHASE_ORDERS').getFullList().then((value) {
        _totalAvailablePOs = value.length;
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future getTotalQuotations(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb.collection('QUOTATIONS').getFullList().then((value) {
        _totalAvailableQuotations = value.length;
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future getAllThree(BuildContext context) async {
    try {
      await getTotalGrossPerMonth(context);
      await getTotalPO(context);
      await getTotalQuotations(context);
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future getDemandedAndSold(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb
          .collection('INVENTORY')
          .getList(perPage: 3, sort: '-Sold', fields: 'Requested, Sold, Product_Serial_Number')
          .then((value) {
        for (var element in value.items) {
          if (_fetchedSerials.contains(element.data['Product_Serial_Number'])) {
          } else {
            _fetchedSerials.add(element.data['Product_Serial_Number']);
            _demandedList.addAll({
              element.data['Product_Serial_Number']: {
                'Sold': element.data['Sold'],
                'Requested': element.data['Requested']
              }
            });
            notifyListeners();
          }
        }
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future<void> getTopAchievers(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    String currentDate = DateTime.now().toUtc().toString();
    String previousDate = DateTime.now().subtract(const Duration(days: 30)).toUtc().toString();

    try {
      await pb
          .collection('INVOICES')
          .getList(
            perPage: 3,
            sort: '-Invoice_Total',
            fields: 'Invoice_Total, Invoice_Number, Issued_By',
            filter: 'Invoice_Date <= "$currentDate" && Invoice_Date >= "$previousDate"',
          )
          .then((value) {
        value.items.forEach((element) async {
          if (_fetchedTopAchievers.contains(element.data['Invoice_Number'])) {
            // Invoice already processed, do nothing
          } else {
            _fetchedTopAchievers.add(element.data['Invoice_Number']);
            if (_topAchievers.containsKey(element.data['Issued_By'])) {
              final num oldValue = await _topAchievers[element.data['Issued_By']];
              final num newValue = oldValue + element.data['Invoice_Total'];
              _topAchievers.update(element.data['Issued_By'], (e) => newValue);
              notifyListeners();
            } else {
              _topAchievers.addAll({element.data['Issued_By']: element.data['Invoice_Total']});
            }
          }
        });
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future getQuarterAnnualRevenue(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);

    int currentDate = DateTime.now().month;
    int lastDate = DateTime.now().subtract(const Duration(days: 150)).month;

    await pb
        .collection('SALES')
        .getList(
          filter: 'Month <= "$currentDate" && Month >= "$lastDate"',
          fields: 'Month_Total, Month',
        )
        .then((value) {
      for (var element in value.items) {
        _onlineRevenueList.add(
          OnlineRevenueItemModel(
              month: element.data['Month'].toString(), saleValue: element.data['Month_Total']),
        );
      }
    });
  }

  Future getAllInvoices(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    try {
      await pb
          .collection('INVOICES')
          .getList(page: _loadedPage, perPage: 3, sort: '-Invoice_Date')
          .then((value) {
        value.items.forEach((element) async {
          if (_fetchedInvoices.contains(element.data['Invoice_Number'])) {
          } else {
            _fetchedInvoices.add(element.data['Invoice_Number']);
            DateTime dateTime = DateTime.parse(element.data['Invoice_Date']);
            DateFormat dateFormat = DateFormat("dd MMMM yyyy");
            String formattedDate = dateFormat.format(dateTime);

            DateFormat timeFormat = DateFormat("HH:mm");
            String formattedTime = timeFormat.format(dateTime);

            String client = await pb
                .collection('CLIENTS')
                .getOne(element.data['Client'], fields: 'Client_Name')
                .then((value) => value.data['Client_Name']);

            _allInvoicesList.add(
              InvoiceModel(
                  client: client,
                  issuedBy: element.data['Issued_By'],
                  invoiceDate: '$formattedDate at $formattedTime',
                  invoiceTotal: element.data['Invoice_Total'],
                  items: element.data['Invoice_Breakdown'],
                  invoiceType: element.data['Invoice_Type'],
                  paymentTerms: element.data['Payment_Terms'],
                  invoiceNumber: element.data['Invoice_Number'],
                  channel: element.data['Channel']),
            );
            notifyListeners();
          }
        });
      });
    } on ClientException catch (e) {
      DatabaseExceptionsControllers.handleDatabaseExceptions(context, e.statusCode);
    }
  }

  Future getClients(BuildContext context) async {
    final pb = PocketBase(DatabaseServices.regularConstant);
    await pb.collection('CLIENTS').getFullList().then((value) {
      value.forEach((element) {
        if (_fetchedClients.contains(element.id)) {
        } else {
          _fetchedClients.add(element.id);
          _clientsList.add(ClientModel(
              clientName: element.data['Client_Name'],
              amountDue: element.data['Client_Amount_Due'],
              totalAmount: element.data['Client_Total_Amount'],
              quotations: element.data['Quotations'],
              invoices: element.data['Invoices'],
              clientEmail: element.data['Official_Email']));
          notifyListeners();
        }
      });
    });
  }
}
