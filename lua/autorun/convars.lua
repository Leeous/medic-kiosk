CreateConVar( "medickiosk_limit", 3, {268435456, 128}, "How many Medic Kiosks one player can have." )
CreateConVar( "medickiosk_maxprice", 5000, {268435456, 128}, "The max price to use a kiosk." )
CreateConVar( "medickiosk_price", 1000, {268435456, 128, 8192}, "The price of the Kiosk." )
CreateConVar( "medickiosk_disableautoadd", "false", {268435456, 128, 8192}, "Disable the autoadd function, so you can add the Medic Kiosk to custom jobs.  \nIf you disable this, all convars you've set for Medic Kiosk (price, limit, etc) will not work!  \nYou must change these values as you add them to your custom job(s). \nSet value to 1 to disable auto add." )
