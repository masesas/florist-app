part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _tapWidget = Container();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorGrey,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          BoxPrimary(
            margin: const EdgeInsets.symmetric(
              vertical: AppSize.spaceDefault,
              horizontal: AppSize.spaceDefault,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.lang.dataAnalysis,
                      style: AppStyles.fontBold16,
                    ),
                    const SizedBox(height: AppSize.spaceDefault),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTitleData(context.lang.orderIn, 1),
                        _buildTitleData(context.lang.delivered, 1),
                        _buildTitleData(context.lang.rejected, 1),
                        _buildTitleData(context.lang.missed, 1),
                      ],
                    ),
                    const SizedBox(height: AppSize.spaceDefault),
                    Row(
                      children: [
                        const SizedBox(width: AppSize.spaceDefault),
                        Expanded(
                            child:
                                _buildTiles(context.lang.orderIn, Colors.blue)),
                        _buildTiles(
                            context.lang.delivered, Colors.red.shade400),
                      ],
                    ),
                    const SizedBox(height: AppSize.spaceSmall),
                    Row(
                      children: [
                        const SizedBox(width: AppSize.spaceDefault),
                        Expanded(
                            child: _buildTiles(
                                context.lang.rejected, Colors.red.shade700)),
                        _buildTiles(
                            context.lang.missed, AppColors.colorPrimaryDark),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: AppSize.spaceDefault),
                              width: context.deviceWidth,
                              child: TimeSeriesChart(
                                _createRandomData(),
                                animate: false,
                                defaultRenderer: LineRendererConfig(
                                  includeArea: true,
                                  strokeWidthPx: 1,
                                  stacked: false,
                                  // includePoints: true,
                                ),
                                selectionModels: [
                                  SelectionModelConfig(
                                      changedListener: (model) {})
                                ],
                                behaviors: const [
                                  /*LinePointHighlighter(
                                    symbolRenderer: TextSymbolRenderer(
                                        () => Random().nextInt(100).toString()),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTapUp: (details) {
                              setState(() {
                                _tapWidget = Container();
                              });
                            },
                            onTapDown: (details) {
                              setState(() {
                                _tapWidget = Positioned(
                                  top: details.localPosition.dy - 40 * .5,
                                  left: details.localPosition.dx - 40 * .5,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: const Text('Text'),
                                  ),
                                );
                              });
                            },
                          ),
                          _tapWidget,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleData(String title, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppStyles.fontSemiBold14,
        ),
        const SizedBox(height: 5),
        Text(
          '$count',
          style: AppStyles.fontBold16,
        ),
      ],
    );
  }

  Widget _buildTiles(String title, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          color: color,
        ),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 5),
            child: Text(title)),
      ],
    );
  }

  List<Series<LinearSales, DateTime>> _createRandomData() {
    final random = Random();

    final myFakeDesktopData = [
      LinearSales(DateTime.now().subtract(const Duration(days: 1)), 0),
      LinearSales(DateTime.now().subtract(const Duration(days: 2)), 1),
      LinearSales(DateTime.now().subtract(const Duration(days: 3)), 1),
      LinearSales(DateTime.now().subtract(const Duration(days: 4)), 2),
    ];

    var myFakeTabletData = [
      LinearSales(DateTime.now().subtract(const Duration(days: 1)), 1),
      LinearSales(DateTime.now().subtract(const Duration(days: 2)), 0),
      LinearSales(DateTime.now().subtract(const Duration(days: 3)), 2),
      LinearSales(DateTime.now().subtract(const Duration(days: 4)), 1),
    ];

    return [
      Series<LinearSales, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (sales, _) => sales.dateTime,
        measureFn: (sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      Series<LinearSales, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        domainFn: (sales, _) => sales.dateTime,
        measureFn: (sales, _) => sales.sales,
        data: myFakeTabletData,
        displayName: 'test',
      ),
    ];
  }

/*Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return text;
  }

  LineChartData mainData() {
    return LineChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: AppColors.colorPrimary),
      ),
      minX: 1,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(2, 1),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
          ],
          isCurved: true,
          color: AppColors.buttonColor,
          barWidth: 1.2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.green.shade100,
          ),
        ),
      ],
    );
  }*/
}

/// Sample linear data type.
class LinearSales {
  final DateTime dateTime;
  final int sales;

  LinearSales(this.dateTime, this.sales);
}

typedef GetText = String Function();

class TextSymbolRenderer extends CircleSymbolRenderer {
  TextSymbolRenderer(
    this.getText, {
    this.marginBottom = 8,
    this.padding = const EdgeInsets.all(8),
  });

  final GetText getText;
  final double marginBottom;
  final EdgeInsets padding;

  @override
  void paint(
    ChartCanvas canvas,
    Rectangle<num> bounds, {
    List<int>? dashPattern,
    chartColor.Color? fillColor,
    FillPatternType? fillPattern,
    chartColor.Color? strokeColor,
    double? strokeWidthPx,
  }) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        fillPattern: fillPattern,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);

    chartStyle.TextStyle textStyle = chartStyle.TextStyle();
    textStyle.color = chartColor.Color.black;
    textStyle.fontSize = 15;

    chartElement.TextElement textElement =
        chartElement.TextElement(getText.call(), style: textStyle);
    double width = textElement.measurement.horizontalSliceWidth;
    double height = textElement.measurement.verticalSliceWidth;

    double centerX = bounds.left + bounds.width / 2;
    double centerY = bounds.top +
        bounds.height / 2 -
        marginBottom -
        (padding.top + padding.bottom);

    canvas.drawRRect(
      Rectangle(
        centerX - (width / 2) - padding.left,
        centerY - (height / 2) - padding.top,
        width + (padding.left + padding.right),
        height + (padding.top + padding.bottom),
      ),
      fill: chartColor.Color.white,
      radius: 16,
      roundTopLeft: true,
      roundTopRight: true,
      roundBottomRight: true,
      roundBottomLeft: true,
    );
    canvas.drawText(
      textElement,
      (centerX - (width / 2)).round(),
      (centerY - (height / 2)).round(),
    );
  }
}
