#! /bin/bash

# Delete last directory and create new one
rm -rf mmtn_germany
mkdir mmtn_germany
cd mmtn_germany

# Download and build latest osm tools
wget -O - http://m.m.i24.cc/osmfilter.c | cc -x c - -O3 -o osmfilter
wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
 
# Make osm tools executable
chmod +x osmconvert
chmod +x osmfilter

# Download latest osm file
wget http://download.geofabrik.de/europe/germany-latest.osm.pbf

# Convert pbf to o5m and delete pbf
./osmconvert germany-latest.osm.pbf -o=germany-latest.osm.o5m
rm germany-latest.osm.pbf

# Filter all nodes that are potential start/stop nodes in a multimodal transport scheme
# Contains: Rail-Stations, Rail-Stops, Bus-Stops, Tram-Stops, Addresses and Streets where people live
# Note: Streets have a random coordinate along the street
./osmfilter germany-latest.osm.o5m --keep=" ( addr:street and addr:city ) or ( ( ( public_transport=stop_position and bus=yes ) or  railway=station or railway=halt or rail_way=tram_stop or highway=residential or highway=living_street or highway=pedestrian or highway=footway ) and name=  ) " --ignore-dependencies | ./osmconvert - --all-to-nodes --csv="@id @lon @lat name addr:street addr:city public_transport bus railway highway" -o=mmtn_germany.csv

# Remove o5m file
rm germany-latest.osm.o5m

# Download geonames
wget http://download.geonames.org/export/dump/DE.zip
unzip DE.zip 

# Filter entries with featurecode ADM4 (Correspond to towns)
grep $'\tADM4\t' DE.txt > towns.csv

# Cleanup geonames files
rm DE.txt DE.zip readme.txt

# Remove osm tools
rm osmconvert osmfilter

# TODO: Merge towns.csv into mmtn_germany.csv

cd ..

echo "-------------------------------------------------"
echo "| Fetched data from:     |"
echo "| \tGeonames file from geonames.org             |"
echo "| \tOSM-File from download.geofabrik.de         |"
echo "| Please check their usage and licensing rules. |"
echo "-------------------------------------------------"







