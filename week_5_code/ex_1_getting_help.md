# Getting Help

There are two commands that give you information about other commands:

## TLDR

tldr is a newer tool that shows common uses and parameters of commands.  It's a great
introduction into tools, as well as a refresher on how they work.


```
----------------------------------------------------------------------------
% tldr pwd

pwd

Print name of current/working directory.

- Print the current directory:
    pwd

- Print the current directory, and resolve all symlinks (i.e. show the "physical" path):
    pwd -P

----------------------------------------------------------------------------
```

## Manual

The "man" command shows the full manual.  This has been the standard way
to get information about commands for decades.

```
----------------------------------------------------------------------------
man pwd
----------------------------------------------------------------------------
```

The interface is a little clunky though

q - quits
down - move down 1 line
up   - move up 1 line
control-f - move forward one page
control-b - move backward one page


## Exercise
1) Install tldr (brew install tldr) 
2) compare the results of "man ls" and "tldr ls"
    which do you find more useful?
