class migration:
    path = ''
    data = {}

    def __init__(self, r, p):
        self.data = r
        self.path = p
        self.generator()

    def generator(self):
        if not os.path.exists(self.path + 'output\\'):
            os.makedirs(self.path + 'output\\')
        with open(self.path + 'output\\' + self.data.get('name', '') + '.sql', 'w+') as f:
            for i in range(10):
                f.write("This is line %d\r\n" % (i+1))