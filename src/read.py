import pathlib
import json

class Reader:
    path = pathlib.Path(__file__).parent.absolute().__str__()[:-3]
    data = {}
    total_path = pathlib.Path(__file__).parent.absolute().__str__()[:-3] + 'models/newModel.json'

    def __init__(self):
        with open(self.total_path) as f:
            self.data = json.load(f)