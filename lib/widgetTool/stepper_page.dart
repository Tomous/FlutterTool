import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;
  List<Step> steps = [
    const Step(
      title: Text('Step 1'),
      content: Text('Content of step 1'),
      isActive: true,
    ),
    const Step(
      title: Text('Step 2'),
      content: Text('Content of step 2'),
      isActive: true,
    ),
    const Step(
      title: Text('Step 3'),
      content: Text('Content of step 3'),
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepTapped: (value) {
        setState(() {
          currentStep = value;
        });
      },
      onStepCancel: () {
        setState(() {
          if (currentStep > 0) {
            currentStep -= 1;
          } else {
            currentStep = 0;
          }
        });
      },
      onStepContinue: () {
        setState(() {
          if (currentStep < steps.length - 1) {
            currentStep += 1;
          } else {
            currentStep = 0;
          }
        });
      },
    );
  }
}
