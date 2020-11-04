//c2t
//c2t capeMe

//handler to change modes of the knock-off retro superhero cape


string ITEM_NAME = "knock-off retro superhero cape";

record cape {
	int name;
	int mode;
};

//returns current cape
cape c2t_getCurrentCape();

//handles the choice adventures
void c2t_capeMeChoice(cape current,cape target);

//returns whether 2 capes are the same or not
boolean c2t_capeCompare(cape c1,cape c2);

//handler for arguments from CLI call
cape c2t_capeMeArgs(string arg);

void main(string arg) {
	cape target = c2t_capeMeArgs(arg);
	if (c2t_capeCompare(target,new cape(0,0)))
		return;
	cape current = c2t_getCurrentCape();

	if (!c2t_capeCompare(current,target))
		c2t_capeMeChoice(current,target);
	else {
		print(`The {ITEM_NAME} is already set for {arg}`);
		return;
	}

	if (c2t_capeCompare(target,c2t_getCurrentCape()))
		print(`Successfully changed the {ITEM_NAME} for {arg}`,"blue");
	else
		print(`Something went wrong changing the {ITEM_NAME}.`,"red");
}

cape c2t_getCurrentCape() {
	string[int] capeName = {
		1: "Vampire Slicer trench cape",
		2: "Heck General cloak",
		3: "Robot Police cape"
	};
	string[int] capeMode = {
		2: "Hold Me",
		3: "Thrill Me",
		4: "Kiss Me",
		5: "Kill Me"
	};

	cape result;
	buffer buf = visit_url('desc_item.php?whichitem=630054973');
	foreach i in capeName
		if (buf.contains_text(capeName[i])) {
			result.name = i;
			break;
		}
	foreach i in capeMode
		if (buf.contains_text('reads &quot;'+capeMode[i]+'.&quot;')) {
			result.mode = i;
			break;
		}
	return result;
}

void c2t_capeMeChoice(cape current,cape target) {
	buffer buf = visit_url("inventory.php?action=hmtmkmkm");
	//if somehow on the cape selection, swap to mode selection
	if (buf.contains_text('name=whichchoice value=1438'))
		buf = visit_url("choice.php?pwd&whichchoice=1438&option=4",true,true);
	if (buf.contains_text('name=whichchoice value=1437')) {
		if (current.name != target.name) {
			/* run_choice() not being reliable for some reason. Might be due to still being in choice while rapidly testing this, so just going to be explicit with visit_url()s
			run_choice(1);
			run_choice(target.name);
			*/
			visit_url("choice.php?pwd&whichchoice=1437&option=1",true,true);
			visit_url("choice.php?pwd&whichchoice=1438&option="+target.name,true,true);
		}
		if (current.mode != target.mode)
			//run_choice(target.mode);
			visit_url("choice.php?pwd&whichchoice=1437&option="+target.mode,true,true);
	}
	else
		abort(`Unable to get into the choice for {ITEM_NAME}.`);
}

boolean c2t_capeCompare(cape c1,cape c2) {
	if (c1.name == c2.name && c1.mode == c2.mode)
		return true;
	else
		return false;
}

cape c2t_capeMeArgs(string arg) {
	//oh boy, lots of magic numbers ahead; reference in c2t_getCurrentCape()
	switch (to_lower_case(arg)) {
		//===MUSCLE CAPES===
		//+3 to all resists
		case "res":
		case "resistance":
			return new cape(1,2);
		//extra mus stats at end of combat
		case "mus":
		case "mus stat":
		case "mus stats":
		case "muscle":
		case "muscle stat":
		case "muscle stats":
			return new cape(1,3);
		//gives skill to lifesteal
		case "lifesteal":
			return new cape(1,4);
		//gives skill to instantly kills undead if weilding sword
		case "undead":
			return new cape(1,5);

		//==MYSTICALITY CAPES===
		//stuns enemies at start of combat
		case "stun":
			return new cape(2,2);
		//extra mys stats at end of combat
		case "mys":
		case "mys stat":
		case "mys stats":
		case "mysticality":
		case "mysticality stat":
		case "mysticality stats":
			return new cape(2,3);
		//gives skill that is a yellow ray that gives 100 turns of "everything looks yellow"
		case "yellow ray":
		case "yellowray":
		case "yr":
			return new cape(2,4);
		//spells deal spooky damage in addition to what they already do
		case "lantern":
			return new cape(2,5);

		//===MOXIE CAPES===
		//gives skill to delevel enemies 10%, or 20% on constructs
		case "delevel":
			return new cape(3,2);
		//gives mox stats at end of combat
		case "mox":
		case "mox stat":
		case "mox stats":
		case "moxie":
		case "moxie stat":
		case "moxie stats":
			return new cape(3,3);
		//gives a sleaze damage skill
		case "sleaze":
			return new cape(3,4);
		//gives skill that auto-crits if wielding a gun
		case "crit gun":
			return new cape(3,5);

		//help?
		case "help":
			print("valid arguments: mus | res | lifesteal | undead | mys | stun | yr | lantern | mox | delevel | sleaze | crit gun");
			return new cape(0,0);//trying to not get a stack trace with this

		default:
			abort(`Invalid argument: {arg}`);
			return new cape(0,0);//mafia wants a return even with the abort above
	}
}

