import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
  ),
);

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get isConnectionChanged;
  void dispose();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  bool _lastConnectionStatus = false;

  NetworkInfoImpl(this._connectivity) {
    _initConnectivityListener();
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    final isConnected = await this.isConnected;
    _lastConnectionStatus = isConnected;
    _controller.add(isConnected);
  }

  void _initConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) {
        try {
          final isConnected = _checkConnectivity(results);
          if (isConnected != _lastConnectionStatus) {
            _lastConnectionStatus = isConnected;
            _controller.add(isConnected);
          }
        } catch (e) {
          // logger.e('Error processing connectivity change', error: e);
        }
      },
      onError: (error) {
        // logger.e('Connectivity stream error', error: error);
        _controller.add(false);
      },
      cancelOnError: false,
    );
  }

  bool _checkConnectivity(List<ConnectivityResult> results) {
    return results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet ||
          result == ConnectivityResult.vpn,
    );
  }

  @override
  Future<bool> get isConnected async {
    try {
      final List<ConnectivityResult> results = await _connectivity
          .checkConnectivity();

      final isConnected = _checkConnectivity(results);
      // logger.d('Connection check: $isConnected (from $results)');

      return isConnected;
    } catch (e) {
      // logger.e('Error checking connectivity', error: e);
      return false;
    }
  }

  @override
  Stream<bool> get isConnectionChanged => _controller.stream;

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    _controller.close();
  }
}
