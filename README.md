# c2t_capeMe

Kolmafia script that is a wrapper for the CLI command `retrocape` to have arguments that have meaning.

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
