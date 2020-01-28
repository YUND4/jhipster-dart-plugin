class LocationModelBlocIR with Validators implements BlocBase { 
  final listenConection = ConnectionStatusSingleton.getInstance();
  final _idController = BehaviorSubject<int>();
  final _locationListController = BehaviorSubject<LocationModel>();
Function(ReconexionModelo) get reconexionSink => _reconexionListController.sink.add;