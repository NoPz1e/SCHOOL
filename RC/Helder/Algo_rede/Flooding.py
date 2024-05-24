import sys, random

list_ip = ['139.115.83.87',
  '90.37.164.189',
  '3.220.150.7',
  '133.45.13.242',
  '243.146.198.160',
  '125.133.89.71',
  '9.147.69.124', 
  '172.151.150.170',
  '231.10.247.143',
  '115.82.113.127',
  '15.183.17.108',
  '241.108.113.190',
  '81.74.29.61',
  '227.119.28.180',
  '177.217.58.245',
  '154.21.92.169',
  '175.199.172.37',
  '154.196.152.146',
  '6.208.54.80',
  '12.79.163.21'
]

# Asks target IP
target_ip = input("Target IP: ")

# Initialize variable
not_found = (bool)

# Itterate through IPs to find the target
for ip in list_ip:
  if target_ip == ip:
    not_found = False
    break
  not_found = True

# If not found, place in the end
if not_found:
  list_ip.append(target_ip)

# Initialize random int
nHops = 30 # random.randint(1, 15)

print("Trying to reach " + str(target_ip) + " at maximum hops: " + str(nHops))

black_list_ips = []

for i in range(nHops):
  ip = random.randint(0, len(list_ip) - 1)
  if ip in black_list_ips:
    i -= 1
    continue
  print(str(i + 1) + "\t" + str(list_ip[ip]))
  black_list_ips.append(ip)
  if list_ip[ip] == target_ip:
    print(target_ip + " reached successfully.")
    break

input()