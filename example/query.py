import dns.message
import dns.rdataclass
import dns.rdatatype
import dns.query
import dns.flags
from collections import OrderedDict
from scapy.all import *
from scapy import *
from scapy.layers.inet import *
from scapy.layers.ntp import *
from scapy.fields import *


'''
Query a particular dns server with a dict of field values
Input:
  - serverip: the ip address of dns server you want to query
  - field_vals: dict contains (field, value) pair
Output:
  - amplification factor (response/query)
'''
def __dns_message_dict(serverip, field_vals): 
    try:
        m = dns.message.Message()
        id = field_vals["id"]
        qr = field_vals["qr"]
        aa = field_vals["aa"]
        tc = field_vals["tc"]
        rd = field_vals["rd"]
        ra = field_vals["ra"]
        cd = field_vals["cd"]
        ad = field_vals["ad"]
        opcode = field_vals["opcode"]
        rcode = field_vals["rcode"]
        edns = field_vals["edns"]
        payload = field_vals["payload"]
        url = field_vals["url"]
        rdataclass = field_vals["rdataclass"]
        rdatatype = field_vals["rdatatype"]
        dnssec =  field_vals["dnssec"]
        #print(serverip)
        #if type(url ) == int: 
        #    url = "berkeley.edu"
        m.id = id # 1000 
        if qr:
            m.flags |=  int(dns.flags.QR)
        if aa:
            m.flags |=  int(dns.flags.AA)
        if tc:
            m.flags |=  int(dns.flags.TC)
        if rd:
            m.flags |=  int(dns.flags.RD)
        if ra:
            m.flags |=  int(dns.flags.RA )        
        if ad:
            m.flags |=  int(dns.flags.AD )        
        if cd:
            m.flags |=  int(dns.flags.CD )        
    
        #m.flags |=  int(dns.flags.AD )        
        #m.flags |=  int(dns.flags.CD )        
        m.set_opcode(int(opcode))
        m.set_rcode(int(rcode))

        m.edns = int(edns)
        m.payload=int(payload)
        if dnssec:
            m.ednsflags |= int( dns.flags.DO)
            
        qname = dns.name.from_text(url)     

        #print "rdataclass ", rdataclass    
        ##print "rdatatype ", rdatatype    
        #print "qname ", qname
        m.find_rrset(m.question, qname , rdataclass  , rdatatype , create=True,
                         force_unique=True) 
        #print('m is ', m)

        r = dns.query.udp(m, serverip,  timeout=0.25)
        resp_len =  len( r.to_text())
        #print("\n\nresponse : " , r)
        if resp_len is not None:
            amp_factor =  float(resp_len) / float(len(m.to_text()))
            #$print("amp factor ", amp_factor)
            return amp_factor  #float(len(m.to_text())) #resp_len #amp_factor
        return 0
    except dns.exception.DNSException:
        return 0

def main():
    #[('id', 35213), ('rdatatype', 255), ('ra', 0), ('ad', 0), ('z', 0), ('rd', 0), ('tc', 0), ('url', 'aetna.com'), ('edns', 1), ('qr', 0), ('opcode', 0), ('aa', 1), ('dnssec', 0), ('rdataclass', 1), ('cd', 0), ('rcode', 15), ('payload', 175)]
    
    # one query example
    field_vals = {
        "id": 35213,
        "rdatatype": 255,
        "ra": 0,
        "ad": 0,
        "z": 0,
        "rd": 0,
        "tc": 0,
        "url": "aetna.com",
        "edns": 1,
        "qr": 0,
        "opcode": 0,
        "aa": 1,
        "dnssec": 0,
        "rdataclass": 1,
        "cd": 0,
        "rcode": 15,
        "payload": 175
    }

    # node-1 ip address
    serverip = "172.16.117.2"

    ampfactor = __dns_message_dict(serverip, field_vals)
    print("serverip: %s, ampfactor: %f" %(serverip, ampfactor))
  
if __name__== "__main__":
    main()

