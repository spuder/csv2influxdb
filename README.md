csv2influxdb
============

Converts a CSV file into json for influxdb

# Usage

Takes 3 parameters

 - database name
 - Input file (csv)
 - Output file (json
 
    csv2influxdb foo example.csv bar.json
    
# What it does

Takes a csv:

"year","internet_explorer_usage","murders_per_capita"
2004,67,60
2005,51,55
2006,42,45

Outputs json with the 3 keys needed by influx (name,columns,points)


    {"name":"murders","columns":["year","internet_explorer_usage","murders_per_capita"],"points":[["2004","67","60"],["2005","51","55"],["2006","42","45"]]}

Or a pretty option

```
{
    "name": "murders",
    "columns": [
        "year",
        "internet_explorer_usage",
        "murders_per_capita"
    ],
    "points": [
        [
            "2004",
            "67",
            "60"
        ],
        [
            "2005",
            "51",
            "55"
        ],
        [
            "2006",
            "42",
            "45"
        ]
    ]
}
```

# Why
