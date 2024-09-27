import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Values that will never change use the "const" keyword, while values
// that change in runtime use the "final" keyword
// Use DRY Principle always, Do Not Repeat Yourself.

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: const AllBody(),
    );
  }
}

class AllBody extends StatefulWidget {
  const AllBody({super.key});

  @override
  State<AllBody> createState() => _TopBoxesState();
}

class _TopBoxesState extends State<AllBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                ),
              ),
              const Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: ReusableCard(
            colour: activeCardColour,
            cardChild: SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: SizedBox.shrink(),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                  cardChild: SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: bottomContainerColor,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
        ),
      ],
    );
  }
}

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    required this.cardChild,
  });

  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: 170.0,
      child: cardChild,
    );
  }
}
