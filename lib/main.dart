import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  List<Step> _steps;
  int _current ;

  @override
  void initState() {
    _current = 0;
    _steps= <Step>[
      new Step(title: new Text("Step 1"), content: new Text("Do something"), isActive: true),
      new Step(title: new Text("Step 2"), content: new Text("Do something"), isActive: true),
      new Step(title: new Text("Step 3"), content: new Text("Do something"), isActive: true),
    ];
  }

  void _stepcontinue()
  {
    setState(() {
      _current++;
      if(_current>=_steps.length) _current= _steps.length - 1;
    });
  }

  void _stepcancel()
  {
    setState(() {
      _current--;
      if(_current < _steps.length) _current= _steps.length - 1;
    });
  }
  void _steptap(int index)
  {
    setState(() {
      _current= index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stepper '),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Stepper(steps: _steps,
            type: StepperType.vertical,
            currentStep: _current,
            onStepCancel: _stepcancel,
            onStepContinue: _stepcontinue,
            onStepTapped: _steptap,

          ),

        ),
      ),
    );
  }
}