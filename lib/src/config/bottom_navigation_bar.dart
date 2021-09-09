import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  const BottomNavBar(this.currentIndex, this.onTabTapped);
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTabTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).colorScheme.secondaryVariant,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            tooltip: '',
            activeIcon: Icon(Iconsax.home, size: 24),
            icon: Icon(Iconsax.home, size: 24),
          ),
          BottomNavigationBarItem(
            label: 'News',
            tooltip: '',
            activeIcon: Icon(Iconsax.book, size: 24),
            icon: Icon(Iconsax.book, size: 24),
          ),
          BottomNavigationBarItem(
            label: 'Info',
            tooltip: '',
            activeIcon: Icon(Iconsax.info_circle, size: 24),
            icon: Icon(Iconsax.info_circle, size: 24),
          ),
        ],
      ),
    );
  }
}
