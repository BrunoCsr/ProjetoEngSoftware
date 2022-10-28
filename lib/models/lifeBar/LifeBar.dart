import 'package:flutter/material.dart';

class LifeBar extends StatefulWidget {
  final double life;

  const LifeBar(
    this.life, {
    super.key,
  });

  @override
  State<LifeBar> createState() => _LifeBarState();
}

class _LifeBarState extends State<LifeBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 200,
      child: Stack(
        children: [
          Container(
            height: 20,
            width: 200,
            color: Colors.black,
          ),
          Container(
            height: 20,
            width: widget.life == 0 ? 100 : widget.life * 2,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
