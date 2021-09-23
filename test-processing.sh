#!/bin/bash
cd /structure-nst/
th fast_neural_style.lua   -model trained_models/feathers.t7   -input_image images/content/model2.jpg  -output_image out.png
MD5SUM=($(md5sum out.png))
MD5SUMORIG=d42ad3eab739a2be8acc6d36dc99f6b2

#echo -e "MD5SUM=$MD5SUM"
#echo -e "MD5SUMORIG=$MD5SUMORIG"

if [[ $MD5SUM == $MD5SUMORIG ]]; then
  echo "MD5sums match: Test passed."
else
  echo "MD5sums do not match: Error - test failed."
fi
