#!/bin/bash
################################################################################
#####               This script defines color for messaging                #####
################################################################################

# Author: Megajin
# Github: https://github.com/Megajin
# Stackoverflow: https://stackoverflow.com/users/4457744/megajin
# Twitter: https://twitter.com/JustGuni

# Defining colors. You can easily add other colors here.
RED=31;
GREEN=32;
YELLOW=33;

# Sets the start of colors.
function begin_color() {
  color="$1";
  echo -e -n "\e[${color}m";
}

# Sets the end of color messaging.
function end_color() {
  echo -e -n "\e[0m";
}

# the actual function which echoes colored messages.
function echo_color() {
  color="$1";
  shift;
  begin_color "$color";
  echo "$@";
  end_color;
}

# Use this if you want to output errors.
function error() {
  local error_message="$@";
  echo_color "$RED" -n "Error: ${error_message}" >&2;
  echo >&2;
  # The exitcode should be used in the actual script!
  # exit 1;
}
