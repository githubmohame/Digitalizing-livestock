import 'package:flutter/material.dart';

import 'select_location.dart';

class CustomeCheckBox extends StatefulWidget {
  CustomeCheckBox({Key? key, required this.text}) : super(key: key) {
    print("Checking");
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
  String value = "AdminUser" ;
  String text;
  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  @override
  Widget build(BuildContext context) {
    TextField;
    return Column(
      children: [
        
        SizedBox(
            height: widget.value=="fockeltpoint" ? null : 0,
            width: widget.value=="fockeltpoint" ? null : 0,
            child: widget.wid),
        //Visibility(maintainState: true,visible: widget.value,child: widget.wid) ,
        Column(
          children: [
            Row(children: [
              Radio<String>(
              value:  "AdminUser",groupValue:  widget.value ,
              onChanged: (value) {
                setState(() {
                  widget.value = value!;
                });
              },
            ),
            const Text("مسؤيل قواعدالبيانات",style: TextStyle(color: Colors.white,fontSize: 18),),
            ],),
           

             Row(children: [
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


            Row(
          children: [
            Row(children: [
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
