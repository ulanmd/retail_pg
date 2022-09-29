import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:retail_pg/pages/calendar_page.dart';
import 'package:retail_pg/pages/customerPage.dart';
import 'package:retail_pg/pages/desktop_page.dart';
import 'package:retail_pg/widgets/order_pg_widget.dart';
import 'package:retail_pg/widgets/widget_provider.dart';

import '../evrika_colors.dart';
import '../pages/retailPage.dart';
import '../store/orderStore.dart';

class LargeLayout extends StatefulWidget {
  const LargeLayout({Key? key}) : super(key: key);


  @override
  _LargeLayoutState createState() => _LargeLayoutState();
}

class _LargeLayoutState extends State<LargeLayout> {



  final List<Widget> _mainContents = [
    // Content for Home tab
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 1, child: RetailPage()),
        VerticalDivider(
          width: 5,
          indent: 45,
          thickness: 2,
          endIndent: 45,
        ),
        Expanded(
          flex: 1,
          child: WidgetProvider(),
        ),
      ],
    ),
    // Content for Feed tab
  CalendarPage(),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Наработки',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Профиль',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  // The index of the selected tab
  // In the beginning, the Home tab is selected
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    Order order = Provider.of<Order>(context, listen: false);

    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Show the navigaiton rail if screen width >= 640
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              minWidth: 55.0,
              selectedIndex: _selectedIndex,
              // Called when one tab is selected
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Colors.amber,
              ),
              leading: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Image.asset('assets/img/evrika.png', width: 100,),
              ),
              trailing: const Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text('Logout'),
                    )),
              ),
              // navigation rail items
              destinations: [
                NavigationRailDestination(
                    icon: SvgPicture.asset(
                      'assets/img/home.svg',
                      color: EvrikaColors.darkColor,
                    ),
                    label: Text('Домой')),
                NavigationRailDestination(
                    icon: SvgPicture.asset(
                      'assets/img/proposal.svg',
                      color: EvrikaColors.darkColor,
                    ),
                    label: Text('Заявки')),
                NavigationRailDestination(
                    icon: SvgPicture.asset(
                      'assets/img/tenge.svg',
                      color: EvrikaColors.darkColor,
                    ),
                    label: Text('Наработки')),
                NavigationRailDestination(
                    icon: SvgPicture.asset(
                      'assets/img/profile.svg',
                      color: EvrikaColors.darkColor,
                    ),
                    label: Text('Профиль')),
              ],
            ),

          // Main content
          // This part is always shown
          // You will see it on both small and wide screen
          Expanded(child: _mainContents[_selectedIndex]),
        ],
      ),
    );
  }
}
