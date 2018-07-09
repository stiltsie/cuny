
# coding: utf-8

# In[284]:

import nltk


# In[285]:

from nltk.corpus import names


# In[286]:

import random


# In[287]:

import itertools


# In[288]:

from itertools import product


# In[289]:

from string import ascii_lowercase


# In[290]:

from nltk.classify import apply_features


# In[291]:

labeled_names = ([(name, 'male') for name in names.words('male.txt')] + [(name, 'female') for name in names.words('female.txt')])


# In[498]:

def gender_features3(name):
    features = {}
    keywords = [''.join(i) for i in itertools.product(ascii_lowercase, repeat = 2)]
    features["first_letter"] = name[0].lower()
    features["first_2letter"] = name[0:1].lower()
    features["first_3letter"] = name[0:2].lower()
    features["last_letter"] = name[-1].lower()
    features["last_2letter"] = name[-2:-1].lower()
    features["last_3letter"] = name[-3:-1].lower()
    for letter in ascii_lowercase:
        features["has({})".format(letter)] = (letter in name.lower())
        for keyword in keywords:
            features["combo2({})".format(keyword)] = (keyword in name.lower())
        return features


# In[513]:

random.shuffle(labeled_names)


# In[514]:

featuresets = [(gender_features3(n), gender) for (n, gender) in labeled_names]


# In[515]:

test_set, devtest_set, train_set = featuresets[:500], featuresets[501:1000],featuresets[1000:]


# In[516]:

classifier = nltk.NaiveBayesClassifier.train(train_set)


# In[517]:

print(nltk.classify.accuracy(classifier, devtest_set))


# In[518]:

print(nltk.classify.accuracy(classifier, test_set))


# In[519]:

print(nltk.classify.accuracy(classifier, train_set))

