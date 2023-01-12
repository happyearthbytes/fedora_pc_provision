#!/bin/bash

no_args=()
all_commands=()
function get { eval ${!1}; echo ${command["$2"]} ${@:3};}
function run { $(get $1 $2 ${@:3});}
function get_summary { get $1 "summary" ${@:2}; }
function get_args { get $1 "args" ${@:3}; }
function get_description { get $1 "description" ${@:2}; }
function run_function { run $1 "function" ${@:2}; }
function run_default { default_func "$1" ${@:3}; }
function parse_args {
    for cmd in "${all_commands[@]}"; do
        if [[ "$cmd" == "$1" ]] || [[ "--$cmd" == "$1" ]]; then
            run_default ${cmd} ${@}
            exit 0
        fi
    done
}
function default_func() {
    cmd="${2}"
    args=$(get_args ${1})[@]
    for arg in ${!args}; do
        if [[ ${cmd} == $arg ]]; then
            run_default ${cmd} ${@:3}
            return
        fi
    done
    if [[ ${cmd} == "helper" ]]; then
        get_description ${1}
        run_function ${cmd} ${!args}
        return
    fi
    run_function $1 ${@:2}
}


start_function() {
  echo "start_function"
  exit 0
}
all_commands+=("start")
start_args=()
start=$(
declare -Ap command=(
    ["summary"]="Startup operation"
    ["description"]="Start a k3s kustomization"
    ["function"]=start_function
    ["args"]=start_args
))
start_fast_function() {
  echo "start_fast_function"
  exit 0
}
start_args+=("start_fast")
start_fast=$(
declare -Ap command=(
    ["summary"]="start fast"
    ["description"]="really fast"
    ["function"]=start_fast_function
    ["args"]=no_args
))
start_slow_function() {
  echo "start_slow_function"
  exit 0
}
start_args+=("start_slow")
start_slow=$(
declare -Ap command=(
    ["summary"]="start slow"
    ["description"]="really slow"
    ["function"]=start_slow_function
    ["args"]=no_args
))


stop_function() {
  echo "stop: $@"
  exit 0
}
all_commands+=("stop")
stop=$(
declare -Ap command=(
    ["summary"]="Stop operation"
    ["description"]="Stop a k3s kustomization"
    ["function"]=stop_function
    ["args"]=no_args
))

helper_function() {
    for arg in ${@}; do
        echo -n "  $arg              " | head -c 16
        get_summary ${arg}
    done
  exit 0
}
helper=$(
declare -Ap command=(
    ["summary"]="helper operation"
    ["description"]="helper descr"
    ["function"]=helper_function
    ["args"]=no_args
))

help_function() {
    echo "usage: $0 [${all_commands[@]}]"
    echo "this script blah blah"
    echo ""
    echo "commands:"
    for cmd in "${all_commands[@]}"; do
        echo -n "  $cmd              " | head -c 16
        get_summary ${cmd}
    done
    exit 0
}
all_commands+=("help")
help=$(
declare -Ap command=(
    ["summary"]="Prints help message"
    ["description"]="Display options and usage instructions"
    ["function"]=help_function
    ["args"]=no_args
))

parse_args $@
help_function

echo -e "\nERROR: invalid command: $0 $@"
exit -1    