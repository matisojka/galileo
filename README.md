Galileo IP Geolocation
======================

This Sinatra App provides a simple API, optimized for speed, for geolocating IPs from all around the world.
Just visit /ips/:ip to get a JSON response with the corresponding country informations.

## Deployment
This application is ready to be deployed to Heroku. Just create an app, add the Memcachier add-on and enjoy!

## Data source
The Database used in this project has been taken from:

http://software77.net/geo-ip/

It's donationware, so don't forget to donate something if you're going to use it.

## About
This application is so simple it might seem unfinished, and it actually is. I needed an internal IP-geolocating service for a project so I decided to create one. Take it as it is or fork and improve it.

## Ideas
* Remove explicit caching / memcached references in the code so that it can operate without any cache at all.
* Add more detailed informations
* Region information (on demand) would be a nice addition

## Contributing
Pull Request are welcome, but remember that simplicity and speed are the main goals of this project.

