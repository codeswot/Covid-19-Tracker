import 'package:flutter/material.dart';
import 'package:covid_new_19/widgets/screensize.dart';



class StatisticsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var appWidth = screenWidth(context);

    const rowSpacer=TableRow(
        children: [
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 8,
          )
        ]);


    return Scaffold(

      body: Stack(
        children:[
          Column(
            children : [
          Container(
            width: appWidth,
            padding: EdgeInsets.only(left: 10,top: 35,right: 10,bottom: 25),
            color : Color(0xff0DA766),
            child : Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child :
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children :
                            [
                              Container(
                                padding : EdgeInsets.only(bottom: 10),
                                child : Row(
                                    children : [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color :  Colors.white,
                                          ),
                                          padding : EdgeInsets.only(left:10, top:5, right: 10, bottom: 5),
                                          margin: EdgeInsets.only(right: 5),
                                          child : Text(
                                            'NGN',
                                            style: TextStyle(fontSize: 10),
                                          )
                                      ),
                                      Container(
                                          margin : EdgeInsets.only(right: 10),
                                          child : Text(
                                              'Nigeria',
                                            style: TextStyle(color: Colors.white),
                                          )
                                      ),
                                      Spacer(),
                                      Container(
                                          child : Text(
                                              'Today',
                                            style: TextStyle(color: Colors.white,
                                                fontSize: 11),
                                          )
                                      ),
                                    ])
                              ),
                              Container (
                                padding : EdgeInsets.only(top:10,bottom: 5),
                                child :
                                Text(
                                  '12,900',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27
                                  ),
                                )
                              ),
                              Container(
                                 padding : EdgeInsets.only(bottom: 10),
                                 child : Text(
                                    'Active Cases',
                                    style: TextStyle(
                                        color : Colors.white,
                                      fontSize: 11
                                    ),
                                  )
                              )
                            ]
                        )
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 20,
                      thickness: 0.5,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children : [
                              Text(
                                'Confirmed Cases',
                                style: TextStyle(
                                    color : Colors.white,
                                  fontSize: 11
                                ),
                              ),
                              Text(
                                '12,900',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23
                                ),
                              )
                            ]
                        )
                    ),
                  ],
            )
          ),
          Container(
            padding: EdgeInsets.all(20),
            child : Row(
              children : [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color :  Color(0xffD9DBFB),
                  ),
                  padding : EdgeInsets.only(left:10, top:5, right: 10, bottom: 5),
                  margin: EdgeInsets.only(right: 20),
                  child : Text(
                      'Confirmed Cases',
                       style: TextStyle(fontSize: 10),
                  )
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color :  Color(0xffD9DBFB),
                    ),
                    padding : EdgeInsets.only(left:10, top:5, right: 10, bottom: 5),
                    margin: EdgeInsets.only(right: 20),
                    child : Text(
                        'Deaths',
                        style: TextStyle(fontSize: 10),
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)
                    ),
                    padding : EdgeInsets.only(left:10, top:5, right: 10, bottom: 5),
                    margin: EdgeInsets.only(right: 20),
                    child : Text(
                        'Recovered',
                        style: TextStyle(fontSize: 10),
                    )
                ),
              ]
            )
          ),
          Container(
            width: appWidth,
            padding: EdgeInsets.only(left: 10,top: 15,right: 10,bottom: 10),
            child : Table(
              border: TableBorder(horizontalInside: BorderSide(width: 1, color: Color(0xffE8E8E8), style: BorderStyle.solid)),
              columnWidths: {
                0: FractionColumnWidth(.2),
                1: FractionColumnWidth(.4),
                2: FractionColumnWidth(.2)},
              children: [
                TableRow(
                  children: [
                    Container(
                        color: Color(0xffF1F1F1),
                        padding: EdgeInsets.only(bottom: 5,top:5),
                        child :Column(
                            children:[
                              Text('States',
                                   style: TextStyle(fontSize: 10),
                              )]
                        )
                    ),
                    Container(
                        color : Color(0xffF1F1F1),
                        padding: EdgeInsets.only(bottom: 5, top:5),
                        child : Column(
                            children:[
                              Text('Confirmed Cases',
                                style: TextStyle(fontSize: 10),
                              )]
                        )
                    ),
                    Container(
                        color : Color(0xffF1F1F1),
                        padding : EdgeInsets.only(bottom: 5,top:5),
                        child : Column(
                            children:[
                              Text('Deaths',
                                style: TextStyle(fontSize: 10),
                              )]
                        )
                    )
                  ]
                ),
                TableRow( children: [
                  Container(
                    padding : EdgeInsets.only(bottom: 15, top:15),
                     child : Column(
                         children:[
                           Text('Kano',
                               style : TextStyle(
                                   fontWeight: FontWeight.bold,
                                 fontSize: 12
                               )
                           )]
                     )
                  ),
                  Container(
                    padding : EdgeInsets.only(top:15,bottom: 15),
                     child : Column(
                         children:[
                           Text('1080',
                               style : TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12
                               )
                           )])),
                  Container(
                    padding: EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('1080',
                              style : TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              )
                            )]
                      )
                  )
                ]),
                TableRow( children: [
                  Container(
                      padding : EdgeInsets.only(bottom: 15, top:15),
                      child : Column(
                          children:[
                            Text('Lagos',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )]
                      )
                  ),
                  Container(
                      padding : EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('5989',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )])),
                  Container(
                      padding: EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('1080',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )]
                      )
                  )
                ]),
                TableRow( children: [
                  Container(
                      padding : EdgeInsets.only(bottom: 15, top:15),
                      child : Column(
                          children:[
                            Text('Anambra',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )]
                      )
                  ),
                  Container(
                      padding : EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('89',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )])),
                  Container(
                      padding: EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('3',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )]
                      )
                  )
                ]),
                TableRow( children: [
                  Container(
                      padding : EdgeInsets.only(bottom: 15, top:15),
                      child : Column(
                          children:[
                            Text('Ogun',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )]
                      )
                  ),
                  Container(
                      padding : EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('390',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )])),
                  Container(
                      padding: EdgeInsets.only(top:15,bottom: 15),
                      child : Column(
                          children:[
                            Text('45',
                                style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )
                            )]
                      )
                  )
                ]),
              ],
            ),
          ),
            ]
          ),
        ],
      ),
    );
  }
}
