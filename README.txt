Pilztaker
=========

Compiling
---------
This requires a built of undertaker.
Copy the folder into the undertaker folder. It should look something like this:
undertaker/
	|-...
	|- picosat
	|- pilztaker
	|- python
	|- ...
	|- undertaker
	`- ...

make must have been execute at least once (i.e. the *.o files in
undertaker/undertaker/ must be present).
Move into undertaker/pilztaker and execute: make
It should output the exe "pilztaker".

Running
-------
Modify run.sh:
- 'base' variable points to the base directory of the linux kernel tree;
   must end with /
- 'csvFile' variable points to the output file

Run run.sh from the pilztaker directory. Progress is printed to stderr.

Alternatively, call ./pilztaker executable directly. First command
line argument is the base bath of the Linux kernel tree (must end with /).
The following command line arguments are the files to be parsed, relative
to the base path.
Result is printed to stdout.
Progress is printed to stderr.

Output
------
The output is a CSV file in the format:

  filename;line;type;indentation;starting if;condition;normalized condition

- filename: The filename of the source file parsed; relative to the base directory
- line: The line in the file that the preprocessor directive starts
- type: The type of the directive; either if, elsif or else;
        ifndef, ifdef, etc. are translated into if
- indentation: The number of blocks that this block is enclosed in
- starting if: For elseif and else: the line number of the corresponding if
- condition: The condition as read from the source file; defined(), ifndef, etc. are converted;
             empy for else blocks.
- normalized condition: "The above condition brought into context"
  - if blocks have just the 'condition'
  - else blocks have the 'condition's of all corresponding ifs and elseifs negated and AND'd together
  - elseif blocks have the 'condition's of all corresponding ifs and elseifs above the current one
    negated and AND'd together, and the 'condition'
  - The result of these are AND'd with the conditions of all enclosing blocks

