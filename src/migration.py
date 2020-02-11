import os
import time


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

        print(time.time().__int__())

        with open(self.path + 'output/migrations/'+str(time.time().__int__())+'_table_' + self.data.get('name', '').lower() + '.sql', 'w+') as f:

            f.write('CREATE TABLE ' + self.modelName + ' ( \n')

            """ SET PROPERTIES STATIC  """

            f.write('    id INTEGER PRIMARY KEY'    + ',\r')

            """ END PROPERTIES STATIC  """

            for i in fields:
                if i['fieldName'] == 'id':
                    pass
                else:
                    f.write('    '  + i['fieldName'] +' ' + self.typed(i['fieldType']) + ',\r')

            f.write('  );\r' )
