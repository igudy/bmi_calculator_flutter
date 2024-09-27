import 'package:flutter/material.dart';

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
          // Expands the Row to take available vertical space
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ReusableCard(
                  colour: const Color(0xFF1D1E33),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: const Color(0xFF1D1E33),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableCard(
            colour: const Color(0xFF1D1E33),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ReusableCard(
                  colour: const Color(0xFF1D1E33),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: const Color(0xFF1D1E33),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  // const ReusableCard({super.key})

  ReusableCard({super.key, required this.colour});

  final Color colour;

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
    );
  }
}
