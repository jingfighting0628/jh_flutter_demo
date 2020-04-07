/**
 *  jhFormInputCell.dart
 *
 *  Created by iotjin on 2020/04/06.
 *  description:  输入行样式，左侧title,右侧输入框，可加自定义widget
 */

import 'package:flutter/material.dart';
import '../JhForm/jhTextField.dart';
import 'package:flutter/services.dart';


const double _titleSpace = 100.0; //左侧title默认宽
const double _cellHeight = 45.0; //输入、选择样式一行的高度
const int _maxLength = 100;  //最大录入长度
const Color _textColor = Colors.black;
const TextStyle _titleStyle = TextStyle(fontSize: 15.0,color: _textColor);
const TextStyle _textStyle = TextStyle(fontSize: 15.0,color: _textColor);
const TextStyle _hintTextStyle = TextStyle(fontSize: 15.0,color: Color(0xFFBBBBBB)); //187

typedef _InputCallBack = void Function(String value);

class JhFormInputCell extends StatefulWidget {

  final String title;
  final String text;
  final String hintText;
  final TextInputType keyboardType; //键盘类型，默认文字
  final FocusNode focusNode;
  final bool showRedStar; //显示左侧小红星，默认不显示
  final Widget leftWidget; //左侧widget ，默认隐藏
  final Widget rightWidget; //右侧widget ，默认隐藏
  final int maxLines; //最大行数，默认显示一行，自动换行，最多展示_maxLines 行
  final int maxLength; //最大长度，默认_maxLength
  final bool showMaxLength;//是否显示右侧最大长度文字，默认不显示
  final bool enabled; //是否可编辑，默认true
  final List<TextInputFormatter> inputFormatters;
  final _InputCallBack inputCallBack;
  final double space;  //标题宽度
  final TextStyle titleStyle;
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final TextAlign textAlign; //输入文字对齐方式，默认左对齐
  final InputBorder border; //输入边框样式，默认无边框
  final bool hiddenLine; //隐藏底部横线
  final bool topAlign; //左侧标题顶部对齐，默认居中

  const JhFormInputCell({
    Key key,
    this.title: '',
    this.text: '',
    this.keyboardType: TextInputType.text,
    this.hintText: '请输入',
    this.focusNode,
    this.showRedStar:false,
    this.leftWidget,
    this.rightWidget,
    this.maxLines,
    this.maxLength:_maxLength,
    this.showMaxLength:false,
    this.enabled:true,
    this.inputFormatters,
    this.inputCallBack,
    this.space =_titleSpace,
    this.titleStyle = _titleStyle,
    this.textStyle = _textStyle,
    this.hintTextStyle= _hintTextStyle,
    this.textAlign= TextAlign.left,
    this.border = InputBorder.none, //去掉下划线
    this.hiddenLine = false,
    this.topAlign =false,
  }): super(key: key);


  @override
  _JhFormInputCellState createState() => _JhFormInputCellState();
}

class _JhFormInputCellState extends State<JhFormInputCell> {
  @override
  Widget build(BuildContext context) {
    return

      DecoratedBox(
//        decoration: BoxDecoration(
//            border: widget.hiddenLine== true ?null: Border(bottom: Divider.createBorderSide(context, width: 0.8),)
//        ),
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(width: 0.8, color: widget.hiddenLine== true ?Colors.transparent:Theme.of(context).dividerColor),
            insets: EdgeInsets.fromLTRB(8,0,0,0)
        ),

        child:
        ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: _cellHeight //最小高度为50像素
            ),
            child:

            Row(
                crossAxisAlignment:widget.topAlign==true ?CrossAxisAlignment.start:CrossAxisAlignment.center,
                children: <Widget>[

                  Container(width:8, padding: EdgeInsets.fromLTRB(0, widget.topAlign==true?8:0, 0, 0),
                    child: Text(widget.showRedStar ? "*":" ", style: TextStyle(fontSize: 18.0,color: Colors.red)),
                  ),
                  Offstage(
                    offstage: widget.title.isEmpty?true:false,
                    child:
                    Container(width: widget.space-8, padding: EdgeInsets.fromLTRB(0, widget.topAlign==true?8:0, 0, 0),
                      child: Text(widget.title, style: widget.titleStyle),),
                  ),
                  Expanded(
                      child:
                      JhTextField(
                        text: widget.text,
                        keyboardType: widget.keyboardType,
                        hintText: widget.hintText,
                        focusNode: widget.focusNode,
                        leftWidget: widget.leftWidget,
//                        rightWidget: widget.rightWidget,
                        maxLines:widget.maxLines,
                        maxLength:widget.maxLength,
                        showMaxLength: widget.showMaxLength,
                        enabled:widget.enabled,
                        inputFormatters: widget.inputFormatters,
                        inputCallBack: widget.inputCallBack,
                        textStyle: widget.textStyle,
                        hintTextStyle: widget.hintTextStyle,
                        textAlign: widget.textAlign,
                        border: widget.border,
                      )
                  ),
                  widget.rightWidget!=null?widget.rightWidget:Container(),
                ]
            )

        ),

      );

  }
}