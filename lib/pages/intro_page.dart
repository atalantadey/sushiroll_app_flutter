import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushiroll/components/my_button.dart';
import 'package:sushiroll/themes/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            //SHOP NAME
            Text(
              'SUSHI MAN',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            //ICON
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('lib/images/smile.png'),
            ),

            //TITLE
            Text(
              'THE TASTE OF JAPANESE CUISINE.',
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 40, color: Colors.white, height: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            //SUBTITLE
            Text(
              'Experiance the authentic taste from the mainlands of japan from the comfort of your home',
              style: TextStyle(color: Colors.red.shade200, height: 1),
            ),
            const SizedBox(
              height: 100,
            ),
            //GET STARTED BUTTON
            MyButton(
                text: 'Get Started',
                ontap: () {
                  //go to the MENU PAGE
                  Navigator.pushNamed(context, '/menupage');
                }),
          ],
        ),
      ),
    );
  }
}
