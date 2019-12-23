import 'package:flutter/material.dart';

class ImageText extends StatelessWidget {
  final double padding;
  final double width;
  final String title;
  final Color textColor;
  final double textSize;
  final IconData icons;

  ImageText(this.icons, this.title,
      {this.width = double.infinity,
      this.padding = 0,
      this.textColor = Colors.black,
      this.textSize = 14});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: AlignmentDirectional.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(padding, 0, 10, 0),
                  child: _buildImage(),
                ),
                _buildText(),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            height: 0.5,
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Expanded(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
          ),
        ),
        onTap: (){
          print("点击了$title");
        },
      ),
    );
  }

  Widget _buildImage() {
    return Icon(this.icons);
  }
}
