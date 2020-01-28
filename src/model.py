import os

class Model:
    path = ''
    data = {}
    modelName = ''

    def __init__(self, r, p):
        self.data = r
        self.path = p
        self.generator()

    def typed (self, t):
        if t =='Long':
            result = 'int'
        elif t == 'Instant' or t == 'ZonedDateTime':
            result = 'DateTime'
        elif t == 'Double' or t == 'BigDecimal':
            result = 'Double'
        elif t == 'Boolean':
            result = 'bool'
        else:
            result = t
        return result

    def validator (self, t):
        result = t
        return result

    def generator(self):
        self.modelName = self.data['name'] + 'Model'
        fields =  self.data['fields']
        if not os.path.exists(self.path + 'output/'):
            os.makedirs(self.path + 'output/')
        with open(self.path + 'output/' + self.data.get('name', '') + 'IR.model.dart', 'w+') as f:
            f.write('class ' + self.modelName + 'ModelIR with ModsimORM implements ModsimModel { \r\n')
            for i in fields:
                f.write('  ' + self.typed(i['fieldType']) + ' ' + i['fieldName'] + ';\r')
            f.write('\r  ' + self.data['name'] + 'Model({\r' )
            for i in fields:
                f.write('    this.' + i['fieldName'] + ',\r')
            f.write('  });\r' )
            f.write('''
  @override
  %s fromJSON(Map<String, dynamic> json) => %s(
''' % (self.modelName, self.modelName))
            for i in fields:
                f.write('    %s: json[%s],\r' % (i['fieldName'], i['fieldName']))
            f.write('  );\r')
            f.write('''
  @override
  Map<String, dynamic> toJSON() => {
''')
            for i in fields:
                f.write('    "%s": %s,\r' % (i['fieldName'], self.validator(i['fieldName'])))
            f.write('  };\r')
            f.write('''
  @override
  %s fromSqlite(Map<String, dynamic> json) => %s(
''' % (self.modelName, self.modelName))
            for i in fields:
                f.write('    %s: json[%s],\r' % (i['fieldName'], i['fieldName']))
            f.write('  );\r')
            f.write('''
  @override
  Map<String, dynamic> toSqlite() => {
''')
            for i in fields:
                f.write('    "%s": %s,\r' % (i['fieldName'], self.validator(i['fieldName'])))
            f.write('  };\r')
            f.write('''
  save() async{
    await initDatabase();
    ResponseDB r;
    if(this.id == 0 || this.id == null){
        this.id = null;
        r = await add('%s', this);
    } else {
        r = await update('%s', this);
    }
    return r;
  }
}
''' % (self.data['name'], self.data['name']))