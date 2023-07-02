import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CircleImageAnimation extends StatefulWidget {
    CircleImageAnimation({super.key});
 File? image  ;
  @override
  State<CircleImageAnimation> createState() => _CircleImageAnimationState();
}

class _CircleImageAnimationState extends State<CircleImageAnimation> {
  double hover = 100;
  bool imageClick = false;
 
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        if (imageClick) return;
        hover = 0;
        setState(() {});
      },
      onExit: (event) {
        if (imageClick) return;
        hover = 100;
        setState(() {});
      },
      child: SizedBox(
        height:100,
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Align(
                alignment: Alignment.center,
                child: widget.image is File
                    ?  CircleAvatar(radius:100,backgroundImage: FileImage(widget.image!) ,backgroundColor: Colors.blue.shade300,)
                    : CircleAvatar(radius:100, backgroundColor:Colors.blue.shade300,
                      backgroundImage: AssetImage("assets/icons/user2.png") ,
                    ),
              ),
              AnimatedPositioned(
                curve: Curves.linear,
                top: hover,
                left: 0,
                duration: Duration(milliseconds: 600),
                child: Container(
                  width: 100, height: 100,
                  child: Center(
                      child: IconButton(
                    onPressed: () async {
                      imageClick = true;
                      FilePickerResult? f = await FilePicker.platform.pickFiles(type: FileType.custom,
                          allowedExtensions: ["png", "jpg", "jpeg"]);

                      if (f is FilePickerResult) {
                       widget.image=File(f.files.first.path.toString()) ;
                      }
                      imageClick = false;
                      hover = 100;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  )),
                  //margin: EdgeInsets.all(100.0),
                  decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.4),
                      shape: BoxShape.rectangle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    /* Path path = Path();
    path.moveTo(size.height / 2, 0);
    path.lineTo(size.height / 2,  size.width);
    path.lineTo(size.height, size.width);
     path.lineTo(size.height,0);*/
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(
      size.width,
      size.height / 2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
