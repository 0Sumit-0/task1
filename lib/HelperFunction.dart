
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackOne extends CustomClipper<Path> {
  final bool openbar;
  CustomBackOne({this.openbar=false});
  @override
  Path getClip(Size size) {
    double radius = 30;
    double innerradius = 5;
    double barradius=5;

    Path path = Path();
    if(!openbar){
      //for custom back
       path.moveTo(radius, 0);
       path.lineTo(3 * radius, 0);
       path.arcToPoint(
        Offset((3 * radius + innerradius), innerradius)); //bottom inner left
       path.lineTo(size.width - (3 * radius + innerradius), innerradius);
       path.arcToPoint(Offset(size.width - (3 * radius), 0)) ;//top inner left
       path.lineTo(size.width - radius, 0);
       path.arcToPoint(Offset(size.width, radius));//top right
       path.lineTo(size.width, 3 * radius);
       path.arcToPoint(Offset(
      size.width - innerradius, 3 * radius + innerradius)); //top inner right
       path.lineTo(
      size.width - innerradius, size.height - (3 * radius + innerradius));
       path.arcToPoint(
        Offset(size.width, size.height - 3 * radius)); //bottom inner right
       path.lineTo(size.width, size.height - radius);
       path.arcToPoint(Offset(size.width - radius, size.height));//bottom right
       path.lineTo(size.width - (3 * radius), size.height);
       path.arcToPoint(Offset(size.width - (3 * radius + innerradius),
      size.height - innerradius)); //bottom inner right
       path.lineTo(3 * radius + innerradius, size.height - innerradius);
       path.arcToPoint(Offset(3 * radius, size.height)); //bottom inner left
       path.lineTo(radius, size.height);
       path.arcToPoint(Offset(0, size.height - radius)); // bottom left
       path.lineTo(0, size.height - 3 * radius);
       path.arcToPoint(Offset(innerradius,
      size.height - (3 * radius + innerradius))); //bottom inner left
       path.lineTo(innerradius, 3 * radius + innerradius);
       path.arcToPoint(Offset(0, 3 * radius)); //top inner left
       path.lineTo(0, radius);
       path.arcToPoint(Offset(radius, 0)); //top left
    }else{
      //for openbar
      path.moveTo(size.width/2, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width/2, size.height);
      path.lineTo(size.width/2, size.height/4);
      path.arcToPoint(Offset(0, size.height/4-barradius));
      path.lineTo(0, size.height/6);
      path.arcToPoint(Offset(size.width/2, size.height/7-barradius));

    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomBackTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 25;
    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset((size.width), radius))
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - (radius), size.height))
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius))
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomBackThree extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 25;
    Path path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset((size.width), radius))
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, radius)
      ..arcToPoint(Offset(radius, 0))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 20;
    var counterpoints=[
      Offset(size.width/2-radius/2, 0),
      Offset(0,size.height-(sqrt(3)*radius/2)),
      Offset(radius/2,(size.height)),
      Offset(size.width-radius/2, size.height),
      Offset(size.width,size.height-(sqrt(3)*radius/2)),
      Offset(size.width/2 + radius/2,0)
    ];
    Path path = Path()
      ..addPolygon(counterpoints, false)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


class CustomButtonWidget extends StatelessWidget {
  final bool reverse;
  final String textval;
  final Color boxcolor;
  final bool ispressed;

  const CustomButtonWidget({super.key, this.reverse = false,required this.boxcolor,required this.textval,this.ispressed=false});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomButton(reverse: reverse),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        width: 120,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipPath(
            clipper: CustomButton(reverse: reverse),
            child: Container(
              decoration: BoxDecoration(
                  color: boxcolor,
                boxShadow: [
                  for(double i=1;i<(ispressed ? 8: 4);i++)
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 3*i,
                    )
                ],
              ),
              child: Center(
                child: Text(
                  textval,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      shadows: [
                        for(double i=1;i<(ispressed ? 8: 4);i++)
                          Shadow(
                            color: Colors.white,
                            blurRadius: 3*i,
                          )
                      ],
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButton extends CustomClipper<Path> {
  final bool reverse;
  CustomButton({this.reverse=false});
  @override
  Path getClip(Size size) {
    double radius = 20;
    Path path = Path();
    if(!reverse){
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height-radius);
      path.arcToPoint(Offset(size.width-radius, size.height));
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    }else{
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(radius, size.height);
      path.arcToPoint(Offset(0, size.height-radius));
      path.lineTo(0, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomLogoFrame extends CustomClipper<Path> {
  final bool inner;
  CustomLogoFrame({this.inner=false});
  @override
  Path getClip(Size size) {
    double radius=10;
    double innerradius=10;
    var outercounterpoints=[
      Offset(size.width/2, 0),
      Offset(0,size.height/5),
      Offset(radius,(size.height*3)/4),
      Offset(size.width/2, size.height),
      Offset(size.width-radius,(size.height*3)/4),
      Offset(size.width,size.height/5)
    ];
    var innercounterpoints=[
      Offset(size.width/2, 0),
      Offset(innerradius,size.height/5),
      Offset(radius+innerradius,(size.height*3)/4-innerradius),
      Offset(size.width/2, size.height-2),
      Offset(size.width-(radius+innerradius),(size.height*3)/4-innerradius),
      Offset(size.width-innerradius,size.height/5)
    ];
    Path path = Path();
    if(!inner){
      path.addPolygon(outercounterpoints, false);
    }else{
      path.addPolygon(innercounterpoints, false);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
