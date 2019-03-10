controller.sh:
	sets up controller with ddos repo + psql
        runs setup_general.sh, setup_postgresql.sh
slave.sh:
	sets up slave with ddos repo + psql + nmap
        runs setup_general.sh, setup_postgresql.sh, setup_nmap.sh
server.sh:
	sets up server with ddos repo + conf files
	runs setup_dns.sh
