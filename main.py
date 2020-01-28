from src.read import Reader
from src.model import Model
from src.bloc import Bloc

if __name__ == "__main__":
    r = Reader()
    Model(r.data, r.path)
    Bloc(r.data, r.path)