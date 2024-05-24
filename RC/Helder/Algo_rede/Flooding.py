import random, turtle

list_ip = []

def random_IPS():
  first = random.randint(0, 255)
  second = random.randint(0, 255)
  third = random.randint(0, 255)
  fourth = random.randint(0, 255)
  return f"{first}.{second}.{third}.{fourth}"

for i in range(20):
  list_ip.append(random_IPS())
  
# Initialize target IP
target_ip = random.randint(0, len(list_ip)) # -1

scsize = (500, 500)
screen = turtle.getscreen()
turtle.screensize(scsize[0], scsize[1])


posList = []

for ip in list_ip:
  color = "black"
  pos = ((random.choice([-1, 1])) * (random.randint(50, scsize[0] - 50)),
          (random.choice([-1, 1])) *  random.randint(50, scsize[1] - 50))
  posList.append(pos)
  if list_ip.index(ip) == target_ip:
    color = "red"
  if list_ip.index(ip) == 0:
    color = "blue"
  turtle.penup()
  turtle.goto(pos[0], pos[1])
  turtle.pendown()
  turtle.dot(10, color)
  turtle.penup()
  turtle.goto(pos[0] - 50, pos[1] + 15)
  turtle.write(str(ip), font= ("Times New Roman", 15, "normal"))

turtle.penup()
turtle.goto(posList[0])

# Initialize number of hops
nHops = 30

print("Trying to reach " + str(list_ip[target_ip]) + " at maximum hops: " + str(nHops))

black_list_ips = []

turtle.pendown()
for hop in range(nHops):
  ip = random.randint(0, len(list_ip) - 1)
  if ip in black_list_ips:
    hop -= 1
    continue
  turtle.goto(posList[ip])
  print(str(hop +1) + "\t" + str(ip) + "\t" + str(list_ip[ip]))
  black_list_ips.append(ip)
  if list_ip[ip] == list_ip[target_ip]:
    print(list_ip[target_ip] + " reached successfully.")
    break
