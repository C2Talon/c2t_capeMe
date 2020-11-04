# c2t_capeMe

Note: This script is depreciated. Kolmafia has the built-in CLI command `retrocape` for it now.

Kolmafia script to handle changing modes of the knock-off retro superhero cape via the CLI or as a function.

`svn checkout https://github.com/c2talon/c2t_capeMe/branches/master/kolmafia/`

## Usage

### CLI

Can be used with the CLI via:
`c2t_capeme <mus | res | lifesteal | undead | mys | stun | yr | lantern | mox | delevel | sleaze | crit gun>`
* The following 4 are "muscle" capes, which always grant +30% muscle and +50 HP:
* * `mus` will set the cape to also give 3 extra muscle stats at the end of combat
* * `res` will set the cape to also give +3 to all resistances
* * `lifesteal` will grant a skill that steals life from the enemy
* * `undead` will grant a skill that instantly kills undead monsters if wielding a sword
* The following 4 are "mysticality" capes, which always grant +30% mysticality and +50 MP:
* * `mys` will set the cape to also give 3 extra mysticality stats at the end of combat
* * `stun` will automatically stun an enemy at the start of combat
* * `yr` will grant a skill that acts as a yellow ray which gives 100 turns of "everything looks yellow" on use
* * `lantern` spells will deal spooky damage in addition to what they already do
* The following 4 are "moxie" capes, which always grant +30% moxie and +25 to both HP and MP:
* * `mox` will set the cape to also give 3 extra moxie stats at the end of combat
* * `delevel` will grant a skill that delevels enemies 10%, or constructs 20%
* * `sleaze` will grant a skill that deals sleaze damage
* * `crit gun` will grant a skill that auto-crits if wielding a gun

### function

`import` this script to use its function to handle the choice adventures. It is a bit barebones, as I'm not sure it would make sense to make it even half as complex as the CLI handler.

`void c2t_capeMe(int name,int mode)`
* `name` is an integer corresponding to the following choice adventure options for the cape type:
* * 1: "Vampire Slicer trench cape"
* * 2: "Heck General cloak"
* * 3: "Robot Police cape"
* `mode` is an integer corresponding to the following choice adventure options for the cape mode:
* * 2: "Hold Me"
* * 3: "Thrill Me"
* * 4: "Kiss Me"
* * 5: "Kill Me"
