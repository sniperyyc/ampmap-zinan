#!/bin/bash

# Args:
# 1. ssh key
# 2. server address
# 3. port
# 4. username 

#ssh -p ${3} -i ${1} -t ${4}@${2} 'git clone https://bitbucket.com/soojinm/ddosamplification'
scp -P ${3} -i ${1}  ./setup_general.sh  ${4}@${2}:~/
ssh -p ${3} -i ${1} -t ${4}@${2} './setup_general.sh'
scp -P ${3} -i ${1}  ./setup_postgresql.sh  ${4}@${2}:~/
ssh -p ${3} -i ${1} -t ${4}@${2} './setup_postgresql.sh'
