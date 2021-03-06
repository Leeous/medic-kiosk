![alt text](http://i.imgur.com/75CfMe6.png "Logo")
### Installation
1. Download ZIP from [releases](https://github.com/Leeous/medic-kiosk/releases)
2. Extract to `[server directory]/garrysmod/addons`
3. Run the server
4. The _Medic Kiosk_ entity is automatically added to the **TEAM_MEDIC** job

Remember - this version is the **latest** and might have bugs! Scary!  
If you're looking for a version you can use on your server, check the [releases](https://github.com/Leeous/medic-kiosk/releases) page.  

## Server console variables

Remember to define these in your server console and not your _server.cfg_.
Like this:
![](http://i.imgur.com/Ad9mFLc.gif)

| Variable | Value | Description |
| --- | --- | --- |
| medickiosk_maxprice | `number value` | The maximum price the medic can charge for people to use their Kiosk. |
| medickiosk_minprice | `number value` | The minimum price the medic can charge for people to use their Kiosk. |
| medickiosk_cooldown | `number value` | How long a player must wait before using the Medic Kiosk again. <br/>_The value represents seconds._ |

### DarkRP modification snippets


In `/darkrp_customthings/categories.lua`:
```lua
DarkRP.createCategory {
  name = "Medic Kiosk", -- The name of the category.
  categorises = "entities", -- What it categorises. MUST be one of "jobs", "entities", "shipments", "weapons", "vehicles", "ammo".
  startExpanded = true, -- Whether the category is expanded when you open the F4 menu.
  color = Color(215, 180, 36, 255), -- The color of the category header.
}
```
In `/darkrp_customthings/entities.lua`:
```lua
DarkRP.createEntity("Medic Kiosk", {
    ent = "medic_kiosk",
    model = "models/props_lab/hevplate.mdl",
    price = 500,
    max = 2,
    cmd = "buymedickiosk",
    allowed = {TEAM_MEDIC},
    category = "Medic Kiosk"
})

DarkRP.createEntity("Medic Kiosk (Refill)", {
    ent = "medic_kiosk_refill",
    model = "models/healthvial.mdl",
    price = 100,
    max = 2,
    cmd = "buymedickioskrefill",
    allowed = {TEAM_MEDIC},
    category = "Medic Kiosk"
})
```
***
#### Links
[Workshop](http://steamcommunity.com/sharedfiles/filedetails/?id=771173724)  
[YouTube video](https://youtu.be/QqPFTECHdJ0)

##### Social
[Twitter](https://twitter.com/LeeTheCoder)
[Website](https://leeous.github.io/)
