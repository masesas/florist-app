import 'package:florist_app/src/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../features/account/account.dart';
import '../../features/home/home.dart';
import '../../features/order/order.dart';
import '../themes/themes.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _title = "";

  final _pageController = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _title = _navList()[_selectedIndex].label!;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(_title),
        backgroundColor: AppColors.colorPrimaryDark,
        actions: [
          _searchBar(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          OrderPage(),
          AccountPage(),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.colorBoxBorder),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed(OrderModule.ORDER_SEARCH);
        },
        child: Stack(
          children: const [
            Positioned(
              left: 10,
              top: 7,
              child: Text(
                'Cari',
                style: TextStyle(
                  color: AppColors.colorHintText,
                  fontSize: 12,
                ),
              ),
            ),
            Positioned(
                top: 5,
                right: 7,
                child: Icon(
                  Icons.search,
                  color: AppColors.colorHintText,
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 20,
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 13,
      selectedLabelStyle: const TextStyle(color: Colors.white),
      unselectedFontSize: 11,
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.buttonColorDark,
      onTap: _onItemTapped,
      items: _navList(),
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      _title = _navList()[index].label!;
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _navList() {
    return [
      _buildButtonNavigation(
        0,
        context.lang.home,
        Icons.home,
      ),
      _buildButtonNavigation(
        1,
        context.lang.order,
        Icons.shopping_cart,
      ),
      _buildButtonNavigation(
        2,
        context.lang.account,
        Icons.supervised_user_circle,
      ),
    ];
  }

  BottomNavigationBarItem _buildButtonNavigation(
    int index,
    String title,
    IconData icon,
  ) {
    return BottomNavigationBarItem(
      label: title,
      icon: Icon(
        icon,
        color:
            _selectedIndex == index ? AppColors.buttonColorDark : Colors.grey,
      ),
    );
  }
}
