import 'package:MVP_Patern/presenter/counter_precenter.dart';
import 'package:MVP_Patern/view/counter_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/counter_model.dart';

class HomePage extends StatefulWidget {
  final CounterPrecenter presenter;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> implements CounterView {
  CounterModel _viewModel;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.counterView = this;
  }

  @override
  void refreshCounter(CounterModel viewModel) {
    setState(() {
      this._viewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Click buttons to add and substract.",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    this.widget.presenter.decrementCounter();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                Text(
                  _viewModel?.counter.toString(),
                ),
                FloatingActionButton(
                  onPressed: () {
                    this.widget.presenter.incrementCounter();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
