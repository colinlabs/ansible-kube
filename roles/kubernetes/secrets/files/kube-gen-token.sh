#!/bin/bash

# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e

token_dir=${TOKEN_DIR:-/etc/kubernetes/tokens}
token_file="${token_dir}/known_tokens.csv"

user=$1
group=$2

if [ ! -e "${token_file}" ]; then
  touch "${token_file}"
fi

token=$(head -c 16 /dev/urandom | od -An -t x | tr -d ' ')
cat >> ${token_file} <<EOF
${token},${user},${user},"${group}"
EOF

echo "Token: ${token}"