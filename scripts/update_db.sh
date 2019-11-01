#!/bin/bash
: '
Author:  PH01L
Email:   phoil@osrsbox.com
Website: https://www.osrsbox.com

The primary entry script to update the osrsbox-db project after each weekly
in-game update. This script assumes the following structure:
$ tree ~
/home/phoil
├── repos
│   ├── runelite
│   ├── osrsbox-db

The repos should already be populated:
$ git clone https://github.com/runelite/runelite.git
$ git clone https://github.com/osrsbox/osrsbox-db.git

This script assumes the following packages:

- maven
- default-jdk
- python3
- git

To run:
$ pwd
/home/phoil/repos/osrsbox-db/scripts/
$ chmod u+x update_item_database.sh
$ ./update_item_database.sh

Copyright (c) 2019, PH01L

###############################################################################
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################
'

echo -e ">>> Updating item database"
cd ~/repos/osrsbox-db/items_builder
python3 builder.py --export_item=True

echo -e ">>> Updating monster database"
cd ~/repos/osrsbox-db/monsterss_builder
python3 builder.py --export_monster=True

echo -e ">>> Runing JSON population scripts..."
cd ~/repos/osrsbox-db/scripts/
python3 update_json_files.py