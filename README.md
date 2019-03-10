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

## How to set up dns experiment on cloudlab
1. **On Cloudlab**
  * Experiements -> Start Experiements -> change profile -> choose "two virtual machine" -> next
  * Enter name: "dns-example" (or any name you like)
  * Choose any available cluster
  * next -> Finish
  * Waiting for some time until experiement is ready
  * **Do not forget to extend the experiement (usually seven days)**
2. **On your local machine (MacOS)**
  * Check "List View" on cloudlab, treat node 0 as controller, node 1 as DNS server.
  * For example, in this case, node0: 
    ```sh
    ssh -p 25210 yyucheng@c220g2-011125.wisc.cloudlab.us 
    ```
    node1:
    ```sh
    ssh -p 25211 yyucheng@c220g2-011125.wisc.cloudlab.us
    ```
  * cd to folder **server_setup/dns**
  * Set up controller:
    Args:
        1. ssh key
        2. server address
        3. port
        4. username

    In this case,
    ```sh
    ./controller.sh ~/.ssh/id_rsa c220g2-011125.wisc.cloudlab.us 25210 yyucheng
    ```
  * Set up DNS server
    Args:
        1. ssh key
        2. server address
        3. port
        4. username

    In this case,
    ```sh
    ./server.sh ~/.ssh/id_rsa c220g2-011125.wisc.cloudlab.us 25211 yyucheng
    ```
3. **Test if DNS server is setup**
  * Use dig command. Find ip of node1, in this case: 172.16.177.2, run dig command in node0
    ```sh
    dig @172.16.177.2 berkeley.edu
    ```
    If there is response, then dns server is set up.
  * Alternatively, we could use example code to test if it works (as described in "How to run")