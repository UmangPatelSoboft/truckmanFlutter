import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


class HomeScreen extends StatelessWidget {
  SfRangeValues _values = SfRangeValues(0, 20.0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
            padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Container(
                            width: double.infinity,
                            child: Text("24 Aug 2022",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xff801DFE),
                                )),
                          ),),
                          VerticalDivider(width: 1.0),
                          Expanded(child: Container(
                            width: double.infinity,
                            child: Text("The Best Transport",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xff203864),
                                )),
                          ),),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: SizedBox(
                            width: double.infinity,
                            child: Text("#9798908098       ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                )),
                          ),),
                          const VerticalDivider(width: 1.0),
                          Expanded(child: SizedBox(
                            width: double.infinity,
                            child: Text("Mukesh M.",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                )),
                          ),),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                      ),
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Vahicle Type :",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                )),
                          ),
                          Container(
                            child: Text(" 132 feet Open Truck",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                )),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 80.sp,
                            child: SfRangeSlider.vertical(
                              min: 0.0,
                              max: 20.0,
                              values:_values ,
                              interval: 20,
                              showTicks: false,
                              showLabels: false,
                              enableTooltip: false,
                              minorTicksPerInterval: 0, onChanged: (SfRangeValues value) {  },
                              startThumbIcon: SvgPicture.asset("assets/images/start.svg"),
                              endThumbIcon: SvgPicture.asset("assets/images/end.svg"),
                            ),
                          ),
                          Column(children: [
                            Text("Rajkot, Gujarat",
                                style: TextStyle(
                                  fontSize:12.sp,
                                  color: Colors.black,
                                )),
                            SizedBox( height: 25,),
                            Text("Jaipur, Rajasthan",
                                style: TextStyle(
                                  fontSize:12.sp,
                                  color: Colors.black,
                                ))
                          ],)

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ) ,
    );

  }

}