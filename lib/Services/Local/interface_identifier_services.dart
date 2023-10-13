import 'package:flutter/material.dart';
import 'package:henawi_limited/Modules/Sales/Agents/Screens/sales_agent_screen.dart';
import 'package:henawi_limited/Modules/Sales/Managers/Screens/sales_manager_screen.dart';
import 'package:henawi_limited/Services/Local/user_model.dart';

import 'routing_transition_services.dart';

class InterfaceIdentifierServices with ChangeNotifier {
  String _acquiredPosition = '';
  String get acquiredPosition => _acquiredPosition;

  Future handleInterfacePerPosition(BuildContext context, UserModel? loggedInUser) async {
    final String prefixMatch = loggedInUser!.position;
    switch (prefixMatch) {
      case 'Sales Agent':
        _acquiredPosition = 'Sales Agent';
        notifyListeners();
        Navigator.pushReplacement(
          context,
          RoutingTransitionServices.Transition(
            const SalesAgentScreen(
              initialViewIndex: 0,
            ),
          ),
        );
        break;
      case 'Sales Manager':
        _acquiredPosition = 'Sales Manager';
        notifyListeners();
        Navigator.pushReplacement(
          context,
          RoutingTransitionServices.Transition(
            const SalesManagerScreen(
              initialViewIndex: 0,
            ),
          ),
        );
        break;
      case 'CEO':
        _acquiredPosition = 'CEO';
        Navigator.pushReplacement(
          context,
          RoutingTransitionServices.Transition(
            const SalesManagerScreen(
              initialViewIndex: 0,
            ),
          ),
        );
        break;
    }
  }
}
