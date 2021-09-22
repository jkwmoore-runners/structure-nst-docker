#!/bin/bash
# Load up torch
. /usr/local/torch/bin/torch-activate
# Now run the CMD
exec "$@"
