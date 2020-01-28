class JobModelBlocIR with Validators implements BlocBase { 
  final listenConection = ConnectionStatusSingleton.getInstance();
  final _jobListController = BehaviorSubject<JobModel>();
  final _idController = BehaviorSubject<int>();
  final _jobTitleController = BehaviorSubject<String>;
  final _minSalaryController = BehaviorSubject<int>;
  final _maxSalaryController = BehaviorSubject<int>;
  final _dateController = BehaviorSubject<DateTime>;
  final _existController = BehaviorSubject<bool>;
  final _idController = BehaviorSubject<int>;
  final _idRemotoController = BehaviorSubject<int>;
  final _imagenesSyncController = BehaviorSubject<bool>;
  final _guardadoLocalController = BehaviorSubject<bool>;

  Stream<int> get idStream => _idController.stream;
  Stream<String> get jobTitleStream => _jobTitleController.stream;
  Stream<int> get minSalaryStream => _minSalaryController.stream;
  Stream<int> get maxSalaryStream => _maxSalaryController.stream;
  Stream<DateTime> get dateStream => _dateController.stream;
  Stream<bool> get existStream => _existController.stream;
  Stream<int> get idStream => _idController.stream;
  Stream<int> get idRemotoStream => _idRemotoController.stream;
  Stream<bool> get imagenesSyncStream => _imagenesSyncController.stream;
  Stream<bool> get guardadoLocalStream => _guardadoLocalController.stream;
  Stream<dynamic> get formValidStream => Observable.combineLatest([
    jobTitleStream,
    minSalaryStream,
    maxSalaryStream,
    dateStream,
    existStream,
    idStream,
    idRemotoStream,
    imagenesSyncStream,
    guardadoLocalStream
  ], (a) => a);
Function(ReconexionModelo) get reconexionSink => _reconexionListController.sink.add;
  Function(String) get jobTitleSink => _jobTitleController.sink.add;
  Function(int) get minSalarySink => _minSalaryController.sink.add;
  Function(int) get maxSalarySink => _maxSalaryController.sink.add;
  Function(DateTime) get dateSink => _dateController.sink.add;
  Function(bool) get existSink => _existController.sink.add;
  Function(int) get idSink => _idController.sink.add;
  Function(int) get idRemotoSink => _idRemotoController.sink.add;
  Function(bool) get imagenesSyncSink => _imagenesSyncController.sink.add;
  Function(bool) get guardadoLocalSink => _guardadoLocalController.sink.add;
