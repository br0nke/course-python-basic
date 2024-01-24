import PySimpleGUI as sg

layout = [
    [sg.Text("Iveskit suma")],
    [sg.Input(key="-INPUT-")],
    [sg.Text(size=(30, 1), key="-OUTPUT-")],
    [sg.Button("Accept"), sg.Button("Cancel")],
    [sg.Graph((115, 40), (0,0), (115, 40), k='-GRAPH-')],
]

window = sg.Window("Bankas GYLBOTIN", layout)

while True:
    event, values = window.read()
    if event == sg.WINDOW_CLOSED or event == "Cancel":
        break
    
window.close()