import sqlite3

connector = sqlite3.connect('parda.db')
cursor = connector.cursor()

query = '''
CREATE TABLE IF NOT EXISTS products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(40),
    price DECIMAL(6, 2)
);
'''

cursor.execute(query)
connector.commit()
