import pathlib
import json

class Reader:
    path = pathlib.Path(__file__).parent.absolute().__str__()[:-3]
    data = {}

    def __init__(self):
        with open(self.path + 'models/Job.json') as f:
            self.data = json.load(f)