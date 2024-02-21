import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_solutions_challenge/config/configurations/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _Data {
  _Data(this.x, this.y);
 
  final String x;
  final double y;
}
class _HomeState extends State<Home> {
  late List<_Data> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    // TODO: implement initState
    data = [
      _Data('HYDRO', 12),
      _Data('SOLAR', 15),
      _Data('GEO', 30),
      _Data('WIND', 6.4),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.blue,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            height: 200,
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hydro Energy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Text("264/1857", style: TextStyle(fontSize: 16),),
                                Text("sites build"),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.brown,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            height: 200,
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Geo Energy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Text("752/2139", style: TextStyle(fontSize: 16),),
                                Text("sites build"),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.orange,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            height: 200,
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Solar Energy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Text("504/1982", style: TextStyle(fontSize: 16),),
                                Text("sites build"),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.green,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10
                            ),
                            height: 200,
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Wind Energy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Text("216/1684", style: TextStyle(fontSize: 16),),
                                Text("sites build"),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(20),
              Text("Recent Ventures", style: TextStyle(fontSize: 24),),
              SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<_Data, String>>[
                BarSeries<_Data, String>(
                    dataSource: data,
                    xValueMapper: (_Data data, _) => data.x,
                    yValueMapper: (_Data data, _) => data.y,
                    name: 'Economic Growth',
                    color: Color.fromRGBO(8, 142, 255, 1)
                    )
              ])
            ].separate(10),
          ),
        ),
      ),
    );
  }
}