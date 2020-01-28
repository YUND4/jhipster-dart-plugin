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
        if (t =='Long'):
            result = 'INTEGER'
        elif  (t =='String'):
            result = 'TEXT'
        elif  (t =='String'):
            result = 'TEXT'
        elif  (t =='Instant'):
            result = 'TIMESTAMP'
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
            for i in fields:
                f.write('    '  + i['fieldName'] +' ' + self.typed(i['fieldType']) + ' ' + ',\r')

            """ SET PROPERTIES STATIC  """
            f.write('   id  INTEGER '          + ',\r')
            f.write('   idRemoto  INTEGER'     + ',\r')
            f.write('   imagenesSync BOOLEAN'  + ',\r')

            """ END PROPERTIES STATIC  """
            
            f.write('  );\r' )
