from a3_fun import *
       
if __name__ == '__main__':
    
    # During testing, we may change the values of these variables to non-empty
    # dictionaries or to different files.
    friendships = {}
    networks = {}
    profiles_file = open('profiles.txt')

    # Add your code here.  
    load_profiles(profiles_file, friendships, networks)
    while True:
        #print(friendships)
    	input_name = raw_input('Please enter a person (or press return to exit): ')
    	if input_name == '':
            print('Thank you for using the recommendation system!')
            exit()
        else:
            if input_name in friendships.keys():
                recommand = make_recommendations(input_name, friendships, networks)
                friendList = sort_recommendations(recommand)
                if not friendList:
                    print('There are no recommendations for this person.\n')
                else:
                    for fname in friendList:
                        print(fname)
                    print('\n')
            else:
                print('No such person.\n')
