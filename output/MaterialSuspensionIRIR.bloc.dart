class MaterialSuspensionIRBlocIR with Validators implements BlocBase { 
  final listenConection = ConnectionStatusSingleton.getInstance();
  final _materialsuspensionirListController = BehaviorSubject<MaterialSuspensionIRModelIR>();
