import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:retail_pg/pages/col_Page.dart';
import 'package:retail_pg/pages/desktop_page.dart';
import 'package:retail_pg/widgets/order_pg_widget.dart';

import '../store/orderStore.dart';

class WidgetProvider extends StatelessWidget {
  const WidgetProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Order order = Provider.of<Order>(context, listen: false);
    return Observer(
        builder: (context) =>
            order.isOpen ? const OrderPgWidget() : const ColPage());
  }
}
