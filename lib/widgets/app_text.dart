import 'package:flutter/material.dart';
import 'package:shatla/utils/colors.dart';
import 'package:shatla/utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String first;
  late String second;
  bool _flag = true;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > 15) {
      first = widget.text.substring(0, 15);
      second = widget.text.substring(16);
    } else {
      first = widget.text;
      second = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return second == ''
        ? AppRegText(text: first)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppRegText(text: _flag ? first : widget.text),
              InkWell(
                onTap: () => setState(() {
                  _flag = !_flag;
                }),
                child: Row(
                  children: [
                    AppRegText(
                      text: 'show more',
                      color: AppColors.lightGreen,
                    ),
                    Icon(Icons.arrow_downward_rounded),
                  ],
                ),
              )
            ],
          );
  }
}

class AppMediumText extends StatelessWidget {
  const AppMediumText(
      {Key? key,
      required this.text,
      this.isBold = false,
      this.color = Colors.black,
      this.size})
      : super(key: key);
  final String text;
  final Color color;
  final double? size;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size ?? Dimensions.font20,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class AppLargeText extends StatelessWidget {
  const AppLargeText(
      {Key? key,
      required this.text,
      this.isBold = false,
      this.color = Colors.black,
      this.size})
      : super(key: key);
  final String text;
  final Color color;
  final bool isBold;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size ?? Dimensions.font22,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class AppRegText extends StatelessWidget {
  AppRegText(
      {Key? key,
      required this.text,
      this.isBold = false,
      this.maxLines,
      this.color = Colors.black,
      this.size})
      : super(key: key);
  final String text;
  final Color color;
  final double? size;
  final bool isBold;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size ?? Dimensions.font16,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
