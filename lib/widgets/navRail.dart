import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../evrika_colors.dart';

class NavRail extends StatefulWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  @override
  Widget build(BuildContext context) {

    int _selectedIndex = 0;

    bool extended =false;

    return    NavigationRail(
      minWidth: 55.0,
      extended: extended,
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
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Image.asset('assets/img/evrika.png'),
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
    );
  }
}
