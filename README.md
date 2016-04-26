# multimodal-transport-nodes
Generates a list of locations that are likely to be start/stop nodes in a multimodal transport scheme

Data is based on [OpenStreetMaps](OpenStreetMaps.org) and [Geonames](Geonames.org).

Please check their websites for usage and licensing rules.

Prerequisits:
 
 The scripts are made to run on linux systems.
 
 You need some required packages that can be installed on ubuntu with the following command:
  
    sudo apt-get install wget build-essential zlib1g-dev
 

Now you can execute the script for the country of you choice.

It will:
 1. Download raw OSM and Geonames files
 2. Download required osm tools and build them (osmfilter and osmconvert)
 3. Convert and filter the raw source files
 4. Clean everything up
 5. Leave you with tab separated text files for further usage

The files contain at least geocoordinates and names for:
  1. RailStations
  2. RailStops
  3. BusStops
  4. Addresses (without Numbers)
  5. Streets
  6. Towns
  
Example usage:

    git clone https://github.com/forgemo/multimodal-transport-nodes.git
    cd multimodal-transport-nodes
    chmod +x germany.sh
    ./germany.sh

The result will be a "mmtn-germany" folder with the generated files.
