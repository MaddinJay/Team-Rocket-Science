# Übersicht Time-Tracking Martin Jonen

Woche Status

KW 
=======
# Overview
## Martin
Folgende Tabelle wird durch Christian und Damir gepflegt...
| **Weeks**  | #1   | #2 | #3 | #4 | #5 | #6 | #7 | #8 | done  |
|------------|------|----|----|----|----|----|----|----|---|
| **Status** | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |  |   |

**Arbeitswochen Martin:**
KW22, KW23, KW29, KW30, KW31, KW32, KW33, KW34


# Week 1

Aufgrund der Abwesenheit von Mateusz habe ich mit einer ersten Lösungsvisualisierung begonnen. Als eigenständig umzusetzende Komponente habe ich den Notes-Tree identifiziert und mit der Idee des "Walking Skeleton" eine erste Integration der Tree-Klasse in den Report (Anbindung an die GUI) vorgenommen. Meine Arbeitsschritt habe ich in MIRO festgehalten: https://miro.com/app/board/uXjVOv1kS4Q=/?share_link_id=131633058163 (no password required)

# Week 2

## Session 1

Upload erfolgt der Source-Änderungen. Arbeitsschritte sind in MIRO dokumentiert.

## Session 2

Einarbeitung der Issues von Damir. Nach Input von Damir Fokus auf Domain Modell gewechselt. 

## Session 3

Skizzierung Walking Skeleton. Slicing in "Adapter Note inkl. DAO"

# Week 3

Ich habe mit dem Slicing weitergemacht. Da ich weiterhin kein SAP System zur Verfügung habe, beschäftige ich mich vorerst mit der Modellierung und dem Design und versuche, dass Slicing konsequenter zu berücksichtigen. 
Mit dem Überblick, wie die Domain ausschauen könnte, mache ich mich nun an die Programmierung eines Prototyps, um die Integration der Domain in das MVC-Konstrukt zu prüfen und um dem Kunden eine erste Ansicht bieten zu können.
Der Prototyp ist noch nicht abgeschlossen. Es fehlt noch die Integration des Trees.

# Week 4
Ich arbeite weiter am Prototyp und der Integration des MVC Patterns. Ziel der Woche ist es, einen Prototyp mit Baumhierarchy und Anzeige des Titels und den Body-Texts eines Knoten zu visualisieren.
Die Visualisierung des "ALV Trees" wurde auf die Klasse cl_gui_simple_tree geändert. Deep Dive in den Simple Tree hat letzendlich zur Visualisierung des Trees geführt. Das Ziel der Visualisierung einer Notiz im Subview auf der rechten Seite konnte nicht umgesetzt werden. Stattdessen wurde die Paketstruktur und die Klassenarchitektur durch Änderung des Namings und Refactorings gesäubert. 

# Week 5
Highlights:
- Einführung Storyboard -> https://www.figma.com/file/Iy0EHwWdhtNeszybt7sknW/Project-Zettelchen-Wirtschaft?node-id=3%3A50
- Wechsel von Visualisierungstool MIRO auf FIGMA
- Metriken eingeführt in Storyboard
- Test Coverage eingeführt in Storyboard
- Einbindung Handler in GUI Tree Class für Absprung von Note in "Subscreen"
- Einbindung ABAPLint für CodeInspector and Metric Messung

# Week 6
Goals:
- Integration DB: Get/set DB inkl. Data in DB ← Mock Data
- Überarbeitung der Types-Interfaces
- ABAPLint: Zero Errors
- Einführung CRC Cards

Highlights:
- DB Table integriert und Filled with Dummy Values
- DB Table Read in Notes-Lists Klasse integriert
- Refactoring Notes List Class: Handling der Relations in View-Class ausgelagert (Nicht Domain relevant)
- Refactoring View Class: Geänderte Zugriff aug Note Objekte
- Einführung Type-Interfaces für Domaine Note und Tree View

# Week 7
Goals:
- Refactoring Domain Logik: Integriere Types Interfaces, Refactoring Communication zwischen Classes
- Subscreen Integration zur Visualisierung von Note Informationen
- Walking Skeleton abschliessen: Double Click -> Subscreen -> Change -> Save -> Reopen
- ABAPLint Messages bereinigen


Highlights:
- Einführung Types Intrefaces
- Refactoring Communication Notes Classes
- Erarbeitung Deep Dive Integration von Notes Informationen in Container in Main Screen
- Subscreen Integration zur Visualisierung von Note Informationen
- ABAPLint Messages bereinigt
- Visualisierung Metrics
