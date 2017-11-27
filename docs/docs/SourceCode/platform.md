* **0x01. Global Variable Definitions.**
========================================

Detect OS type, GUI environment and set the base variables, this vim resource file
support platform can be described bellow. For practical reason, currently, servircommon platform:




Former design to identify os types.
-----------------------------------

+-----------+-----------+------------+------------+---------+
|           | isWindows | isMsys     | isMac      | isLinux |
+-----------+-----------+------------+------------+---------+
| isGUI     |   usual   |  ---       | occasional |  usual  |
+-----------+-----------+------------+------------+---------+
| isConsole |   rare    | occasional | usual      |  hot    |
+-----------+-----------+------------+------------+---------+
    _tab1-1:supported platforms_



New design to identify more and get it more clear
-------------------------------------------------










<!--
vim:nocp:cin:sr:et:ts=4:sts=4:sw=4:ft=markdown.pandoc:ff=unix:fenc=utf-8:
EOF
-->
