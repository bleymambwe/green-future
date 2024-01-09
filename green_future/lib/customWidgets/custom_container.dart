import 'package:flutter/material.dart';
import 'package:green_future/theme/theme.dart';

class Pallet extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final String? text;

  const Pallet({
    Key? key,
    this.text,
    this.width = 0.1,
    this.height = 0.06,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        height: MediaQuery.of(context).size.height * height,
        decoration: BoxDecoration(
          color: Colors.green.shade700.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.network(
                pallet_url,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * width,
                height: MediaQuery.of(context).size.height * height,
              ),
            ),
            if (child != null)
              child!
            else
              Text(
                text!,
                style: TextStyle(
                  fontFamily: 'EBGaramond',
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const CustomContainer({
    Key? key,
    required this.child,
    this.width = 0.1,
    this.height = 0.06,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(4.0), // Adjust the border radius as needed
        color: Colors.green.shade700
            .withOpacity(0.5), // Adjust the opacity as needed
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 3), // Offset in the x, y direction
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            'https://www.dropbox.com/scl/fi/3vcjneu88woax5s2h7w61/green-pallate.jpg?rlkey=wjhdteazh0gwrvrikn85jg270&dl=1',
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          child
        ],
      ),
    );
  }
}
