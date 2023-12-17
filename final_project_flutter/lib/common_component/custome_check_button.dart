import 'package:flutter/material.dart';

import 'select_location.dart';

class CustomeCheckBox extends StatefulWidget {
  CustomeCheckBox({super.key, required this.text}) {
     wid = Row(
      children: [
        Expanded(
          child: selectLocation,
        ),
      ],
    );
  }
  Widget wid = Container();
  SelectLocation selectLocation = SelectLocation(village: -1, city: -1);
  String value = "admin" ;
  String text;
  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  @override
  Widget build(BuildContext context) {
     return Wrap(// direction: Axis.vertical,alignment: WrapAlignment.spaceAround,//mainAxisAlignment:MainAxisAlignment.start,
      children: [
        
        SizedBox(
            height: widget.value=="fockeltpoint" ? 300 :0 ,
            width: widget.value=="fockeltpoint" ? null : 0,
            child: widget.wid),
        //Visibility(maintainState: true,visible: widget.value,child: widget.wid) ,
        Wrap(//alignment: WrapAlignment.start,crossAxisAlignment: WrapCrossAlignment.start,runAlignment: WrapAlignment.start,direction: Axis.vertical,//mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Wrap(alignment: WrapAlignment.start,crossAxisAlignment: WrapCrossAlignment.start,runAlignment: WrapAlignment.start,children: [
              Radio<String>(
              value:  "admin",groupValue:  widget.value ,
              onChanged: (value) {
                setState(() {
                  widget.value = value!;
                });
              },
            ),
            const Text("مسؤيل قواعدالبيانات",style: TextStyle(color: Colors.white,fontSize: 18),),
            ],),
           

             Wrap(alignment: WrapAlignment.start,crossAxisAlignment: WrapCrossAlignment.start,runAlignment: WrapAlignment.start,children: [
              Radio<String>(
              value:  "fockeltpoint",groupValue:  widget.value ,
              onChanged: (value) {
                setState(() {
                  widget.value = value!;
                });
              },
            ),
            const Text("المشرف في مودرية الصحة",style: TextStyle(color: Colors.white,fontSize: 18),),
            ],),


            Wrap(alignment: WrapAlignment.start,crossAxisAlignment: WrapCrossAlignment.start,runAlignment: WrapAlignment.start,
          children: [
            Wrap(alignment: WrapAlignment.start,children: [
              Radio<String>(
              value:  "supervisor",groupValue:  widget.value ,
              onChanged: (value) {
                setState(() {
                  widget.value = value!;
                });
              },
            ),
            const Text("متخذ القرار",style: TextStyle(color: Colors.white,fontSize: 18),),
            ],),

          ],)]
        ),
      ],
    );
  }
}
