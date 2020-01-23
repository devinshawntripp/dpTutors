import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';



class OpenPages extends StatefulWidget {
  @override
  _OpenPagesState createState() => _OpenPagesState();
}

class _OpenPagesState extends State<OpenPages> {
  bool isOpen = false;

   double AnimationWidth = 50;
   double AnimationHeight = 50;
   

  @override
  Widget build(BuildContext context) {
    Size w = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(2, 50, 2, 2),
      width: AnimationWidth,
      height: AnimationHeight,
      child: GestureDetector(
        onTapUp: (tapInfo) {
          setState(() {
            var localTouchPosition = (context.findRenderObject() as RenderBox).globalToLocal(tapInfo.globalPosition);
            // print(localTouchPosition);

            print(tapInfo.globalPosition);

            if((localTouchPosition.dx >= 20.0 && localTouchPosition.dx <= 40.0) && (localTouchPosition.dy <= 100 && localTouchPosition.dy >= 60)) {
              isOpen = !isOpen;
              
              print(isOpen);
              if(isOpen == false){
                AnimationWidth = w.width;
                AnimationHeight = w.height;
                
              } else {
                AnimationWidth = 50;
                AnimationHeight = 50;
                Navigator.pop(context);
                
              }
              
            }

            
            
          });
        },
        child: FlareActor(
          'assets/animatedmenu.flr',
          animation: isOpen ? 'idle' : 'started',
        ),
      )
      
    );
  }
}