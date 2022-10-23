# Coprocess

Run code asynchronously in a sub-shell, while operating its standard input and output

![GitHub Actions workflow status badge](https://github.com/bash-101/coprocess/actions/workflows/check-potential-problems.yml/badge.svg "GitHub Actions workflow status") [![pre-commit enabled badge](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white "This project uses pre-commit to check potential problems")](https://pre-commit.com/) [![REUSE Specification compliance badge](https://api.reuse.software/badge/github.com/bash-101/coprocess "This project complies to the REUSE specification to decrease software licensing costs")](https://api.reuse.software/info/github.com/bash-101/coprocess)

## Known issues

There are alot of problems regarding the usage of Coprocess feature:

* The file descriptor array will not be available if the coprocess
  ended prematurely, and will result in a nounset error condition
  when referenced[^coprocess_variables_unset]
* The NAME_PID variable will not be available if the coprocess
  ended prematurely, and will result in a nounset error condition
  when referenced[^coprocess_variables_unset]

As a result, we recommend to avoid using it as of now and use standard
named pipes as an alternative[^named_pipe_alternative_suggestion].

## Reference

[^coprocess_variables_unset]: [process - Bash unsets *_PID variable before I can wait on coproc - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/337151/bash-unsets-pid-variable-before-i-can-wait-on-coproc)  
Info on why the coprocess feature shouldn't be used as of now

[^named_pipe_alternative_suggestion]: [Stéphane Chazelas's answer - bash - How do you use the command coproc in various shells? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/a/86372/158581)  
For the alternative suggestion

## Licensing

Unless otherwise noted, this product is licensed under the 4.0 International version of the [Creative Commons — Attribution license](https://creativecommons.org/licenses/by/4.0/), or any of its recent versions you would prefer.

This work complies to the [REUSE Specification](https://reuse.software/spec/), refer [REUSE - Make licensing easy for everyone](https://reuse.software/) for info regarding the licensing of this product.
