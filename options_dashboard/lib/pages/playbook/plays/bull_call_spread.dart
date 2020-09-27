import 'package:flutter/material.dart';
import 'package:options_dashboard/models/trade_info.dart';
import 'package:options_dashboard/pages/playbook/widgets/build_trade_view.dart';
import 'package:options_dashboard/pages/playbook/widgets/return_chart.dart';

class BullCallSpread extends StatelessWidget {
  final double stockPrice = 100;
  final List<double> range = [90, 110];
  final List<TradeInfo> tradeList = [
    TradeInfo(
      strikePrice: 101,
      expiryDate: DateTime.now(),
      premium: 3.5,
      impliedVolatility: 0.2,
      tradeType: TradeType.call,
    ),
    TradeInfo(
      expiryDate: DateTime.now(),
      strikePrice: 105,
      premium: 2,
      buyOrSell: BuyOrSell.sell,
      impliedVolatility: 0.2,
      tradeType: TradeType.call,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height - 140,
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bull call spread',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'Bullish strategy',
            style: Theme.of(context).textTheme.subtitle1,
            overflow: TextOverflow.fade,
          ),
          Divider(
            height: 2,
            color: Colors.indigo,
          ),
          Table(
            children: [
              TableRow(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How to',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('buy a call'),
                          Text('sell a call at a higher strike price')
                        ],
                      )),
                ],
              ),
              TableRow(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Max risk',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('difference between premiums paid')),
                ],
              ),
              TableRow(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Max reward',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft, child: Text('limited')),
                ],
              ),
              TableRow(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Effect of volatility',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft, child: Text('depends')),
                ],
              ),
              TableRow(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Effect of time',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft, child: Text('depends')),
                ],
              ),
            ],
          ),
          Divider(
            height: 2,
            color: Colors.indigo,
          ),
          SizedBox(
            height: 12.0,
          ),
          buildPlaybookReturnChart(
            context,
            tradeList: tradeList,
            stockPrice: stockPrice,
            range: range,
          ),
          Divider(
            height: 2,
            color: Colors.purple,
          ),
          ...buildTradeView(tradeList),
        ],
      ),
    );
  }
}
