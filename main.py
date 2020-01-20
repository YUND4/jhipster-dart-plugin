from src.read import Reader
from src.model import Model

if __name__ == "__main__":
    r = Reader()
    Model(r.data, r.path)