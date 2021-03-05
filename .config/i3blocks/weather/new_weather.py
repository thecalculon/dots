#!/usr/bin/python

import requests
import urllib.request, json 
import numpy as np
import time 
import pandas as pd
from datetime import datetime
import os
##
#os.system('i3geoweather -d')
#Gangtok
#1271631
#hyderabad
# 1269843
url1 = 'http://api.openweathermap.org/data/2.5/weather?id=1269843&appid=859692542ab7b2b981f2de7929e0355a&units=metric'
with urllib.request.urlopen(url1) as url:
    data = json.loads(url.read().decode())
#    
#with open('/home/vikash/.i3geoweather/weather.cache','r') as read_file:
#   data = json.load(read_file)
    #print(data)
#print(data)
w_des = data['weather'][0]['main']
temp = np.float(data['main']['temp'])
sunrise = data['sys']['sunrise']
sunset = data['sys']['sunset']
now = int(time.time())


WEATHER_TYPES = { "Sunny"               : ["☀️",   "🌙"], #pylint: disable=C0326
                  "Partly cloudy"      : ["⛅",  "☁️"],  #pylint: disable=C0326
                  "Clear sky"          : ["☀️",   "🌙"], #pylint: disable=C0326
                  "Clouds"             : ["☁️",   "☁️"],  #pylint: disable=C0326
                  "Light rain"         : ["🌧️",  "🌧️"], #pylint: disable=C0326
                  "Rain"               : ["🌧️",  "🌧️"], #pylint: disable=C0326
                  "Heavy Rain"         : ["🌧️",  "🌧️"], #pylint: disable=C0326
                  "Light snow"         : ["🌨️",  "🌨️"], #pylint: disable=C0326
                  "Snow"               : ["🌨️",  "🌨️"], #pylint: disable=C0326
                  "Heavy snow"         : ["🌨️",  "🌨️"], #pylint: disable=C0326
                  "Haze"               : ["☀️",   "🌙"], #pylint: disable=C0326
                  "Mist"                : ["🌫️",  "🌫️"], #pylint: disable=C0326
                  "Light snow showers" : ["🌨️",  "🌨️"]} #pylint: disable=C0326


ICON_SUNNY=" "
ICON_CLOUDY=" "
ICON_RAINY=" "
ICON_STORM=" "
ICON_SNOW=" "
ICON_FOG=" "
SYMBOL_CELSIUS="℃ "


is_night = 0
if (now > sunset ):
    is_night = 1 
if (now < sunset):
    is_night = 0 

weather = w_des
if weather in WEATHER_TYPES:
        # Emoji is avaiable for usage.
    print(weather + ": " + WEATHER_TYPES.get(weather)[is_night] + " ", end="")
else:
        # No emoji available, use regular text.
    print(weather + " ", end="")
print(temp, end="°C ")   
#print('%s%0.2lf%s' %(icon, temp, SYMBOL_CELSIUS))
print("\n#0088FF")

