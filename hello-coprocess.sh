#!/usr/bin/env bash
# Basic usage of coprocess
#
# Copyright _copyright_effective_year_ _copyright_holder_name_ <_copyright_holder_contact_>
# SPDX-License-Identifier: CC-BY-SA-4.0

set \
    -o errexit \
    -o errtrace \
    -o nounset \
    -o pipefail

coproc print_some_names {
    # It seems that coprocess will not properly function if the tasks
    # ended prematurely, add some timeout
    sleep 1

    printf 'Aaron\n'
    printf 'Peter\n'
    printf 'Sally\n'
}

COPROCESS_STDOUT_FD_INDEX=0
COPROCESS_STDIN_FD_INDEX=1
# False positives for SC2086 and SC2154 with named coprocess in bash · Issue #1066 · koalaman/shellcheck
# https://github.com/koalaman/shellcheck/issues/1066
# shellcheck disable=SC2154
printf \
    'DEBUG: Subshell process ID: %u\n' \
    "${print_some_names_PID}" \
    1>&2
printf \
    'DEBUG: Coprocess standard output file descriptor: %u\n' \
    "${print_some_names["${COPROCESS_STDOUT_FD_INDEX}"]}" \
    1>&2
printf \
    'DEBUG: Coprocess standard error file descriptor: %u\n' \
    "${print_some_names["${COPROCESS_STDIN_FD_INDEX}"]}" \
    1>&2

# NOTE: The print_some_names array will be unset if the coprocess ended
# prematurely, yikes...
while read -r line 0<&"${print_some_names["${COPROCESS_STDOUT_FD_INDEX}"]}"; do
    echo "${line}"
done

# NOTE: The print_some_names_PID parameter will be unset if the
# coprocess ended prematurely, yikes...
if test -v print_some_names_PID \
    && ! wait "${print_some_names_PID}"; then
    printf \
        'DEBUG: Coprocess failed with %u exit status.\n' \
        "${?}" \
        1>&2
else
    printf 'DEBUG: Coprocess ended successfully.\n'
fi
