import 'package:flutter/material.dart';
import 'assets.dart';
import 'package:http/http.dart' as http;

class ProfileAvatar extends StatefulWidget {
  final String networkImageUrl;
  final String assetImagePath;
  final double radius;

  const ProfileAvatar({
    super.key,
    required this.networkImageUrl,
    required this.assetImagePath,
    required this.radius,
  });

  @override
  _ProfileAvatarState createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundImage: NetworkImage(widget.networkImageUrl),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool isExpanded;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final Alignment? alignment;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final int? lines;
  final bool? giveLinesAsText;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.alignment,
    this.isExpanded = false,
    this.fontFamily,
    this.textOverflow,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none, this.lines, this.giveLinesAsText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: isExpanded ? MediaQuery.of(context).size.width : null,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? Colors.black,
          fontFamily: fontFamily ?? Assets.interRegular,
          decoration: textDecoration,
        ),
        overflow:giveLinesAsText == true?null: textOverflow??TextOverflow.ellipsis,
        maxLines: lines,
      ),
    );
  }
}