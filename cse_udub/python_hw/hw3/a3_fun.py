def load_profiles(profiles_file, person_to_friends, person_to_networks):
    cnt = 0
    key_name = ''
    for line in profiles_file:
        #print(line)
        if line != '\n':
            
            if cnt == 0:
                # add key to person_to_friends
                key_name = parse_name(line)
                #print(key_name)
                cnt+=1 
            else:
                if "," not in line: # found networks
                    # check if person_to_networks has the key, if so add net to the key
                    if parse_name(key_name) in person_to_networks.keys():
                        person_to_networks[key_name].append(line)
                    else:
                        person_to_networks[key_name] = [line]

                else: # found friend
                    if parse_name(key_name) in person_to_friends.keys():
                        person_to_friends[key_name].append(parse_name(line))
                    else:
                        person_to_friends[key_name] = [parse_name(line)]
                    
        else:
            cnt = 0
    profiles_file.close()


    
    
    
def invert_networks_dict(person_to_networks):
   
    network_to_person = {}
    
    for name in person_to_networks.keys():
        net_set = person_to_networks[name]
        for net_name in net_set:
            if net_name in network_to_person.keys():
                network_to_person[net_name].append(name)
            else:
                network_to_person[net_name] = [name]
    
    return network_to_person

        
def make_recommendations(person, person_to_friends, person_to_networks):
    friends = person_to_friends[person]
    network_to_person = invert_networks_dict(person_to_networks)
    print(friends)
    recommendations = []
    for potential in person_to_friends.keys():
        if potential != person and potential not in friends:
            print('potential: '+potential)
            score = 1 # var for recording score
            p_list = person_to_friends[potential]
            for pf in p_list:
                if pf in friends:
                    #print('found friend')
                    # if not a friend yet, add the person
                    if not any(potential in f_tuple for f_tuple in recommendations):
                        #print(person+' '+potential)
                        recommendations.append((potential, score))
                    # else update the person with +1 score
                    else:
                        score+=1
                        #print('more')
                        recommendations[:] = [(k,v) if (k != potential) else (potential, score) for (k,v) in recommendations]
            score = 1
    return recommendations


def sort_recommendations(potential):
    sorted_list = []
    potential.sort()
    for (k,v) in potential:
        sorted_list.append(k)
    return sorted_list

def parse_name(name):
    
    temp = name.split(', ')
    pname = ''
    
    for tname in temp:
        # print('order: '+tname)
        # print(tname == temp[-1])
        if tname != temp[0]:
            pname += tname.strip()+' '
            # print('name order: '+pname)
    pname+=temp[0]
    # print('name: '+pname)
    
    return pname 
    