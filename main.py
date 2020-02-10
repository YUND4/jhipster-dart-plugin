from src.read import Reader
from src.model import Model
from src.migration import Migration
from datetime import datetime

from src.bloc import Bloc
import json
def typed (t):
    try:
        format = '%Y-%m-%dT%H:%M:%SZ'
        t = datetime.strptime(t, format)
    except:
        pass
    if type(t) is int:
        result = 'Integer'
    elif type(t) is datetime:
        result = 'Instant'
    elif type(t) is float:
        result = 'Double'
    elif type(t) is bool:
        result = 'Boolean'
    elif type(t) is str:
        result = 'String'
    else:
        result = ''
    return result

def repair(d, p):
    _dict = {
        'name':'Entity',
        'fields': []
    }
    for key in d:
        _dict['fields'].append({
            'fieldName': key,
            'fieldType': typed(d[key])
        })
    with open(p, 'w+') as f:
        json.dump(_dict, f, ensure_ascii=False, indent=2)

if __name__ == "__main__":
    r = Reader()
    try:
        Model(r.data, r.path)
        Migration(r.data, r.path)
        Bloc(r.data, r.path)
    except:
        repair(r.data, r.total_path)
