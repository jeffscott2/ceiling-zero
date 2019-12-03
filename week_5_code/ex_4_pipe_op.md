# Pipe Operator: |

As we say the sort command can work on files, as most terminal commands can.

The real power is that we can hook the output of one command up to the input of another.

```
----------------------------------------------------------------------------
sort sort_spaces.csv

# Can also be written:

# just shows the file as is
cat sort_spaces.csv         

# just loads the file as is, then sorts
cat sort_spaces.csv | sort

# We'll cover grep in a minute, but just know it's a program that can filter
cat sort_spaces.csv
cat sort_spaces.csv | grep "e"
cat sort_spaces.csv | grep "e" | sort

# Here we've loaded the file, then filtered to just rows with the letter "e", then sorted the output
----------------------------------------------------------------------------
```

## Exercise

1) change directory into week_5_code
2) Use "cat" to look at the kc_house_data.csv file
3) Use "grep" to find how many houses are listed at an even multiple of $1000 (ie search for "000")
4) Use "wc" to count how many houses grep returned

tldr grep
tldr wc

# Redirect To File Operator:   >

If you'd like to save the result of a command (or chain of commands) to a file you can use > to do so.

cat sort_spaces.csv | grep "e" | sort > sorted_spaces_e.csv

Won't return anything, because the output has created the file "sorted_spaces_e.csv"

You can then view the result using "cat"

cat sorted_spaces_e.csv


## Exercise

1) List the contents of the week_5_code directory
2) Save the list of files to "ls_output.txt" where each line has one file:
    bootcamp_datasci.txt
    bootcamp.R
    cli_installs.md
    ....



# Reuse the last parameter:  !$

It would be annoying and error prone to type out the filename twice.

The terminal provides the shortcut !$ to reference the last parameter of the last command

So if we reran

cat sort_spaces.csv | grep "e" | sort > sorted_spaces_e.csv
cat !$

would expand to 

cat sorted_spaces_e.csv

## Rerun the last command:   !!

Similar to the last parameter, !! runs the last command.  It's less useful, but sometimes helpful.

Pressing up in the terminal also brings up the previous command.