#!/bin/bash

# Args:
# 1. ssh key
# 2. server address
# 3. port
# 4. username 

scp -P ${3} -i ${1} ./setup_dns.sh ${4}@${2}:~/
ssh -p ${3} -i ${1} -t ${4}@${2} './setup_dns.sh'
