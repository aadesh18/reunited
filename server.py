import random
import requests

GEOAPIFY_API_KEY = 'fe75765f64314df68fed8178f5fdead0'



def category_finder(sentence):
    category_keywords = {
    'beach': ['beach', 'shore', 'coast', 'seaside', 'coastline', 'oceanfront'],
    'administrative': ['administrative', 'boundary', 'district', 'jurisdiction', 'municipality'],
    #'office': ['office', 'business', 'company', 'organization', 'workplace', 'firm'],
    'activity': ['activity', 'club', 'community', 'center', 'recreation', 'social'],
    'production.factory': ['factory', 'manufacturing', 'plant', 'production', 'assembly', 'industry'],
    'sport': ['sport', 'infrastructure', 'stadium', 'arena', 'athletics', 'competition'],
    'ski': ['ski', 'skiing', 'downhill', 'resort', 'snowboarding', 'mountain', 'winter sports'],
    'low_emission_zone': ['low', 'emission', 'zone', 'pollution', 'clean air', 'green zone'],
    'national_park': ['national', 'park', 'wildlife', 'reserve', 'preserve', 'conservation'],
    'production': ['production', 'manufacturing', 'plant', 'assembly', 'industry'],
    'childcare': ['childcare', 'daycare', 'nursery', 'babysitting', 'child development'],
    'education': ['education', 'school', 'college', 'university', 'learning', 'academia'],
    'entertainment': ['entertainment', 'amusement', 'fun', 'games', 'leisure', 'recreation'],
    'accommodation': ['accommodation', 'lodging', 'hotel', 'motel', 'residence', 'shelter'],
    'populated_place': ['populated', 'city', 'town', 'urban', 'metropolitan', 'settlement'],
    'catering.taproom': ['taproom', 'draught', 'cask', 'beer', 'brewery', 'beer garden'],
    'catering': ['catering', 'restaurant', 'cafe', 'bar', 'eat', 'dining', 'food'],
    #'pet': ['pet', 'animal', 'veterinarian', 'clinic', 'pets', 'companion', 'vet', 'vets'],
    'tourism': ['tourism', 'tourist', 'attraction', 'sightseeing', 'destination', 'travel'],
    'adult': ['adult', 'nightclub', 'strip', 'bar', 'gentlemen\'s club', 'adult entertainment'],


        'camping': ['camping', 'outdoor', 'activity', 'overnight'],
        'service': ['service', 'public', 'library', 'office'],
        'healthcare': ['healthcare', 'hospital', 'clinic', 'medical'],
        'commercial': ['commercial', 'market', 'shopping', 'mall', 'buy', 'sell','shop', 'shopping'],
        'natural': ['natural', 'park', 'garden', 'wilderness', 'nature'],
        'parking': ['parking', 'car', 'vehicle', 'garage', 'park'],
        'leisure': ['leisure', 'relax', 'unwind', 'spa'],
        'rental': ['rental', 'rent', 'borrow', 'hire'],
        'political': ['political', 'boundary', 'government', 'state'],
        'postal_code': ['postal', 'code', 'zip', 'area'],
        'public_transport': ['public', 'transport', 'station', 'stop'],
        'amenity': ['amenity', 'utility', 'convenience', 'facility'],
        'building': ['building', 'structure', 'house', 'residence'],
        'man_made': ['man-made', 'constructed', 'human', 'artifact']
    }
    matches = {}
    for word in sentence.split():
        for category, keywords in category_keywords.items():
            if any(keyword in word.lower() for keyword in keywords):
                if category not in matches:
                    matches[category] = 1
                else:
                    matches[category] += 1
    if not matches:
        return None
    return max(matches, key=matches.get)




sentence = input("Please enter a sentence: ")
closest_element = category_finder(sentence)
print(f"The closest element to what you're looking for is: {closest_element}")

#%%
import json

# Replace YOUR_API_KEY with your actual API key
API_KEY = "fe75765f64314df68fed8178f5fdead0"
PLACES_API_URL = "https://api.geoapify.com/v2/places"

def get_places(location, category):
    """
    Call the Geoapify Places API to retrieve places near the specified location and category
    """
    # Set up the request parameters
    params = {
        "apiKey": API_KEY,
        "categories": category,
        "filter":"place:513f5453a6a502bcbf59e71dd54310c04940f00101f90146000100000000009203064c6f6e646f6e",
        "limit": 5
    }

    # Send the request to the API and get the response
    response = requests.get(PLACES_API_URL, params=params)

    # Parse the response JSON data
    data = json.loads(response.text)

    # Extract the relevant information from the response
    places = []
    for feature in data["features"]:
        name = feature["properties"]["name"]
        address = feature["properties"]["formatted"]
        places.append(name)

    # Return the list of places
    return places

# Example usage
location = "52.522207,13.412924" # Berlin, Germany
category = 'catering'
places = get_places(location, category)
for place in places:
    print(place)

#%%

responses = {
    "hi": ["Hello!", "Hi there!", "Hey!", "Hi, how can I help you?"],
    "hello": ["Hello!", "Hi there!", "Hey!", "Hi, how can I help you?"],
    "hey": ["Hello!", "Hi there!", "Hey!", "Hi, how can I help you?"],
    "how are you": ["I'm doing well, thank you! How can I assist you?", 
                    "I'm good, thanks for asking. What can I help you with today?",
                    "I'm doing great, how can I be of assistance?"],
    "what can you do": ["I can help you with a variety of tasks, such as answering questions, providing information, or even just chatting with you. What can I do for you today?",
                       "I'm a versatile chatbot that can help you with a range of tasks. What do you need assistance with?"],
    "tell me a joke": ["Sure, here's one for you: Why did the tomato turn red? Because it saw the salad dressing! Ha ha!"],
    "thanks": ["You're welcome!", "No problem, happy to help!", "Glad I could assist you!"],
    "thank you": ["You're welcome!", "No problem, happy to help!", "Glad I could assist you!"],
    "bye": ["Goodbye!", "Have a great day!", "See you later!"],
    "goodbye": ["Goodbye!", "Have a great day!", "See you later!"],
    "ok": ["Sounds good!", "Alright!", "Got it!"],
    "okay": ["Sounds good!", "Alright!", "Got it!"],
    "help": ["Of course, I'm here to help! What do you need assistance with?",
             "Sure thing, how can I assist you?"],
    "what is your name": ["My name is NeighbourGuide. Nice to meet you!",
                          "You can call me NeighbourGuide. How can I assist you today?"],
    "what is your purpose": ["My purpose is to assist and provide helpful responses to your inquiries. How can I assist you today?",
                             "I'm here to help you with any questions or tasks you may have. What can I do for you?"],
    "who created you": ["I was created by Kushal and Aadesh. How can I assist you today?",
                        "Kushal and Aadesh created me to assist and provide helpful responses. What do you need help with?"],
    "what is the weather like today": ["I'm sorry, but as an AI language model, I'm not able to provide real-time information like the weather. However, you can check your local news or weather website for more information.",
                                      "I don't have access to real-time weather information, but I suggest checking your local news or weather website for the latest updates."],
    "what is the time": ["I'm sorry, but as an AI language model, I'm not able to provide real-time information like the time. However, you can check your phone, computer or other devices for the current time.",
                         "I don't have access to real-time information on the time, but your phone, computer or other devices should be able to provide you with that information."],
    "what can you tell me about covid": ["COVID-19 is a highly infectious respiratory illness caused by the SARS-CoV-2 virus. It was first identified in Wuhan, China in December 2019"
],
    "default": ["I could not understand what you are asking, Can you rephrase it?", "I am unable to "],
}

accepted_responses = {"Certainly, Here's what you're looking for"}
# define a function to generate a response to the user's input
def generate_response(user_input, location):
    # convert the input to lowercase and remove any leading/trailing whitespace
    user_input = user_input.lower().strip()
    category = category_finder(user_input)
        
    
    # check if the user's input matches one of the defined responses
    if user_input in responses:
        response = []
        response.append(random.choice(responses[user_input]))
        bot_response = json.dumps({'result':{"message":response}})
    elif category != None: 
        bot_response = json.dumps({'result' :{"places": get_places(location, category)}})
    else:
        bot_response = json.dumps({'result':{"message":random.choice(responses["default"])}})
    
    return bot_response

def get_location():
    location = {
        "lat": 37.7749,
        "lon": -122.4194
    }
    return location

# start the chat
print("Welcome to the Neighborhood Guide!")
location = get_location()
while True:
    user_input = input("You: ")
    bot_response = generate_response(user_input, location)
    print("Neighborhood Guide:", bot_response)
