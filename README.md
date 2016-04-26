# multimodal-transport-nodes
Generates a list of locations that are likely to be start/stop nodes in a multimodal transport scheme

Just execute the script for the country of you choice.

It will:
 1. Download raw OSM and Geonames files
 2. Download required tools (osmfilter and osmconvert)
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
