# Viewing Files

There are many different ways to view the contents of files from the command line.

cat   - conCATentate the file to the terminal
less  - interactively scroll through a file, useful when the file is large
head  - show the first lines of a file
tail  - show the last lines of a file

## Exercise

1) cd to ~/ws/ceiling-zero/week_5_code
2) use "head" to inspect the first few rows of kc_house_data.csv
3) use "sort" and "head"/"tail" to find the most and least expensive houses listed
    ! remember to change the delimiter to a comma
    ! The data has a bug, try showing the first 1500 cheapest houses

(grep -v)


# Text editors

The command line also has some of the best text editors.  Covering them is way beyond the scope 

nano
- MUCH easier to use, start here

vim
- do a demo
    - visual changes    ls -l 
    - macros            use a macro to fix kc price data
    - moving around HLM, $^, f
- my favorite
- expect frustration at the beginning
- doesn't naturally have all the nice integrations that vs code

emacs
- an operating system where everything in connectable