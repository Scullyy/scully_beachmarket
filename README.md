# scully_beachmarket
A resource to change the interior of gabz beach market and sync it across all players including newly connected ones.

# Support:

For support join my discord here: https://discord.gg/scully

# Installation Instructions:

add `ensure scully_beachmarket` to your `server.cfg`

# Permissions

**Add the following to your server.cfg**

add_ace group.market market allow

**If not using a discord ace perms resource add the following also, replace 'identifier' with your chosen identifier. For example, mine is discord:530698981920079882**

add_principal identifier.'identifier' group.market

# Exports

**This resource also comes with exports that work on both client + server which you can use to integrate with other resources such as a business script, this is optional and if you don't want to use it you can stick to the commands.**

```lua
local id, set, hasOffice = 1, 'phonea', true

exports.scully_beachmarket:setMarket(id, set, hasOffice)
```


