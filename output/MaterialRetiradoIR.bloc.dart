class MaterialRetiradoBlocIR with Validators implements BlocBase { 
  final listenConection = ConnectionStatusSingleton.getInstance();
  final _materialretiradoListController = BehaviorSubject<MaterialRetiradoModelIR>();
  final _idRemotoController = BehaviorSubject<int>();
  final _nombreController = BehaviorSubject<String>;
