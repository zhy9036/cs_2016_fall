##########  Provided helper function. ############

def clean_up(s):
    """ (str) -> str

    Return a new string based on s in which all letters have been
    converted to lowercase and punctuation characters have been stripped 
    from both ends. Inner punctuation is left untouched. 

    >>> clean_up('Happy Birthday!!!')
    'happy birthday'
    >>> clean_up("-> It's on your left-hand side.")
    " it's on your left-hand side"
    """
    
    punctuation = """!"',;:.-?)([]<>*#\n\t\r"""
    result = s.lower().strip(punctuation)
    return result


##########  Complete the following functions. ############

def average_word_length(text):
    """ (list of str) -> float

    Precondition: text is non-empty. Each str in text ends with \n and at
    least one str in text contains more than just \n.

    Return the average length of all words in text. Surrounding punctuation
    is not counted as part of the words. 

    >>> text = ['James Fennimore Cooper\n', 'Peter, Paul and Mary\n']
    >>> average_word_length(text)
    5.142857142857143 
    """
    word_list = text.split(' ')
    i = 0
    total_length = 0.0
    for word in word_list:
        i+=1
        word = clean_up(word)
        total_length+=len(word)

    return float((total_length/i))

    
    # To do: Fill in this function's body to meet its specification.
    

def type_token_ratio(text):
    """ (list of str) -> float

    Precondition: text is non-empty. Each str in text ends with \n and at
    least one str in text contains more than just \n.

    Return the Type Token Ratio (TTR) for this text. TTR is the number of
    different words divided by the total number of words.

    >>> text = ['James Fennimore Cooper\n', 'Peter, Paul, and Mary\n',
        'James Gosling\n']
    >>> type_token_ratio(text)
    0.8888888888888888
    """
    word_list = text.split(' ')
    word_set = []
    i = 0
    i_set = 0
    total_length = 0.0
    for word in word_list:
        i+=1
        word = clean_up(word)
        if word not in word_set:
            word_set.append(word)
            i_set+=1

        
    return float((i_set/i))

  
    # To do: Fill-in this function's body to meet its specification.
    
                
def hapax_legomena_ratio(text):
    """ (list of str) -> float

    Precondition: text is non-empty. Each str in text ends with \n and at
    least one str in text contains more than just \n.

    Return the hapax_legomena ratio for text. This ratio is the number of 
    words that occur exactly once divided by the total number of words.

    >>> text = ['James Fennimore Cooper\n', 'Peter, Paul, and Mary\n',
    'James Gosling\n']
    >>> hapax_legomena_ratio(text)
    0.7777777777777778
    """
    word_list = text.split(' ')
    word_set = []
    i = 0
    i_set = 0
    total_length = 0.0
    for word in word_list:
        i+=1
        word = clean_up(word)
        if word in word_set:
            #word_set.append(word)
            i_set+=2
        else:
            word_set.append(word)

        
    return float(((i-i_set)/i))
 
    # To do: Fill-in this function's body to meet its specification.


def split_on_separators(original, separators):
    """ (str, str) -> list of str

    Return a list of non-empty, non-blank strings from the original string
    determined by splitting the string on any of the separators.
    separators is a string of single-character separators.

    >>> split_on_separators("Hooray! Finally, we're done.", "!,")
    ['Hooray', ' Finally', " we're done."]
    """
    
    # To do: Complete this function's body to meet its specification.
    # You are not required to keep the two lines below but you may find
    # them helpful. (Hint)
    result = []
    result = original.split(separators)
    return result
                
    
def average_sentence_length(text):
    """ (list of str) -> float

    Precondition: text contains at least one sentence. A sentence is defined
    as a non-empty string of non-terminating punctuation surrounded by 
    terminating punctuation or beginning or end of file. Terminating 
    punctuation is defined as !?.

    Return the average number of words per sentence in text.   

    >>> text = ['The time has come, the Walrus said\n',
         'To talk of many things: of shoes - and ships - and sealing wax,\n',
         'Of cabbages; and kings.\n',
         'And why the sea is boiling hot;\n',
         'and whether pigs have wings.\n']
    >>> average_sentence_length(text)
    17.5
    """
    
    # To do: Fill in this function's body to meet its specification.
    

def avg_sentence_complexity(text):
    """ (list of str) -> float

    Return the average number of phrases per sentence.
    
    A sentence is defined as a non-empty string of non-terminating
    punctuation surrounded by terminating punctuation
    or beginning or end of file. Terminating punctuation is defined as !?.
    Phrases are substrings of sentences, separated by one or more of the
    following delimiters ,;: 

    >>> text = ['The time has come, the Walrus said\n',
         'To talk of many things: of shoes - and ships - and sealing wax,\n',
         'Of cabbages; and kings.\n',
         'And why the sea is boiling hot;\n',
         'and whether pigs have wings.\n']
    >>> avg_sentence_complexity(text)
    3.5
    """
    
    # To do: Fill in this function's body to meet its specification.
    
    
def compare_signatures(sig1, sig2, weight):
    """ (list, list, list of float) -> float

    Return a non-negative real number indicating the similarity of the two 
    linguistic signatures, sig1 and sig2. The smaller the number the more
    similar the signatures. Zero indicates identical signatures.
    
    sig1 and sig2 are 6-item lists with the following items:
    0  : Author Name (a string)
    1  : Average Word Length (float)
    2  : Type Token Ratio (float)
    3  : Hapax Legomena Ratio (float)
    4  : Average Sentence Length (float)
    5  : Average Sentence Complexity (float)

    weight is a list of multiplicative weights to apply to each
    linguistic feature. weight[0] is ignored.

    >>> sig1 = ["a_string" , 4.4, 0.1, 0.05, 10.0, 2.0]
    >>> sig2 = ["a_string2", 4.3, 0.1, 0.04, 16.0, 4.0]
    >>> weight = [0, 11.0, 33.0, 50.0, 0.4, 4.0]
    >>> compare_signatures(sig1, sig2, weight)
    12.000000000000007
    """
    
    # To do: Fill in this function's body to meet its specification.