import sqlite3
import PySimpleGUI as sg
from datetime import datetime
from parda_db import connector, cursor
from typing import Any

sg.theme("dark")
sg.set_options(font="ariel 20")

def get_items_list(
        connector: sqlite3.Connection = connector,
        cursor: sqlite3.Cursor = cursor,
    ) -> list[Any]:
    with connector:
        cursor.execute("SELECT * FROM products")
        products_list = cursor.fetchall()
    return products_list

main_layout = [
    [
        sg.Button("Sell your stuff", key="-SELL-", size=15),
        sg.Button("Check all sales", key="-SALES-", size=15),
    ],
    [
        sg.Button("Sold items list", key="-RECENTLY-", size=20),
    ],
    [
        sg.Button("Exit", key="-EXIT-", size=20)
    ],
]

main_window = sg.Window(
    "PROPER SHOPPER SHOP FOR SHOPPING",
    main_layout,
    element_justification="center",
    element_padding=10,
    finalize=True
)

def input_order(connector: sqlite3.Connection, cursor: sqlite3.Cursor):
    print("Time to add your item for sale.")
    first_name = input("Your First name: ")
    last_name = input("Your Last name: ")
    item_name = input("Item name you are selling: ")
    price = input("How much you want to get for the item: ")
    quantity = input("Quantity: ")
    cursor.execute("INSERT INTO customer (first_name, last_name)"
                    "VALUES (?, ?)", (first_name, last_name))
    cursor.execute("INSERT INTO products (item_name, price)"
                   "VALUES (?, ?)", (item_name, price))
    cursor.execute("INSERT INTO bill_line (quantity)"
                   "VALUES (?)", (quantity))
    connector.commit()
    print("Item added for the whole world to see!")

def show_items(main_window: sg.Window):
    main_window.hide()
    products_list = get_items_list()
    show_items_list = [(product[1], product[2]) for product in products_list]
    layout = [
        [sg.Table(show_items_list, key="-ITEMS-LIST-",
                    headings=["Product name", "Price"],   
                  ), sg.Button("Select", key="-SELECT-", size=6)],
        [
            sg.Text("Search", size=8),sg.Push(),sg.I(size=15, tooltip="Search a product by name", key="-SEARCH-", enable_events=True),sg.Push(),
        ],
        [
            sg.Button("Return", key="-RETURN-", size=10),
        ]
    ]
    window = sg.Window(
        "Available Items For Sale",
        layout,
        element_padding=5,
        size=(600, 500),
        resizable=True,
        element_justification="left",
        finalize=True
    )
    while True:
        event, values = window.read()
        if event in [sg.WIN_CLOSED, "-RETURN-"]:
            break
        if event == "-SEARCH-":
            result_list = find_by(values.get("-SEARCH-", ""))
            window["-ITEMS-LIST-"].update(values=result_list)
    window.close()
    main_window.un_hide()

def find_by(values):
        with connector:
            cursor.execute(f"SELECT * FROM products WHERE item_name LIKE '%{values}%';")
            search_list = cursor.fetchall()

            result_list = [(product[1], product[2]) for product in search_list]
            connector.commit()
            print("Found items:", result_list)  # Print for debugging
            return result_list

while True:
    event, values = main_window.read(timeout=0.1)
    if event in [sg.WIN_CLOSED, "-EXIT-"]:
        break
    if event == "-SELL-":
        input_order(main_window, connector, cursor)
    if event == "-SALES-":
        show_items(main_window)
    if event == "-RECENTLY-":
        pass
connector.close()