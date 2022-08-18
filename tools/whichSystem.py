#!/usr/bin/python3
#coding: utf-8
 
import re, sys, subprocess, ipaddress
 
# python3 wichSystem.py 10.10.10.14 
 
if len(sys.argv) != 2:
    print("\n[!] Use: python3 " + sys.argv[0] + " < IP_ADDRESS | HOSTNAME >\n")
    sys.exit(1)
 
def get_ttl(target):
 
    proc = subprocess.Popen(["/usr/bin/ping -c 1 %s" % target, ""], stdout=subprocess.PIPE, shell=True)
    (out,err) = proc.communicate()
 
    out = out.split()

    # Check if the target is an IP Address or a Hostname
    try:
        ip = ipaddress.ip_address(target)
        out = out[12].decode('utf-8')
    except ValueError:
        out = out[13].decode('utf-8')

    ttl_value = re.findall(r"\d{1,3}", out)[0] 
    return ttl_value
 
def get_os(ttl):
 
    ttl = int(ttl)
 
    if ttl >= 0 and ttl <= 64:
        return "Linux"
    elif ttl >= 65 and ttl <= 128:
        return "Windows"
    else:
        return "Not Found"
 
if __name__ == '__main__':
 
    target = sys.argv[1]
 
    ttl = get_ttl(target)
 
    os_name = get_os(ttl)
    print("\n%s (TTL -> %s): %s\n" % (target, ttl, os_name))
