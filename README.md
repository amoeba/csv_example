# recursive CSV parsing example

An example showing how you might do something with a set of CSV files in a single batch.

In this example, we have a series of bested subfolders, each containing one or more CSVs:

```
data
├── processed
│   └── processed.csv
├── raw.csv
└── results
    ├── a.csv
    ├── b.csv
    └── c.csv
```

## How to run this

- `git clone ...` it
- `cd` into the cloned folder or open the .RProj inside of it
- Run `process.R`