class ReconexionBlocIR with Validators implements BlocBase { 
  final listenConection = ConnectionStatusSingleton.getInstance();
  final _reconexionListController = BehaviorSubject<ReconexionModelIR>();
  final _idRemotoController = BehaviorSubject<int>();
  final _fechaGeneradoController = BehaviorSubject<DateTime>;
