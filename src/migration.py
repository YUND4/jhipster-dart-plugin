import os


class Migration:
    path = ''
    data = {}
    modelName = ''

    def __init__(self, r, p):
        self.data = r
        self.path = p
        self.generator()

    def typed (self, t):
        if (t =='Long' or t=='Integer'):
            result = 'INTEGER'
        elif  (t =='String'):
            result = 'TEXT'
        elif  (t =='String'):
            result = 'TEXT'
        elif t == 'ZonedDateTime' or t=='DateTime' or t=='LocalDate':
            result = 'TIMESTAMP'
        elif t == 'Instant':
            result = 'DATE'
        elif t == 'Double' or t == 'BigDecimal':
            result = 'REAL'
        elif t == 'Boolean' or 'bool':
            result = 'BOOLEAN'
        else:
            result = t
        return result

    def generator(self):
        self.modelName = self.data['name']
        fields =  self.data['fields']
        if not os.path.exists(self.path + 'output/migrations'):
            os.makedirs(self.path + 'output/migrations')
        
        with open(self.path + 'output/migrations\\' + self.data.get('name', '') + '.sql', 'w+') as f:
            
            f.write('CREATE TABLE ' + self.modelName + ' ( \n')

            """ SET PROPERTIES STATIC  """

            f.write('    id  INTEGER PRIMARY KEY'    + ',\r')
            f.write('    idRemoto  INTEGER'          + ',\r')
            f.write('    imagenesSync BOOLEAN'       + ',\r')

            """ END PROPERTIES STATIC  """

            for i in fields:
                f.write('    '  + i['fieldName'] +' ' + self.typed(i['fieldType']) + ' ' + ',\r')

            f.write('  );\r' )
