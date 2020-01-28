class JobBlocIR with Validators implements BlocBase { 
  final listenConection = ConnectionStatusSingleton.getInstance();
  final _jobListController = BehaviorSubject<JobModelIR>();
  final _idController = BehaviorSubject<int>();
  final _jobTitleController = BehaviorSubject<String>;
  final _minSalaryController = BehaviorSubject<int>;
  final _maxSalaryController = BehaviorSubject<int>;
  final _dateController = BehaviorSubject<DateTime>;
  final _existController = BehaviorSubject<bool>;

  Stream<int> get idStream => _idController.stream;
  Stream<String> get jobTitleStream => _jobTitleController.stream;
  Stream<int> get minSalaryStream => _minSalaryController.stream;
  Stream<int> get maxSalaryStream => _maxSalaryController.stream;
  Stream<DateTime> get dateStream => _dateController.stream;
  Stream<bool> get existStream => _existController.stream;
  Stream<dynamic> get formValidStream => Observable.combineLatest([
    jobTitleStream,
    minSalaryStream,
    maxSalaryStream,
    dateStream,
    existStream
  ], (a) => a);

  Function(JobModelIR) get reconexionSink => _jobListController.sink.add;
  Function(String) get jobTitleSink => _jobTitleController.sink.add;
  Function(int) get minSalarySink => _minSalaryController.sink.add;
  Function(int) get maxSalarySink => _maxSalaryController.sink.add;
  Function(DateTime) get dateSink => _dateController.sink.add;
  Function(bool) get existSink => _existController.sink.add;

  JobModelIR get reconexionModeloValue => _jobListController.value;
  int get idValue => _idController.value;
  String get jobTitleValue => _jobTitleController.value;
  int get minSalaryValue => _minSalaryController.value;
  int get maxSalaryValue => _maxSalaryController.value;
  DateTime get dateValue => _dateController.value;
  bool get existValue => _existController.value;

