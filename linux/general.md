# Find My Public IP Address

```bash
dig +short myip.opendns.com @resolver1.opendns.com
```

# RPM

https://github.com/spiffe/spiffe-helper/tree/master/script/rpm

# Redirect both StdOut and StdErr to File

```bash
command &> logfile
```

# Search within Files Recursively

```bash
grep -rnwl '/path/to/somewhere/' -e 'pattern'
# -r or -R is recursive,
# -n is line number, and
# -w stands for match the whole word.
# -l (lower-case L) can be added to just give the file name of matching files.
# -e is the pattern used during the search
```

# Using pushd and popd Commands
```bash
# list of directories with their numeric positions
dirs -v
# moves you to the directory #2 in the stack.
cd $(dirs -l +2)
```
