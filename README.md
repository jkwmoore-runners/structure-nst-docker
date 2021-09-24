# structure-nst-docker
A docker to implement  structure-nst from https://github.com/xch-liu/structure-nst

Instructions:
=============

Entrypoint.sh is found at the root of the filesystem which can be sourced if torch is not activated (Singularity conversion appears to have issues with this depending on how you call the container.)

The structure-nst folder can also be found at root of the filesystem and has been cloned from https://github.com/xch-liu/structure-nst at build time.

A test is peformed via the test-processing.sh which currently only checks inferrencing is working correctly (at present.) Further tests to check for training may also be added in future.

If further libraries are needed for additional functionality please feel free to submit a PR.
