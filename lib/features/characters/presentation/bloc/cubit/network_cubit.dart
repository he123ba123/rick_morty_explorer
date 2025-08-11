import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkCubit extends Cubit<bool> {
  final Connectivity _connectivity;

  NetworkCubit(this._connectivity) : super(true) {
    _init();
  }

  void _init() {
    _checkInitialStatus();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      emit(_mapStatusToOnline(result));
    });
  }

  Future<void> _checkInitialStatus() async {
    final result = await _connectivity.checkConnectivity();
    emit(_mapStatusToOnline(result));
  }

  bool _mapStatusToOnline(ConnectivityResult result) {
    return result != ConnectivityResult.none;
  }
}
