part of 'pages.dart';

class OrderPage extends StatefulWidget {
  final int selectedTab;

  const OrderPage({
    Key? key,
    this.selectedTab = 0,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedTab = 0;

  List<GlobalKey> _statusKeys = [];
  late List<String> _statusList;
  final List<OrderEnum> _statusRequest = [
    OrderEnum.NEW_ORDER,
    OrderEnum.ACCEPTED,
    OrderEnum.PREPARE_DELIVERY,
    OrderEnum.DELIVERED,
  ];

  @override
  void initState() {
    super.initState();
    _initTabControl();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _initTabControl() {
    int numberOfTabs = _statusRequest.length;
    //List<int> orderLength = List.generate(numberOfTabs, (index) => 0);
    _statusKeys = List.generate(numberOfTabs, (index) => GlobalKey()).toList();
    //Controller changing tab to reset data
    _tabController = TabController(
        length: numberOfTabs, vsync: this, initialIndex: widget.selectedTab);
    _tabController.animation!.addListener(
      () async {
        if (_selectedTab != _tabController.index) {
          /*  String status = _statusRequest[_tabController.index];
          int orderLengthInTab = orderLength[_tabController.index];*/
        }
        _selectedTab = _tabController.index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _statusList = [
      context.lang.newOrder,
      context.lang.accepted,
      context.lang.prepareDelivery,
      context.lang.delivered,
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColorGrey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Column(
              children: [
                _buildTabBarStatus(),
                _buildTabPageItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBarStatus() {
    return StatefulBuilder(builder: (context, setState) {
      return IntrinsicHeight(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: AppColors.colorPrimaryDark,
              child: TabBar(
                controller: _tabController,
                tabs: List.generate(
                  _statusList.length,
                  (index) => _buildTab(
                    _statusList[index],
                    key: _statusKeys[index],
                    index: index,
                  ),
                ),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                indicatorPadding: EdgeInsets.zero,
                indicator: const BoxDecoration(),
                indicatorWeight: 0.01,
                labelPadding: EdgeInsets.zero,
                onTap: (index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.16),
            )
          ],
        ),
      );
    });
  }

  Widget _buildTabPageItem() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(_statusRequest.length, (index) {
          return _buildPageItem(
            status: index,
            indexTab: index,
            orderFlag: _statusRequest[index],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTab(
    String tabName, {
    GlobalKey? key,
    required int index,
  }) {
    bool isSelected = _tabController.index == index;

    return IntrinsicWidth(
      key: key,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.5, horizontal: 10),
            child: badges.Badge(
              badgeContent: const Text(
                '1',
                style: TextStyle(color: AppColors.white),
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                child: Text(
                  tabName,
                  style: AppStyles.fontSemiBold16.copyWith(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w900 : FontWeight.w200,
                    color: isSelected
                        ? AppColors.white
                        : AppColors.colorUnHighlightText,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 5,
            width: double.infinity,
            color: isSelected ? AppColors.white : Colors.transparent,
          )
        ],
      ),
    );
  }

  Widget _buildPageItem({
    required int status,
    required int indexTab,
    required OrderEnum orderFlag,
  }) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        var metrics = scrollInfo.metrics;
        if (metrics.pixels == metrics.maxScrollExtent) {}
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return ItemOrder(
                  orderFlag: orderFlag,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
