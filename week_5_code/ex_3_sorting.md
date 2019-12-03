
## Sort 

Sort is a program that can read a file, and do a sql "order by" on it.  Fields in a text 
document can either be interpreted as strings or numbers, and they sort differently. 

- sort sort_spaces.csv       # takes the first field, sort alphabetically
- sort -k 2 sort_spaces.csv  # sort by the second field
- sort -n sort_spaces.csv    # sort numerically

- 

### Exercise

1) Run the Command: 

```
----------------------------------------------------------------------------
sort sort_spaces.csv
----------------------------------------------------------------------------
```

    *Does it do what you want?*

2) *Sort the file "week_5_code/sorting/sort_spaces.csv" numerically by the third field*

3) Run the Command: 

```
----------------------------------------------------------------------------
sort sort_commas.csv
----------------------------------------------------------------------------
```

    *Does it do what you want?*

By default the sort command expects space separators, so we *can't* sort by the food like this:

```
----------------------------------------------------------------------------
sort -k 1 sort_commas.csv
----------------------------------------------------------------------------
```

4) Read the sort tldr Try using the field separator parameter to change how sort sets the separator:

```
----------------------------------------------------------------------------
-t,
----------------------------------------------------------------------------
```
