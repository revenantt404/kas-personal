import 'package:flutter/material.dart';

class CreatorInfo extends StatelessWidget {
  const CreatorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    void onTutupTap() {
      Navigator.of(context).pop();
    }

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Tentang Pembuat",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: Image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    image: AssetImage("src/img/logoSMK.png")),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kevin Feras",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "XII RPL 2",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: SizedBox(
              width: 30,
              height: 30,
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    backgroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 255, 255, 255)),
                    foregroundColor: WidgetStatePropertyAll(
                        const Color.fromARGB(255, 0, 0, 0)),
                    elevation: WidgetStatePropertyAll(0),
                  ),
                  onPressed: onTutupTap,
                  label: Icon(Icons.close)),
            )),
      ],
    );
  }
}
