// import 'dart:async';
//
// import 'package:data_connection_checker/data_connection_checker.dart';
//
// abstract class NetworkInfo {
//   Future<bool> get isConnected;
// }
//
// class NetworkInfoImpl implements NetworkInfo {
//   final DataConnectionChecker? connectionChecker;
//
//   NetworkInfoImpl({DataConnectionChecker? connection})
//       : connectionChecker = connection ?? DataConnectionChecker();
//
//   @override
//   Future<bool> get isConnected => connectionChecker!.hasConnection;
//
//   StreamController<DataConnectionStatus> connectivityStreamController =
//       StreamController<DataConnectionStatus>();
//
//   StreamSubscription<DataConnectionStatus> get connection =>
//       DataConnectionChecker().onStatusChange.listen((dataConnectionStatus) {
//         connectivityStreamController.add(dataConnectionStatus);
//       });
// }
