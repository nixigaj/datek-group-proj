# datek-group-proj

## Requirements
- Git
- Python 3.11+
- pip

## Usage
```
git clone https://github.com/nixigaj/datek-group-proj
cd datek-group-proj
python -m venv .venv
source .venv/bin/activate  # Can be different depending on your shell
pip install -r requirements.txt
python src/gen_conn_file.py
enter database server host: example.com
enter server username: user
enter user password: 
enter database name: db
```

Then run the queries in [`src`](src) like:

```
python src/query_1.py
```
