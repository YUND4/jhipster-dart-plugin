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

    def validator (self, t, typo, tosqlite = False, fromsqlite = False):
        typo = self.typed(typo)
        result = t
        if (typo == "DateTime") :
            result = t + ' is ' + typo + ' ? "${' + t + '.year.toString().padLeft(4, ' + "'0" + "'" + ')}-${' + t + '.month.toString().padLeft(2, ' + "'0" + "'" + ')}-${' + t + '.day.toString().padLeft(2, ' + "'0" + "'" + ')}T${' + t + '.hour.toString().padLeft(2, ' + "'0" + "'" + ')}:${' + t + '.minute.toString().padLeft(2, ' + "'0" + "'" + ')}:${' + t + '.second.toString().padLeft(2, ' + "'0" + "'" + ')}-05:00" : null'

        if (typo == "bool" and tosqlite):
            result = t + ' == true ? 1 : 0'

        if (fromsqlite) :
            result = ""
        if (typo == "DateTime" and fromsqlite):
            result = ' is String ? DateTime.parse(json["' + t + '"]) : json["' + t + '"]'
        if (typo == "bool" and fromsqlite):
            result = ' || json["' + t + '"] == 0 ? false : true'

        return result

    def generator(self):
        self.modelName = self.data['name'] + 'ModelIR'
        fields =  self.data['fields']
        fields.append({
            "fieldName":"idRemoto",
            "fieldType":"Integer"
        })
        fields.append({
            "fieldName":"imagenesSync",
            "fieldType":"Boolean"
        })
        if not os.path.exists(self.path + 'output/'):
            os.makedirs(self.path + 'output/')
        with open(self.path + 'output/' + self.data.get('name', '') + '.model.dart', 'w+') as f:
            f.write('class ' + self.modelName + ' with ModsimORM implements ModsimModel { \r\n')
            for i in fields:
                f.write('  ' + self.typed(i['fieldType']) + ' ' + i['fieldName'] + ';\r')
            f.write('\r  ' + self.modelName + '({\r' )
            for i in fields:
                f.write('    this.' + i['fieldName'] + ',\r')
            f.write('  });\r' )
            f.write('''

  @override
  int employeeId;

  @override
  bool hasChanges;

  @override
  DateTime movilToWeb;

  @override
  DateTime webToMovil;


  @override
  %s fromJSON(Map<String, dynamic> json) => %s(
''' % (self.modelName, self.modelName))
            for i in fields:
                f.write('    %s: json["%s"],\r' % (i['fieldName'], i['fieldName']))
            f.write('  );\r')
            f.write('''
  @override
  Map<String, dynamic> toJSON() => {
''')
            for i in fields:
                f.write('    "%s": %s,\r' % (i['fieldName'], self.validator(i['fieldName'], i['fieldType'])))
            f.write('  };\r')
            f.write('''
  @override
  %s fromSqlite(Map<String, dynamic> json) => %s(
''' % (self.modelName, self.modelName))
            for i in fields:
                f.write('    %s: json["%s"] %s,\r' % (i['fieldName'], i['fieldName'], self.validator(i['fieldName'], i['fieldType'], False, True)))
            f.write('  );\r')
            f.write('''
  @override
  Map<String, dynamic> toSqlite() => {
''')
            for i in fields:
                f.write('    "%s": %s,\r' % (i['fieldName'], self.validator(i['fieldName'], i['fieldType'], True)))
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