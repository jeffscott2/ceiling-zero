# Loops

bash has loops similar to python's.

While python uses indendation to mark what should be repeated, 
bash uses DO and DONE to mark the start and end of the loop.

```
----------------------------------------------------------------------------
for f in A B C; do
    echo "variable f has value: ${f}"
done
----------------------------------------------------------------------------
```

Note: 
    - A B C are space-separated-variables.  Bash's preferred separator.
    - We're using variables in a string, like python's formatted-string

Where things start to get nice is that you can loop over the *result* of a command:

```
----------------------------------------------------------------------------
cd week_5_code/data
for f in `ls`; do
    echo "variable f has value: ${f}"
done
----------------------------------------------------------------------------
```

And you can run any command in the loop that bash supports.

```
----------------------------------------------------------------------------
cd week_5_code/data
for f in `ls`; do
    new_file="jeff_$f"
    command="cp ${f} ${new_file}"
    echo ${command} | /bin/bash
done
----------------------------------------------------------------------------
```

# Exercise

The value in the loop sometimes gets suprising values, lets take a look when that can happen

1) cd to week_5_code/data
2) run "ls" and "ls -l" 
    If we loop over the results of each, 
    what do you think the variable will get set to in each result set?
3) Let's test it, implement the loop do display the loop variable:

for f in `ls`; do
    echo "variable f has value: ${f}"
done

4) Compare vs running the loop with "ls -l"
 