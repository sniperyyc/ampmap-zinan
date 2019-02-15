# ampmap-zinan
## example
- *fields.ini*: dns fields and values
- *query.py*: given a particular query and server ip, return the amplification factor.

## How to run
- I have created a cloudlab exp for you called "dns-example", it contains two virtual machines, one serves as controller (node-0), another servers dns server (node-1).
- All the dependencies/packages have been set up for you. 
- VM setting is for ddos purpose, to avoid sending large number of queries and being blocked/flagged, in this example we just send one query.
- Log into the controller (node-0), cd to folder **zinan-workspace/ampmap-zinan**, run **python3 query.py**, you should see the amplification factor printed.
- These are just the minimal setting, if you need more functions, just let me know.

