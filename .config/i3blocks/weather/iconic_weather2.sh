#!/bin/bash 
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh UKXX0062
#
#(c) Michael Seiler 2007
 
METRIC=1 #Should be 0 or 1; 0 for F, 1 for C
 

curl -s http://api.openweathermap.org/data/2.5/weather?id=1269843&appid=859692542ab7b2b981f2de7929e0355a&units=metric | perl -ne 'use utf8; if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; my @values=split(":",$1); if( $values[0] eq "Sunny" || $values[0] eq "Mostly Sunny" || $values[0] eq "Partly Sunny" || $values[0] eq "Intermittent Clouds" || $values[0] eq "Hazy Sunshine" || $values[0] eq "Hazy Sunshine" || $values[0] eq "Hot") 
{my $sun = " ";binmode(STDOUT, ":utf8");print "$sun";}
if( $values[0] eq "Mostly Cloudy" || $values[0] eq "Cloudy" || $values[0] eq "Dreary (Overcast)" || $values[0] eq "Fog")
{my $cloud = " ";binmode(STDOUT, ":utf8");print "$cloud";}
if( $values[0] eq "Showers" || $values[0] eq "Mostly Cloudy w/ Showers" || $values[0] eq "Partly Sunny w/ Showers" || $values[0] eq "T-Storms"|| $values[0] eq "Mostly Cloudy w/ T-Storms"|| $values[0] eq "Partly Sunny w/ T-Storms"|| $values[0] eq "Rain"){my $rain = "";binmode(STDOUT, ":utf8");print "$rain";}
if( $values[0] eq "Windy")
{my $wind = "";binmode(STDOUT, ":utf8");print "$wind";} 
if($values[0] eq "Flurries" || $values[0] eq "Mostly Cloudy w/ Flurries" || $values[0] eq "Partly Sunny w/ Flurries"|| $values[0] eq "Snow"|| $values[0] eq "Mostly Cloudy w/ Snow"|| $values[0] eq "Ice"|| $values[0] eq "Sleet"|| $values[0] eq "Freezing Rain"|| $values[0] eq "Rain and Snow"|| $values[0] eq "Cold")
{my $snow = "";binmode(STDOUT, ":utf8");print "$rain";}
