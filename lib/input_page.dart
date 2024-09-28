import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';

// Values that will never change use the "const" keyword, while values
// that change in runtime use the "final" keyword
// Use DRY Principle always, Do Not Repeat Yourself.

enum Gender { male, female }

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

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
          title: const Center(
        child: Text('BMI CALCULATOR'),
      )),
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
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  // Function for colors
  // 1=Male, 2=Female

  void updateColour(Gender selectedGender) {
    //   male card pressed
    if (selectedGender == Gender.male) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      }
    } else {
      maleCardColour = inactiveCardColour;
    }

    //   female card pressed
    if (selectedGender == Gender.female) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      } else {
        femaleCardColour = inactiveCardColour;
      }
    }
  }

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
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColour(Gender.male);
                  });
                },
                child: ReusableCard(
                  colour: maleCardColour,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: "MALE",
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColour(Gender.female);
                  });
                },
                child: ReusableCard(
                  colour: femaleCardColour,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: "FEMALE",
                  ),
                ),
              )),
            ],
          ),
        ),
        const Expanded(
          child: ReusableCard(
            colour: activeCardColour,
            cardChild: SizedBox.shrink(),
          ),
        ),
        const Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
          color: bottomContainerColour,
          margin: const EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: bottomContainerHeight,
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
