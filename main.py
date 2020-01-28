from src.read import Reader
from src.model import Model
from src.migration import Migration


if __name__ == "__main__":
    r = Reader()
    Model(r.data, r.path)
    Migration(r.data, r.path)