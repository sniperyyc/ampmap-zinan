#!/bin/bash

# Args
# 1. ssh key
# 2. server address
# 3. port
# 4. username

flags="-o StrictHostKeyChecking=no"

scp  -P ${3} -i ${1} $flags  setup_slave.sh  ${4}@${2}:~/
ssh -p ${3} -i ${1} $flags  -t ${4}@${2} 'chmod +x setup_slave.sh && ./setup_slave.sh'
#scp -P ${3} -i ${1} $flags ./setup_postgresql.sh  ${4}@${2}:~/
#ssh -p ${3} -i ${1} $flags -t ${4}@${2} './setup_postgresql.sh'
