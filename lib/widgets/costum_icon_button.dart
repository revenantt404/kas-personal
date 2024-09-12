import 'package:flutter/material.dart';

class CostumIconButton extends StatelessWidget {
  const CostumIconButton({
    super.key,
    this.foregroundColor = Colors.white,
    required this.backgroundColor,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final IconData icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: [
              Icon(
                icon,
                color: foregroundColor,
                size: 32,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(
                    color: foregroundColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
