import 'package:flutter/material.dart';

class OnHover extends StatefulWidget {
  final void Function()? onTap;
  final double? matrix;
  final Widget Function(bool isHovered) builder;

  const OnHover({Key? key, required this.builder,this.onTap,this.matrix}) : super(key: key);

  @override
  OnHoverState createState() => OnHoverState();
}

class OnHoverState extends State<OnHover> {

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {

    final hovered = Matrix4.identity()..translate(0,widget.matrix ?? -5,0);
    final transform = isHovered ? hovered : Matrix4.identity();

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_)=> onEntered(true),
        onExit: (_)=> onEntered(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: transform,
          child: widget.builder(isHovered),
        ),
      ),
    );
  }

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered = isHovered;
    });
  }
}