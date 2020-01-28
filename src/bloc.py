import os

class Bloc:
    path = ''
    data = {}
    modelName = ''

    def __init__(self, r, p):
        self.data = r
        self.path = p
        self.generator()

    def typed (self, t):
        if t =='Long' or t == 'Integer':
            result = 'int'
        elif t == 'Instant' or t == 'ZonedDateTime':
            result = 'DateTime'
        elif t == 'Double' or t == 'BigDecimal':
            result = 'double'
        elif t == 'Boolean':
            result = 'bool'
        else:
            result = t
        return result

    def validator (self, t):
        result = t
        return result

    def generator(self):
        self.modelName = self.data['name'] + 'ModelIR'
        fields =  self.data['fields']
        if not os.path.exists(self.path + 'output/'):
            os.makedirs(self.path + 'output/')
        with open(self.path + 'output/' + self.data.get('name', '') + 'IR.bloc.dart', 'w+') as f:
            f.write('class ' + self.data['name'] + 'BlocIR with Validators implements BlocBase { \r\n')
            f.write('  final listenConection = ConnectionStatusSingleton.getInstance();\r\n')
            f.write('  final _' + self.data['name'].lower() + 'ListController = BehaviorSubject<' + self.modelName + '>();\r')
            for i in fields:
                f.write('  final _' + i['fieldName'] + 'Controller = BehaviorSubject<' + self.typed(i['fieldType']) + '>();\r')
            f.write('\r')
            for i in fields:
                f.write('  Stream<' + self.typed(i['fieldType']) + '> get ' + i['fieldName'] + 'Stream => _' + i['fieldName'] + 'Controller.stream;\r')
            f.write('  Stream<dynamic> get formValidStream => Observable.combineLatest([\r')
            for i in fields:
                if fields[-1] == i:
                    f.write('    ' + i['fieldName'] + 'Stream\r')
                else:
                    f.write('    ' + i['fieldName'] + 'Stream,\r')
            f.write('  ], (a) => a);\r\n')
            f.write('\r')
            f.write('  Function(' + self.modelName + ') get reconexionSink => _' + self.data['name'].lower() + 'ListController.sink.add;\r')
            for i in fields:
                f.write('  Function(' + self.typed(i['fieldType']) + ') get ' + i['fieldName'] + 'Sink => _' + i['fieldName'] + 'Controller.sink.add;\r')
            f.write('\r')
            f.write('  ' + self.modelName +' get ' + self.modelName +'Value => _' + self.data['name'].lower() + 'ListController.value;\r')
            f.write('  int get idValue => _idController.value;\r')
            for i in fields:
                f.write('  ' + self.typed(i['fieldType']) + ' get ' + i['fieldName'] + 'Value => _' + i['fieldName'] + 'Controller.value;\r')
            f.write('\r')
            f.write('  void setModel(' + self.modelName +' model) {\r')
            for i in fields:
                f.write('    '  + i['fieldName'] + 'Sink(model.' + i['fieldName'] + ');\r')
            f.write('  }\r')
            f.write('\r')
            f.write('  ' + self.modelName +' getModel() {\r')
            f.write('    return ' + self.modelName +'(\r')
            for i in fields:
                if fields[-1] == i:
                    f.write('      ' + i['fieldName'] + ': ' + i['fieldName'] + 'Value\r')
                else:
                    f.write('      ' + i['fieldName'] + ': ' + i['fieldName'] + 'Value,\r')
            f.write('    );\r')
            f.write('  }\r')
            f.write('\r')
            f.write('  dispose() {\r')
            for i in fields:
                f.write('    _'  + i['fieldName'] + 'Controller?.close();\r')
            f.write('  }\r')
            f.write('}\r')
            