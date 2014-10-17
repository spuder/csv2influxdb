
csv2influxdb
============
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/spuder/csv2influxdb?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Converts a CSV file into JSON for [influxdb](http://influxdb.com/)

## Usage

Pass in `--help` for full options

    -d, --database      Influxdb database name (Required)
    -i, --in            CSV filename to read in
    -o, --out           JSON filename to output to 
    -p, --pretty        Output pretty formatted json
    -h, --help          Display this help message.

## Installation

    gem install csv2influxdb
    
Tested on ruby 2.0.0, if you encounter issues with older versions, please open a github issue

## What it does

Takes a csv:

|year|internet-explorer-usage|murders-per-capita|
|----|-----|----|
|2014|67|60|
|2015|51|55|
|2016|42|45|



Outputs json with influxdb table headers (name,columns,points)

```
{
    "name": "murders",
    "columns": [
        "year",
        "internet-explorer-usage",
        "murders-per-capita"
    ],
    "points": [
        [
            "2014",
            "67",
            "60"
        ],
        [
            "2015",
            "51",
            "55"
        ],
        [
            "2016",
            "42",
            "45"
        ]
    ]
}
```



## Examples




#####From CSV file, to JSON file

    csv2influxdb -d derp -i murders.csv -o /tmp/influxdb_murders.json

#####Use  stdin -> stdout
```
echo '"year","internet_explorer_usage","murders_per_capita"
2004,67,60
2005,51,55
2006,42,45' | csv2influxdb -d derp
{"name":"derp","columns":["year","internet_explorer_usage","murders_per_capita"],"points":[["2004","67","60"],["2005","51","55"],["2006","42","45"]]}
```
Obviously the stdin/stdout option won't work well for large amounts of data

#####Pretty

    csv2influxdb -p -d derp -i foo.csv -o /tmp/bar.json

Avoid using `-p` unnecessarily since it wastes network bandwidth


## Migrating Data

- Export data from your relational database to csv. 
- Use `csv2influxdb`to convert to json
- Use a tool like [influxdb-backup](https://github.com/eckardt/influxdb-backup) to import push to influxdb

## Why

There are plently of online csv to json converters, why not just use that one? 

I tried all the online converters ([this is the best one](http://www.convertcsv.com/csv-to-json.htm)), but none of them could quite convert a csv into json that was compatible with influxdb. (no column headers, no json with multiple keys)



###Legal
csv2influxdb is created by spuder, a fan of influxdb. It comes with no guarantee. It is a community project and is not supported nor afiliated with the creators of [influxdb](http://influxdb.com/).  
