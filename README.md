# ampmap-zinan
## example
- fields.ini: dns fields and values
- query.py: given a particular query and server ip, return the amplification factor.

## How to run
- I have created a cloudlab exp for you called "dns-example", it contains two virtual machines, one serves as controller, another servers dns server.
- VM setting is for ddos purpose, to avoid sending large number of queries and being blocked/flagged.
- Log into the controller, run **python3 query.py**, you should see the amplification factor printed.
- These are just the minimal setting, if you need more functions, just let me know.

