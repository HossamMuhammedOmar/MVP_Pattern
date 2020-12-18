import '../model/counter_model.dart';
import '../view/counter_view.dart';

class CounterPrecenter {
  void incrementCounter() {}
  void decrementCounter() {}
  set counterView(CounterView value) {}
}

class BasicCounterPresenter implements CounterPrecenter {
  CounterModel _counterViewModel;
  CounterView _counterView;

  BasicCounterPresenter() {
    this._counterViewModel = new CounterModel(0);
  }

  @override
  void incrementCounter() {
    this._counterViewModel.counter++;
    this._counterView.refreshCounter(this._counterViewModel);
  }

  @override
  void decrementCounter() {
    this._counterViewModel.counter--;
    this._counterView.refreshCounter(this._counterViewModel);
  }

  @override
  set counterView(CounterView value) {
    _counterView = value;
    this._counterView.refreshCounter(this._counterViewModel);
  }
}
