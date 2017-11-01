# bash_colorize_feedback
With this shell script you will be able to colorize user feedback as you will.
Feel free to add colors to the script.

## How to use

1. You clone this repo and copy the script where you want to use it.
2. Assuming we have this structure:
 
```
Project-Root
|
|--- main.sh
|--- bash-colorize-feedback.sh
|
```
You simply import the script into your `main.sh`:

```bash
# Set root dir.
readonly ROOT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

# Imports
source "${ROOT_PATH}/bash-colorize-feedback.sh";
```
3. From now on you can use the script as follows:

```bash
# Sample Function A
function myFunctionA() {
    # echo_color is from the imported script, and green is predefined in that script.
  echo_color ${GREEN} "

  /************************
   * Starting myFunctionA *
   ************************/

  ";
}
```

# Full example

```bash
# Set root dir.
readonly ROOT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

# Imports
source "${ROOT_PATH}/bash-colorize-feedback.sh";

# Sample Function A
function myFunctionA() {
  #statements
}

# Sample Function B
function myFunctionB() {
  #statements
}

# Main Function.
function mainFunction() {
  # echo_color is from the imported script, and green is predefined in that script.
  echo_color ${GREEN} "
  
  /*************************
  * Starting Main Function *
  *************************/
  
  ";
  
  # this subshell is a scope of try
  # try
  (
  # this flag will make to exit from current subshell on any error
  # inside it (all functions run inside will also break on any error)
  set -e
  # call myFunctionA.
  myFunctionA;
  # call myFunctionB.
  myFunctionB;
  );
  
  # and here we catch errors
  # catch
  errorCode=$?;
  if [ $errorCode -ne 0 ]; then
    error "There was an error, the function output should be printed above.";
    # We exit the all script with the same error, if you don't want to
    # exit it and continue, just delete this line.
    exit ${errorCode}
  fi
}


# This example shows how to check if a function exists,
# if not show an error with the called name and an error message.
# E.g. We try to call the main.sh like this:
# ~/main.sh myFunctionZZZ 
# That will obviously not work because there is no function myFunctionZZZ.
if declare -f "$1" > /dev/null
then
  # call arguments.
  "$@";
else
  # Show a helpful error with the error function from bash-coloriz-feedback.sh
  error "'$1' is not a known function name" >&2;
  exit 1;
fi
```

# Contribute

Feel free to add colors as you like, please commit them here so everyone can use them =).

# License

MIT License

Copyright (c) 2017 Güney Özdemir

- Github: https://github.com/Megajin
- Stackoverflow: https://stackoverflow.com/users/4457744/megajin
- Twitter: https://twitter.com/JustGuni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
