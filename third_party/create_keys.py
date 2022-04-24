
import os
import dotenv
from pathlib import Path
from aea.crypto.registries import make_crypto

DEFAULT_LEDGER = "ethereum"
N_KEYS = 4

this_path = Path(__file__).absolute()
env_file = this_path.parent / ".env"
if not env_file.exists():
    with open(str(env_file), "w") as f:
        pass

dotenv_file = dotenv.find_dotenv()
dotenv.load_dotenv(dotenv_file)

for i in range(N_KEYS):
    key = make_crypto(DEFAULT_LEDGER)
    env_key = f"AEA_{i}_PRIVATE_KEY"
    os.environ[env_key] = key.private_key
    dotenv.set_key(dotenv_file, env_key, os.environ[env_key])
