#!/bin/env bash

curl -s -o data/asteroids.csv -G 'https://query.wikidata.org/sparql' \
    --header "Accept: text/csv"  \
    --data-urlencode query='
        SELECT
            ?asteroidLabel
            ?discovered
            ?discovererLabel
        WHERE {
            ?asteroid wdt:P31 wd:Q3863;  # Retrieve instances of "asteroid"
                        wdt:P61 ?discoverer; # Retrieve discoverer of the asteroid
                        wdt:P575 ?discovered; # Retrieve discovered date of the asteroid
            SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
        }
        ORDER BY DESC(?discovered)
    '
