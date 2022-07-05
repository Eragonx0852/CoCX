package classes.Scenes.NPCs{
import classes.*;
import classes.BodyParts.LowerBody;
import classes.GlobalFlags.kFLAGS;

public class HelSpawnScene extends NPCAwareContent {
//Helia Expansion 4: The Edge of Paradise
//A CoC Multi-Character Expansion
//Savin

//Content Pack: Introduction
//Expanded Variable: HelAffection can now reach 250%. When this occur, At the Edge of Paradise begins. HelAffection is raised as: 10 for sex, 15 for threesomes, 10 for talking/hugging/cuddling.
//New Variable: " + flags[kFLAGS.HELSPAWN_NAME] + ", the name of Hel’s daughter
//New Variable: [HelspawnPersonality], rated 0-100. 
//New Variable: " + championRef() + ", being whatever the fuck Helspawn calls you.
//New Variable: [HelspawnDadddy], recording who, exactly, fathered Hel’s daughter
//New Variable: [HelLove] Yes/No, set by the PC in the beginning.

//const HELSPAWN_NAME:int = 956;
//const HELSPAWN_PERSONALITY:int = 957;
//0 = PC, 1 = Spider, 2 = Mai
//const HELSPAWN_DADDY:int = 958;
//const HELSPAWN_WEAPON:int = 959;
//const HELSPAWN_AGE:int = 960;
//const HELSPAWN_GROWUP_COUNTER:int = 961;
//const HEL_LOVE:int = 962;
//Has Helia had the pale flame event happen?
//const HELIA_KIDS_CHAT:int = 963;
//const HELIA_TALK_SEVEN:int = 964;
//Track Hel getting knocked up by others. 1 = doing it. 2 = talked to PC about it.
//const HEL_NTR_TRACKER:int = 965;
//const HEL_BONUS_POINTS:int = 966;
//const HEL_PREGNANCY_INCUBATION:int = 967;
//0 = no notices. 1 = bulgy. 2 = pretty preg. 3 = gravid.
//const HEL_PREGNANCY_NOTICES:int = 968;
//const HAD_FIRST_HELSPAWN_TALK:int = 969;
//const HELSPAWN_INCEST:int = 970;
//const HEL_TALK_EIGHT:int = 971;
//const HELSPAWN_DISCOVER_BOOZE:int = 972;
//const HELSPAWN_FUCK_INTERRUPTUS:int = 973;
//const SPIDER_BRO_GIFT:int = 974;
//const HAKON_AND_KIRI_VISIT:int = 975;

//In this Expansion, Helia the Salamander, who’s spent much of her life alone until the brave Champion took her into his confidence, enters a stage in her life called The Pale Flame: whether she wants to admit it or not, her body’s ready for children; she’s found the person she truly wants to be with. She asks the Champion to father her child; if that is impossible, but desired (or the PC doesn’t want to be the daddy, but wants Hel to have kids anyway), she will offer to get Mai the Foxgirl to knock her up instead; if it is undesired at all, the PC can ask Hel to go on herbs, suppressing her fertility until the PC's ready. Hel will remain on herbs until the PC decides he’s ready.

//Setting " + championRef() + ":
	//It was really fucking hard to decide what this bitch is supposed to call you. So, here’s the dealio: If you’re a herm AND her mother, she calls you \"Mom;\" dude and her dad, she calls you \"Daddy;\" she’ll change between mom and daddy as the PC’s gender changes. If she was fathered by someone OTHER than the PC, she calls the PC by their name. Simple enough?

private function championRef():String {
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) return player.mf("Daddy","Mom");
	else return player.short;
}

override public function helspawnFollower():Boolean {
	return flags[kFLAGS.HELSPAWN_AGE] == 3;
}

public function helspawnChastity():Boolean {
	return flags[kFLAGS.HELSPAWN_PERSONALITY] < 50;
}
override public function helPregnant():Boolean {
	return (helScene.pregnancy.isPregnant);
}

//Hel’s New Appearance Screen: Taking Things Into Account
internal function heliasAppearanceScreen():void {
	clearOutput();
	helScene.helSprite();
	outputText(images.showImage("monster-hel"));
	outputText("Hel the salamander stands seven feet tall, with pale skin and thick, bright-red scales covering her arms and legs, though she has a normal human torso and face.  A fiery tail swishes gaily behind her, blazing with a ");
	if(flags[kFLAGS.HEL_BONUS_POINTS] < 150) outputText("bright orange glow");
	else outputText("bright white glow");
	outputText(" that lets off a pleasant heat, though it never seems to burn you.  Hel is wearing her scale bikini and a leather thong, and using her scimitar as a weapon");
	//if Isabella is cool: 
	if(flags[kFLAGS.HEL_ISABELLA_THREESOME_ENABLED] >= 1) outputText("; she’s got her blue bandanna wrapped around her head, mostly obscured by her fiery hair");
	outputText(".  She has a human face, with bright red eyes, gentle, feminine features and a smattering of pale scales on her cheeks, like freckles.  Hel has long, bright-red hair bound in a pony-tail that hangs down her back.  She has wide-flared hips and a soft, squishy butt.  Her two reptilian legs are visibly adorned with scales and claws, ending in soft, leathery soles.");
	if (flags[kFLAGS.HELSPAWN_NAME] != 0) {
		outputText("  A dark trio of scars run down Hel’s thighs, left by " + flags[kFLAGS.HELSPAWN_NAME] + "’s youthful claws.");
	}
	else {
		switch (helScene.pregnancy.event) {
			case 1: //She's pregnant, but no special text yet
					break;
			case 2: outputText("  Hel's just starting to show a little bulge of pregnancy.");
					break;
			case 3: outputText("  Hel’s belly is starting to look fairly bloated, swelling with her child.");
					break;
			case 4: outputText("  Hel’s belly is positively gravid, full of a little salamander child.");
					break;
			default: //She's not pregnant, check if she's ready for it
					if (flags[kFLAGS.HEL_BONUS_POINTS] >= 150) outputText("  Hel’s long, reptilian tail is currently burning white-hot, signaling her body’s ready for motherhood.");
		}
	}
	outputText("\n\nHel has a pair of big, soft E-cup breasts, each with a 0.5 inch nipple at their tip.");
	outputText("\n\nShe has a warm, wet, and accommodating pussy between her legs.");
	outputText("\n\nHel has a single cock-draining asshole between her buttcheeks, right where it belongs.");
	menu();
	addButton(0,"Next",helFollower.heliaFollowerMenu);
}

//" + flags[kFLAGS.HELSPAWN_NAME] + "’s Appearance Screen
private function helSpawnsAppearanceScreen():void {
	clearOutput();
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("Your ");
	else outputText("Hel’s ");
	outputText("salamander daughter, " + flags[kFLAGS.HELSPAWN_NAME] + ", stands about six-foot-six tall, with pale skin and thick, ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 1) outputText("chitin-black");
	else outputText("bright-red");
	outputText(" scales covering her arms and legs, though she has a normal human face and torso.  A long leathery tail swishes happily behind her, surrounded by a dim fiery aura that emits a pleasant heat, though thankfully it isn’t hot to the touch, seemingly incapable of harming you.  " + flags[kFLAGS.HELSPAWN_NAME] + " is wearing ");
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) outputText("a scale bikini, just like her mother’s");
	else outputText("a short skirt, thigh-high boots, and a sky-blue blouse, in stark contrast to her mother’s sluttier attire");
	if(flags[kFLAGS.HEL_ISABELLA_THREESOME_ENABLED] >= 1) outputText(", with a brightly-colored scarf wrapped around her neck");
	outputText(". She has a human face, with ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("golden");
	else if(flags[kFLAGS.HELSPAWN_DADDY] == 2) outputText("bright green");
	else outputText("crimson");
	outputText(" eyes, girlish features, and a smattering of pale red scales on her cheeks, like freckles.  Her short, dark-red hair cuts off just below her ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 2) outputText("puppy-dog");
	else outputText("reptilian");
	outputText(" ears, and it’s adorned with a pretty pink bow.  She has surprisingly large hips, and a big, squishy butt behind her.  Her reptilian legs are covered with thick, dark scales, ending in short claws atop soft, leathery soles.");
	outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " has a pair of perky, palmable C-cup breasts, each with a sensitive half-inch nipple at its tip.");
	
	outputText("\n\nShe has a warm, wet, and accommodating pussy between her legs, mirrored by a tight little asshole between her plush buttcheeks, right where it belongs.");
	menu();
	addButton(0,"Next",helspawnsMainMenu);
}

//Hel Affection Reaches 250 & Salamander is @ Camp
//[Play at night, after PC goes to sleep (with or without anybody)]
public function heliaBonusPointsAward():void {
	if (!recalling) flags[kFLAGS.HELIA_KIDS_CHAT] = 1;
	helScene.helSprite();
	outputText("\n<b>That night...</b>\n");
	outputText("Your sleep is disturbed by a gentle tugging on your [armor].  You groggily swat at whatever's nudging at you, groaning about the hour until your eyes finally open wide enough to recognize Helia kneeling over you, a deeply distraught look in her eyes.  \"<i>[name]? [name] wake up, I need to talk to you. Please?</i>\"");
	
	outputText("\n\nYou nod, rubbing the sleep out of your eyes as you stagger up onto your [feet].  You note that Hel's wrapped her old cloak tightly around herself, held closed so that nothing but her face is visible.  You start to ask what's up, but Hel shushes you, saying she needs to talk to you privately.  ");
	//{If Hel's the only one at camp: 
	if(camp.companionsCount() == 1) outputText("You cock an eyebrow, saying that you're already alone, but she shakes her head, saying she needs somewhere private, away from prying eyes.  ");
	outputText("You nod your assent, and let her help you up and lead you away from camp.  You follow Hel through the darkness, stumbling after her until you're hidden away beneath the old ruined wall a stone's throw from the perimeter.  Safely tucked away beneath the shadow of the wall, Hel takes your hands in hers and hesitantly, says, \"<i>Look, I don't... this isn't easy for me, okay?  But I have to tell you something, [name].  And it's important, alright?  To me, anyway. I wouldn't bring it up if I could deal with it myself, honest.  But I can't and... and I'm afraid, [name].</i>\"");
	
	outputText("\n\nYou squeeze Helia's hands and reassure her as best you can, saying she can tell you anything.  She looks away, blushing hotly; beneath her cloak, the radiant fire of her long tail shines brighter, casting a pale glow even through the heavy fabric.  You ask again what's wrong, and with a little coaxing, Hel looks up, her bright crimson eyes staring into yours.");
	
	outputText("\n\n\"<i>I don't just like you, [name] - I mean, I do.  Like you, I mean.  But it's... it's more than that, you know?  Sure, I've said the word, but I say 'love' to a lot of people, a lot of things.  I love your ");
	if(player.hasCock()) outputText(multiCockDescriptLight());
	if(player.hasVagina() && player.hasCock()) outputText(" and your [chest] and your [vagina]");
	if(!player.hasCock() && player.hasVagina()) outputText(" [vagina] and [chest]");
	outputText(" and everything else about you.  But... but that doesn't mean anything.  It doesn't.  I say I love minotaur dicks, and centaurs, and those two fox pricks at the bar filling both my holes, and I love beer and fighting and ramming my tail up peoples' assholes.  But that's not real love, right?  Love is - oh, god, I'm making a mess of this.  Again. I keep doing this; it always works out so much better in my head.</i>\"");
	
	outputText("\n\n\"<i>I guess what I'm trying to say is... I love you, [name].  I really, really do.  Not fake, shitty, stupid love; not me saying it in the heat of the moment.  I've been thinking about this for a while, now.  You've been so good to me [name], better than I deserve.  You saved my family, you've given me a place to live, and more kindness than I could ever have imagined when I jumped you in the plains so very long ago.</i>\"");
	
	outputText("\n\n\"<i>That's not what I wanted to tell you, though.  I'd have sat on that for years if I could have, but something's changed.  I've talked to my father, and he says it's normal.  He just... just chuckled and shook his head, gave me this knowing look.  But I'm still afraid, [name].  I can't deal with this on my own, but... but I have to know, before we go any further: do you love me, too?  And please, please don't just say yes because it's what I want to hear.  I promise I won't run off or throw a tantrum if you say no; I liked where we were before I opened my big stupid mouth.  So, what do you say, [name]? Do you love me?</i>\"");
	menu();
	addButton(0,"Yes",yesHeliaILoveYourButtHoleReaming);
	addButton(1,"No",noYouDontLoveHeliaYouMonster);
}

//No
private function noYouDontLoveHeliaYouMonster():void {
	clearOutput();
	helScene.helSprite();
	outputText("As much as you enjoy the sex, as much as you like Hel, you can't say you feel that way towards her.  You grasp her shoulders, telling her as gently as possible how you feel.  She nods slowly as you speak, rubbing at her eyes by the time you're finished.");
	outputText("\n\n\"<i>Well, thanks for being honest, [name].  I... I really do appreciate it.  But, maybe you can still help me with my problem.  I'll understand if not, but still, I have to ask: ");
	//[HelLove to NO]
	if (!recalling) flags[kFLAGS.HEL_LOVE] = -1;
	heliaLoveFollowup();
}

//Yes
private function yesHeliaILoveYourButtHoleReaming():void {
	clearOutput();
	helScene.helSprite();
	outputText("Smiling, you tell her yes.  The salamander cries out with joy, jumping into your arms and kissing you, squeezing you so tightly that you feel like you're about to black out by the time she breaks the kiss, stepping back with chest heaving.");
	outputText("\n\n\"<i>Wh-why didn't you tell me before, anyway?</i>\" she asks, nuzzling her cheek into your [chest].  \"<i>Could have saved me all this trouble.</i>\"");
	outputText("\n\nYou shrug, saying that you never really felt like you had the chance until now... and it's a lot cuter when she bumbles through a confession.  Helia gives you a gentle punch on the shoulder, but softens the blow with another series of kisses along your [chest] and neck, holding you close as the two of you revel in the newly-revealed love you share.  After a few minutes, though, Hel steps back and says, \"<i>I love you, [name], with all my heart.  You're the person I want to spend the rest of my life with, if you'll have me.  But I still have to tell you what's wrong. The reason I brought this all up: ");
	//[HelLove to YES]
	if (!recalling) flags[kFLAGS.HEL_LOVE] = 1;
	heliaLoveFollowup();
}

//Combine
private function heliaLoveFollowup():void {
	helScene.helSprite();
	outputText("You're not from here, so you probably don't know much about salamanders.  Basically, we're effectively infertile.  I can get filled with gallons of cum day in and day out, and chances are none of it will take inside me.  I've always thought I could slut around as much as I wanted, and I'd never have to worry about the consequences.  But... that's not forever, I guess.  When a salamander girl finds the person she wants to be with forever, ");
	//if PC is female/herm:
	if(player.hasVagina()) outputText("even another woman, it seems, ");
	outputText("we... change.</i>\"");
	
	outputText("\n\nHel reaches up and undoes the clasp on her cloak.  When it falls away, your eyes are drawn immediately to her tail - once burning with a blood-red hellfire, her leathery tail is now surrounded by a pale radiance, shimmering like white gold.  Your eyes widen, but Hel flinches back as you try to approach.  \"<i>It's called the Pale Flame, [name].  Just like it looks.  When a 'mander girl finds the person she wants to be with, our bodies change.  While I'm like this... I'm as fertile as a goblin, and... and I </i>want<i> to be.  I want... I need... a child, [name].  I want to be pumped full of cum until I'm bloated, to bear a little salamander for us to raise and love.  ");
	//If HelLove = No:
	if(flags[kFLAGS.HEL_LOVE] == -1) outputText("Even if you don't love me, you'd love our child, right?  You can fuck me full of kids, or even... even get someone else to, I don't care.  I just </i>need<i> it, [name].  More than anything else in the whole wide world.");
	else {
		outputText("I love you, [name].  I love you so much.  I want to share this with you.  ");
		if(player.hasCock()) outputText("You'll fuck me full of kids, right?  Please?  Give me your seed, [name].  Give it all to me until I'm fucking gravid with your salamander babies.");
		else outputText("Even if you can't fuck me full of babies... you could grow a dick!  There's plenty of things in this god-forsaken world that do that. O-or if you don't want to, I bet I can get one of the fox-girls, or a minotaur, or something.  You know I can find a dick somewhere, just say the word.");
	}
	outputText("  So what do you say, [name]?  Let's have a kid!</i>\"");
	menu();
	if(player.hasCock() && player.cockThatFits(helFollower.helCapacity()) >= 0) addButton(0,"Have A Kid",haveAKid);
	else if(player.hasCock()) outputText("  <b>Unfortunately, you're too big to squeeze inside Helia to do the business yourself.  You might need to shrink down some.</b>");
	addButton(1,"Another Dad",getAnotherDad);
	addButton(2,"No Or Later",noKidsHel);
}

//[Have a Kid] (PC has a Dick)
public function haveAKid():void {
	var x1:int = player.cockThatFits(helFollower.helCapacity()) + 1;
	clearOutput();
	helScene.helSprite();
	if (!recalling) {
		outputText("<b>New scene is unlocked in 'Recall' menu!</b>\n\n");
		helScene.pregnancy.knockUpForce(PregnancyStore.PREGNANCY_PLAYER, PregnancyStore.INCUBATION_SALAMANDER);
	}
	outputText("You tell Hel that you're in this with her, that you want to give her that child she seems so desperate for.  She beams at you, smiling from eye to eye before leaping into your arms, pressing her lips hard to yours.  You kiss her back, wrapping your arms around her hips to support her as her powerful legs wrap around your waist; you push her up against the ruined wall, hands searching across her taut, hot flesh until you toss her bikini top aside, letting her hefty tits free.  \"<i>Oh god yes,</i>\" she moans as you trail kisses from her lips, down her neck to her stiffening nipple.  \"<i>I want this so much, more than anything.  Give it to me, [name].  Don't hold back!</i>\"  Your fingers sink into her pliant flesh as you suckle on her exposed teat, groping her other tit and soft ass as she moans and squirms in your arms.  Clumsily, Hel's claws brush down your body, peeling off your [armor] until your [cock "+x1+"] flops into her lap.  She locks her scaled fingers around your manhood, roughly stroking you until you're stiff as diamonds in her grasp.");
	
	outputText("\n\nYou shudder as her fingers work your [cock "+x1+"], but don't let up on your end for a second.  You brush and knead Hel's nipple between your teeth, letting your hands drift down to her wide hips and gropable ass, slowly stripping her of her scale bottom and pulling it off her legs.  With your lover bare and naked, you slip down between her legs, letting her hook them over your shoulder to give you a good view of her dripping cunt.  Your tongue laps across her labia, drawing a long, lewd moan from Hel.  She runs her fingers through your [hair], urging you onward; at her lusty moans, you dig in, sucking on her prominent clit and drilling your tongue between her inner folds.  You gasp into her when Hel's lengthy tail wraps around your shoulders, the pale flame soothingly warm on your " + player.skinFurScales() + " as her leathery appendage works its way down to the [cock "+x1+"] dangling between your [legs].  You groan with sudden need as the tip of her tail brushes your most sensitive flesh, tickling ");
	if(player.balls > 0) outputText("your [balls]");
	else outputText("the base of your prick");
	outputText(" before coiling around the shaft with serpentine dexterity.  Her tail contracts and squeezes, undulating across your [cock "+x1+"] until it finally massages a thick blob of pre from your [cockhead], dribbling out to stain the wasteland ground.");
	
	outputText("\n\nSuddenly, Helia grabs your shoulders and shoves you down.  You flop onto your back, tail-encased prick standing straight up like a flagpole as Hel straddles your [hips], vigorously fingering herself as her tail lines your cock up with her drooling womanhood.  Your breath catches as your [cockhead] brushes her boiling juices, slickening your entry as she slides down your pole.  You grab Hel's flared hips, guiding her in as she envelopes your [cock "+x1+"] in the roiling inferno inside her.  Her tail unravels from around your throbbing shaft as she descends, tantalizingly slowly; she takes the better part of a minute before her groin is cozily joined to yours, her hungry maw kissing the very base of your lusty prick.");
	
	outputText("\n\nCompletely impaled on you, Hel's chest heaves with lust and need.  She cups one of the massive orbs, squeezing her pert nipples between a pair of crimson fingers as her other hand ");
	if(player.biggestTitSize() <= 2) outputText("supports her, pressing down on your [chest]");
	else outputText("gropes one of your tits, kneading your tender breasts under you squirm underneath her, unable to hold in your pleasured little gasps");
	outputText(".  Slowly, your salamander lover starts to grind her hips on your [cock "+x1+"], her muscles contracting and squeezing the rigid shaft inside her with every shift of her hips.  You both moan aloud, half-lost in a miasm of pleasure.  \"<i>God, I wish I could stay like this forever,</i>\"  Hel whispers, just on the edge of hearing.  \"<i>There's no one I'd rather be with, [name].  No one I'd rather have give me the child my body craves.</i>\"");
	
	outputText("\n\nSomething in Hel's voice gives you pause, but before you can think too much into it, she plants her hands firmly on your [chest] and starts to rise, dragging inch after inch of your prick out of her until only the [cockhead] is still inside her, smearing her lips with thick, creamy pre.  Then, grinning at you, Hel slams back down, taking you in one brutal thrust that leaves you both moaning; a moment later and she's riding your cock, bouncing on the rigid pole so fast that your combined juices go flying everywhere, drenching the barren earth around you.  Helia fucks you with reckless abandon, her voice edging higher and higher as she cries and moans.  Caressing your [chest], fondling herself, teasing your [asshole] with the tip of her tail, Hel seems to lose all restraint as she takes your cock again and again, devolving to her basest sexual instincts, rutting like an animal until you're sure you'll wake up bruised in the morning.");
	
	outputText("\n\nYou lay back and enjoy the rough fucking for several minutes, eventually taking her hands and holding them fast as she moves, locking your fingers with hers and pulling her down into a long, tongue-filled kiss.  The two of you stay like that for a long while, your breath hot on each others' skin as you wrap your arms around your lover's waist; to your surprise, Hel leans away from you, just long enough to pull off the tie on her ponytail, letting her rich red hair cascade down around you, veiling your faces as she kisses you again.  You run your fingers through her thick locks, breathing in the fiery smell of her, tasting her sweet lips on yours, feeling her innermost depths conforming around your breeding pole.  Holding Hel tight, you roll the pair of you over, landing with your cheek nestled in the cleft of her bosom.  She gasps as you run your tongue across the soft, succulent flesh of her tits, gently thrusting your [cock "+x1+"] into her.  Settling onto her back, Hel spreads her legs wide for you, letting you slip right in as her heels hook behind your [butt], her hands digging into your back to guide your movements.  Inside of five thrusts and she's moaning like a bitch in heat, writhing beneath you.  She claws at your back, making you wince - and spurt a mess of pre into her eager hole.");
	
	outputText("\n\nYou clench your teeth and start to piston into her, picking up the pace until your every thrust causes the lusty salamander to scream your name to the heavens.  Spurred on by Hel's ecstatic cries and her vice-like grip around your [cock "+x1+"], it isn't long before you can feel the mounting pressure of your inevitable release mounting furiously inside your [balls].");
	//If PC has lost Anal Virginity:
	if(player.ass.analLooseness > 0) outputText("\n\nBetween rough thrusts into your lover, you can feel her pale-glowing tail snake itself around your [legs], the slender little tip brushing between the cheeks of your [butt].  You can't help but gasp as it presses into your clenched backdoor, teasing your [asshole] with probing thrusts and flicks across the brim.  Helia grins up at you as your sphincter finally relaxes, letting the first inches slither inside, undulating through your anal passage.  \"<i>I'm going to milk every last fucking drop out of you,</i>\" she whispers huskily, breath hot on your neck. You moan in response as her ever-thickening appendage wriggles into you, penetrating you to the beat of your own [cock "+x1+"]'s thrusts into your lover's cunt.  Suddenly, a powerful burst of pleasure threatens to overwhelm you, demanding every ounce of your willpower to keep from cumming on the spot.  Hel coos encouragingly as you gasp, thrilled to have found your most sensitive place.  Now that's she's found it, Hel lets her tail go wild in your ass, tip battering against your prostate as the thicker trunk writhes and wiggles through your stretched hole.");
	
	outputText("\n\nYou give Hel a final few thrusts, doing your best to hold your orgasm back until the last minute.  But she never lets up, bucking her hips and squeezing your cock, urging you onwards until with an explosive roar you let loose, shooting your hot load into her hotter depths.  Hel throws her head back and screams, \"<i>GOD YES!  Give it to me, [name].  Don't you dare hold anything back!</i>\"  Indeed, you don't; your prick fires off one sticky wad of potent seed after the other, slathering her womb with cum until it drools out of her well-fucked pussy.  With a final, exhausted gasp, your throbbing prick lets out its last spurt, a final plug of salty spunk to fill her needy hole before you collapse atop your lover, panting into the valley of her cleavage as her arms and legs wrap around you, holding you tight while you deflate inside her.");
	
	outputText("\n\n\"<i>Oh, [name],</i>\" she moans, kissing you, \"<i>");
	if(player.pregnancyIncubation > 0) outputText("We're going to be mothers!");
	else outputText("You're going to be a father... and me a mother!");
	outputText(".</i>\"  You start to reply, when you're suddenly upended, landing back on your back with Helia atop you, fingers brushing along the cock buried twixt her legs.  \"<i>Oh, don't think you're getting away that easy, lover mine... my love.  I've gotta make sure your seed took, and that... that's going to take all night long.</i>\"");
	
	outputText("\n\nYou gulp, and wince as Hel starts to move atop your battered cock - and not for the last time this sleepless night!");
	if (!recalling) player.sexReward("vaginalFluids", "Dick");
	doNext(HaveAHellKidPartII);
}

private function HaveAHellKidPartII():void {
	var x1:int = player.cockThatFits(helFollower.helCapacity()) + 1;
	clearOutput();
	if (!recalling) camp.cheatSleepUntilMorning();
	outputText("With the last ounce of energy in your sixth - or is it seventh? - wind, you deliver a sharp crack across Helia's beet-red backside and roar out as another potent surge of seed rushes into her snow-white hole, still slick with the leavings of your last half-dozen discharges.  You grab her thick hips and slam your [cock "+x1+"] deep inside her as the last shot fills her womb a little bit fuller, the excess spurting out to wet the cum-stained ground beneath the salamander's knees.");
	
	outputText("\n\nThe sun's out by now, its radiant glow kissing your bare, sweat-slick flesh as you finally come to rest.  You lean back just enough to let your limp cock flop free of Hel's draining cunt, ushering out a deluge of salty seed that pools between her spread legs.  Without your prick to support her, Hel flops aside like a rag doll, chest heaving, still bearing the white marks of an errant orgasm.  She manages to smile up at you even as her fingers idly play across her swollen hole, knuckle-deep into the gallons of cum you've pumped into her over the course of the night.  Giving in to your exhaustion, you slip down beside your beloved, resting your chest on her shoulder.  Her arm wraps around you, holding you close as she plants a tender, loving kiss on your brow.");
	
	outputText("\n\n\"<i>That was... amazing.  God, it's like we were made for each other.  The way you move, the way you fill me and fuck me and caress me.  I'm... so glad I found you, [name].  It seems like a lifetime ago, like I was another person back then.  Maybe I was, but... there's nowhere I'd rather be, nowhere on Mareth or beyond than with you, the one I love.  Oh god, I'm so in love with you, [name].  So very much in love,</i>\" she says, running her fingers through your [hair].  You lean up and kiss her, wrapping your arms around your lover as your lips press against hers, tasting the sweet touch of hers.");
	
	outputText("\n\n\"<i>Oh, shit,</i>\" Hel says, breaking the kiss and staring wide-eyed into the morning sky.");
	
	outputText("\n\n\"<i>What's wrong?</i>\"");
	
	outputText("\n\n\"<i>I-I really am going to be a mother.  I can feel it, [name].  Your seed taking inside me, the dawn of a new life.  I just hope... I hope this wasn't a mistake, [name].</i>\"");
	
	outputText("\n\nYou lift yourself up onto your elbow, staring at your love as her fiery eyes gaze into the void.  \"<i>I thought this was what you wanted, Hel.  You were-</i>\"");
	
	outputText("\n\n\"<i>Yeah, I know.  Forget about it, I'm fine.  Really.  It's just that this happened all so suddenly, you know?  This isn't exactly where I saw myself a year ago.  Not that I'm complaining,</i>\" she adds, turning back to you with another kiss, squeezing your shoulder.  \"<i>I just hope I'm ready, I guess.  Until the Pale Flame took, I'd never really thought about being a mother.  Never really wanted it.  But last night, it was like I was possessed, like I couldn't control myself.  I just... needed you.  And there you were, like always, ready to help.  I love you with all my heart, [name]");
	if(flags[kFLAGS.HEL_LOVE] == 1) outputText(", and I'm so very, very glad you love me back.");
	else outputText(", even if you can't say the same.  And that's alright; it doesn't change my heart, and it never will. I love you");
	outputText(".</i>\"");
	
	outputText("\n\nThe two of you snuggle up for a good long while, letting the edge of your sexual exhaustion subside as you watch the sunrise, content to lie in each others' arms.  After a blissful eternity, though, you both rise and collect the scattered bits of Hel's scale mail and your [armor], laughing and teasing as you redress, exchanging the occasional kiss or caress until the pair of you are clothed, your weapons secured.  Finally, Helia slips into your arms, planting a long kiss upon your lips.  \"<i>I'm glad we're in this together, my love.  I'm going to... to need you during this.</i>\"");
	
	outputText("\n\nYou tell her to rest easy: that you'll be there for her every step of the way.  She smiles ");
	if(player.tallness >= 90) outputText("up ");
	else if(player.tallness <= 72) outputText("down ");
	outputText("at you, holding you tight for a long moment before stepping away, still holding your hands.  \"<i>This is all new to me, [name].  I never pictured myself as a mother, with a mate and a stable, safe home - or as stable and safe as anything these days - but with you by my side, there's nothing I can't take on.</i>\"");
	
	outputText("\n\nYou give your lover one last kiss before taking her back to camp proper, never letting her hand slip from yours all the way.");
	//[Back to Camp menu]
	doNext(recalling ? recallWakeUp : camp.returnToCampUseOneHour);
}

private function getAnotherDad():void {
	clearOutput();
	helScene.helSprite();
	//[Another Dad] (PC has no dick)
	if(!player.hasCock()) {
		outputText("You tell Helia you'd love to a share a child with her, but you're not... properly equipped for the endeavor.  \"<i>That's fine!  I can... I can wait, a little.  I-if you want to go grow one, I mean.  If not, then we can find someone with a cock.  ");
		if(player.statusEffectv1(StatusEffects.TelAdre) >= 1) outputText("There's Miko and Mai from the bar.  Mai's said she wanted a kid, but can't take care of one... she'd probably be willing to fuck one into me!  If that's not alright, then... lemme think.  ");
		outputText("Uh, maybe not a minotaur... they always plug more minotaurs, and I don't want a bull coming out of my twat.  Uh, maybe I could track down one of the spider boys from the swamp and jump on </i>his<i> dick.  They're pretty cute, right?  Dunno how that'd affect a child, though.  Maybe he'd end up with like, extra eyes, or chitin?  Still, better than an imp or some shit.  So what do you think?  Wanna grow a dick, or leave the knocking-up to someone else?</i>\"");
		//{Options in next section}
	}
	//[Another Dad] (PC has a dick)
	else {
		outputText("\"<i>W-wha?</i>\" Hel says, cocking an eyebrow.  \"<i>You sure, [name]?  I-if you don't want to be the dad, I guess I understand.  But why?  Am I not... no, nevermind.  I don't want to know.  Okay, uh, we can find someone with a cock.  ");
		if(player.statusEffectv1(StatusEffects.TelAdre) >= 1) outputText("There's Miko and Mai from the bar.  Mai's said she wanted a kid, but can't take care of one... she'd probably be willing to fuck one into me!  If that's not alright, then... lemme think.  ");
		outputText("Uh, maybe not a minotaur... they always plug more minotaurs, and I don't want a bull coming out of my twat.  Uh, maybe I could track down one of the spider boys from the swamp and jump on </i>his<i> dick.  They're pretty cute, right?  Dunno how that'd affect a child, though.  Maybe he'd end up with like, extra eyes, or chitin?  Still, better than an imp or some shit.  So what do you think?</i>\"");
	}
	menu();
	//{If Tel'Adre has been discovered: [Mai]}
	if(player.statusEffectv1(StatusEffects.TelAdre) >= 1) addButton(0,"Mai",maiWouldBeTheBestInseminator);
	//[Spiderboy]
	addButton(1,"Spiderboy",spiderboyWouldBeBestDad);
	//[I will] (If PC has a dick)
	if(player.hasCock() && player.cockThatFits(helFollower.helCapacity()) >= 0) addButton(2,"I Will",haveAKid);
	else if(!player.hasCock()) addButton(2,"I Will",growingDicks4Hel);
	addButton(3,"No Or Later",noKidsHel);
}

private var recallTemp:int = 0;

//Mai
private function maiWouldBeTheBestInseminator():void {
	clearOutput();
	helScene.helSprite();
	outputText("You tell Hel that you think Mai would make a lovely father.  Helia nods her agreement, saying, \"<i>Yeah, I agree.  She's a beauty, and I'm sure our child will be stunning... you wouldn't mind if she visited, right?  I mean, you and I will be raising our kid - and he'll be ours for sure - but I'm sure Mai will want to at least visit her kid.</i>\"");
	outputText("\n\nYou nod, and say that's fine.  Hel beams at you, giving you a peck on the cheek before running back to camp, saying she's going to go track down the foxy sisters as soon as she can.  You suppose the next time you see her, Hel's probably going to be pregnant with the child you'll be helping to raise.");
	if (!recalling) {
		helScene.pregnancy.knockUpForce(PregnancyStore.PREGNANCY_PLAYER, PregnancyStore.INCUBATION_SALAMANDER); //Yes, it's Mai's baby, but that's already tracked separately
		flags[kFLAGS.HEL_NTR_TRACKER] = 1;
		flags[kFLAGS.HELSPAWN_DADDY] = 2;
		doNext(playerMenu);
	} else {
		recallTemp = 2;
		doNext(helGotKnockedUp);
	}
}
//Spiderboy
private function spiderboyWouldBeBestDad():void {
	clearOutput();
	helScene.helSprite();
	outputText("You tell Helia to go find a spider boy to jump.  She beams at you, and skips off toward the swamp calling, \"<i>Thank you, thank you thank you, [name]!</i>\" over her shoulder as she goes.  You suppose the next time you see her, Hel's probably going to be pregnant with the child you'll be helping to raise.");
	if (!recalling) {
		helScene.pregnancy.knockUpForce(PregnancyStore.PREGNANCY_PLAYER, PregnancyStore.INCUBATION_SALAMANDER); //Yes, it's the spider's baby, but that's already tracked separately
		flags[kFLAGS.HEL_NTR_TRACKER] = 1;
		flags[kFLAGS.HELSPAWN_DADDY] = 1;
		doNext(playerMenu);
	} else {
		recallTemp = 1;
		doNext(helGotKnockedUp);
	}
}

//I Will (PC ain't got a wang)
private function growingDicks4Hel():void {
	clearOutput();
	helScene.helSprite();
	outputText("You tell Hel to give you a little while, that you'll go find something to grow a cock for her.");
	outputText("\n\n\"<i>Thank you!  Thank you so much, [name].  I really, really wanted for it to be our child. I'll wait, but hurry.  I don't know how much longer I can stand this... this need!</i>\"");
	outputText("\n\nOnce you've finished with Hel, she leaves you with a longing look as you head back to camp.  Eventually, you manage to go back to sleep...");
	//[Resume night]
	doNext(recalling ? recallWakeUp : playerMenu);
}

//[No Kids]
private function noKidsHel():void {
	clearOutput();
	helScene.helSprite();
	outputText("You shake you head and say no, you don't want to have children.  Not right now, anyway.  ");
	if(player.hasCock() && player.cockThatFits(helFollower.helCapacity()) >= 0) outputText("You couldn't if you wanted to anyway - you're too big to fit.  ");
	outputText("As the words leave your lips, you can see Hel's shoulders slump, a crestfallen look spreading across her face.  \"<i>A-are you sure?  Please, [name], I really, really want a child.  For </i>us<i> to have one.</i>\"");
	outputText("\n\nYou tell her that no, at least for now you aren't interested.  She begs and pleads for several minutes, but you hold your ground.  Finally, she relents.  \"<i>Alright, [name].  I... I'll respect that, I guess.  Dad gave me some herbs, said as long as I take them, I should go back to normal.  If that's what you want, I'll start on them.  Just tell me if - when - you're ready, [name].  I will be.</i>\"");
	
	outputText("\n\nShe leans up and gives you a peck on the cheek before wandering back to camp, leaving you standing alone in the dark with your choices.  Eventually, you manage to go back to sleep...");
	//[Resume night]
	doNext(recalling ? recallWakeUp : playerMenu);
}

//Hel Dun Got Knocked Up (Play first time PC goes to Hel's menu after telling her to get knocked up by someone else)
//Proc day after dad choice @ 8AM.
public function helGotKnockedUp():void {
	helScene.helSprite();
	if (!recalling) {
		flags[kFLAGS.HEL_NTR_TRACKER] = 2;
		outputText("<b>New scene is unlocked in 'Recall' menu!</b>\n\n");
	}
	outputText("<b>After your decision with Helia last night,</b> you decide to check in on your lusty salamander.  You find her sitting on a rock near her part of camp, knees held close to her chest, seemingly deep in thought.  She gives you a ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 2 || recallTemp == 2) outputText("warm ");
	else outputText("wan ");
	outputText("smile as you approach, scooting over to allow you to sit beside her.  She almost seems distant, though she's quick to wrap her tail around your waist, hugging you close against her.");
	outputText("\n\nAfter a few quiet minutes, you finally ask, \"<i>How'd it go?</i>\"");
	outputText("\n\n\"<i>Well... let's just say it worked.  Unless you wanna hear the details?</i>\" she asks conspiratorially.");
	menu();
	//Hel Got Knocked Up by Mai
	if(flags[kFLAGS.HELSPAWN_DADDY] == 2 || recallTemp == 2) {
		addButton(0,"Sure",sureHelGimmeMaiDetails);
		addButton(1,"Nope",dontTellMeAboutMai);
	}
	//Hel Got Knocked Up by a Spiderboy
	else if(flags[kFLAGS.HELSPAWN_DADDY] == 1 || recallTemp == 1) {
		addButton(0,"Sure",sureHelGimmeSpidahBoyDetails);		
		addButton(1,"Nope",dontTellMeAboutSpiderboy);
	}
	//clear recall stuff
	if (recalling) recallTemp = 0;
}

//Sure
private function sureHelGimmeSpidahBoyDetails():void {
	clearOutput();
	helScene.helSprite();
	outputText("Hel chuckles, shaking her head.  \"<i>So I go to the swamp and just shout out 'Who wants to fuck a baby into this fertile womb, you chitiny bastards,' and sure enough, I got plenty of volunteers.  Whole horde of creepy crawlies came out of the woodwork, but I saw the looks in their eyes: corrupt, all of 'em.  I don't want my kid half way to cumming out his soul before he's had a chance, you know?  So I did my berzerker thing, fought 'em off.  The swamp's getting more and more dangerous every month, I think.  Something in the water maybe, who knows.  Anyway, after I dispatched the crazies, I went deeper, just a little");
	if(followerKiha()) outputText(", toward hotwings' old place");
	outputText(". Took a while, but eventually I just sort of stumbled on this couple of spidergirls, just as cute as could be.  They wander up to me, all cautious, and ask if I was serious about the whole baby thing.  So I say, 'Yeah, sure,' and they get this big, dopey grin, both of 'em.</i>\"");
	
	outputText("\n\n\"<i>They tell me they're sisters, and they've got a little brother who's looking for his first mate.  But he's terrified of just jumping people to fuck 'em (kind of old fashioned, but hey, what're you gonna do?), and the girls are afraid he'll get dragged off by some demon drider thing and raped to death.  So the girls say if I'm looking to breed, they've got a plan: let me pretend to be all helpless, and they'll sic their brother on me; he gets to feel like the big predator man, and I get fucked full of seed.  Win-win.  So they take me to a clearing, tell me to wait.  Few minutes later, and this little bitty spiderboy wanders out of the jungle - and I mean, his mother must've been a goblin, cuz he's a runty little shit, wrapped up in this silk shift down to his knees when his sisters have their tits hanging out in the wind.  Poor thing's shy as can be, but he blabbers something about tying me up and having his way with me, you know the drill.  So I swoon and drop my sword and get all dramatic and beg him not to hurt me.</i>\"");
	
	outputText("\n\n\"<i>I swear it took him like, half an hour to actually just tie me up properly.  His spinners are spurting like little cocks everywhere, and he's apologizing and trembling all over until I actually have to help the poor kid get me all tied up and gagged.  But then - and this is rich - he wiggles out of his shirt, and oh my god the kid's a fucking tripod.  I mean he puts minotaurs to shame, and how.  Here's this shy kid, never had a girl before, and he's packing a god-damn monster down under");
	//If PC has a giant wang:
	if(player.biggestCockArea() >= 20) outputText(", though still nothing compared to you, lover mine");
	outputText(".  So he's rock-hard now, trembling with excitement; he spreads my legs nice and wide, stroking himself as he lines up and... oops, wrong hole.  That was a surprise, lemme tell you.  Not an </i>unpleasant<i> surprise, mind you, but still.  Just about rips me in half with this giant thing, slides all the way to the hilt and just stops, like he doesn't know what to do.  He just sort of moans and wiggles his hips a little, hugging himself to me and burying his head in my chest.</i>\"");
	
	outputText("\n\n\"<i>Well, what's a girl to do?  I get my hands free pretty easy, and run my fingers through his hair, tell him everything's okay, he's doing great.  Poor kid looks up at me with these huge puppy-dog eyes and asks, 'R-really?' like he's so shocked.  God damn, he was cute.  So I give him a little kiss, help him pull out and line up with the real prize.  Oh, you should have seen his face when he slid home: tongue rolled out, eyes crossed.  He just about came right there, but I clenched down hard, told him he'd have to work for it.  I pull him in tight, just bury his face in my tits and guide his hips, getting him working nice and slow.  But that boy, give him a little urging on and he's a natural... in about five minutes he's got me on all four and humping away, plunging this fucking monster in until I'm screaming and cumming and he is too.  Oh, we made quite the mess, we two.</i>\"");
	
	outputText("\n\n\"<i>So finally he rolls off of me, flops down with his monster cock just about to his chin lying on top of him.  Well, I kind of liked him by then, so I curl up with him for a little cuddle, tell him just how good a breeder he is, what a fine specimen he was, et cetera.  But then the little bastard opens his mouth and, real quiet like, asks if we can go again - and if I'd please bugger him with my tail while I rode his cock.  Oh, well, how can I refuse?  Okay, maybe he didn't </i>ask<i> in so many words, but that's what he </i>wanted<i>, let me tell you.  And that's sure what he got.  Again and again until I'd ridden him senseless.</i>\"");
	outputText("\n\n\"<i>And then his sisters got bored and joined in.</i>\"");
	doNext(dontTellMeAboutSpiderboy);
}

//Nah // Combine
private function dontTellMeAboutSpiderboy():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>So, let's just say I came away from that encounter carrying enough cute spiderboy cum to fill a bucket.  If I'm not carrying his child now, then I'm hopeless.  But... you know, I think I can feel it, [name].  I shouldn't be able to, but I can.  Oh, god,</i>\" Hel says, looking pointedly away from you, staring wide-eyed into the morning sky.");
	
	outputText("\n\n\"<i>What's wrong?</i>\"");
	
	outputText("\n\n\"<i>I-I really am going to be a mother.  I can feel it, [name].  The spiderboy's seed taking inside me, the dawn of a new life.  I just hope... I hope this wasn't a mistake, [name].</i>\"");
	
	outputText("\n\nYou put an arm around the mother-to-be's shoulder, saying, \"<i>I thought this was what you wanted, Hel.  You were-</i>\"");
	
	outputText("\n\n\"<i>Yeah, I know.  Forget about it, I'm fine.  Really.  It's just that this happened all so suddenly, you know?  This isn't exactly where I saw myself a year ago.  Not that I'm complaining,</i>\" she adds, turning back to you with a kiss, squeezing you with her tail.  \"<i>I just hope I'm ready, I guess.  Until the Pale Flame took, I'd never really thought about being a mother.  Never really wanted it.  But last night, it was like I was possessed, like I couldn't control myself.  I just... needed you.  Well, maybe not your sperm - not literally, I mean - but it was like my body screaming 'You've found [him], [he]'s the one, this is a keeper!  Time to propagate!' I-I can't help but feel like this wasn't entirely my choice, you know?  Like I was acting on instinct, like an animal, not a person.  But at the same time, if I've made a mistake, then I have you here with me, to help me like you always do.  I love you with all my heart, [name]");
	if(flags[kFLAGS.HEL_LOVE] == 1) outputText(", and I'm so very, very glad you love me back.");
	else outputText(", even if you can't say the same.  And that's alright; it doesn't change my heart, and it never will. I love you.");
	outputText("</i>\"");
	
	outputText("\n\nThe two of you snuggle up for a good long while, content to lie in each others' arms.  \"<i>I'm glad we're in this together, my love.  I'm going to... to need you during this.</i>\"");
	
	outputText("\n\nYou tell her to rest easy: that you'll be there for her every step of the way.  She smiles ");
	if(player.tallness >= 90) outputText("up ");
	else if(player.tallness <= 72) outputText("down ");
	outputText("at you, holding you tight for a long moment before stepping away, still holding your hands.  \"<i>This is all new to me, [name].  I never pictured myself as a mother, with a mate and a stable, safe home - or as stable and safe as anything these days - but with you by my side, there's nothing I can't take on.</i>\"");
	
	outputText("\n\nYou give your lover one last kiss before getting back to your quest.");
	doNext(recalling ? recallWakeUp : camp.returnToCampUseOneHour);
}


//Hel Got Knocked Up by Some Random Slut at the Bar, and Nobody Was Really Surprised, All Things Considered. 
private function sureHelGimmeMaiDetails():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>You know, it's not easy for me to get around in Tel'Adre.  I lived my whole life in the middle of shit-all nowhere, the wide-open plains.  But here's a ruined city, packed full of abandoned buildings and thousands of people.  Took half the night to find Miko and Mai's place, this little bungalow-thing near the walls.  I probably got turned around three or four times, nearly gang-raped by this big pack of cats... man, fuck cities.  But anyway, I was lucky that Mai answered the door; she'd just been going to bed, I guess.  Miko was gone, off with some new girlfriend.  Or maybe getting gang-banged by cat people, since that's a thing that happens there apparently.  Who knows.</i>\"");
	outputText("\n\n\"<i>Well, it's kind of awkward to tell a good friend, 'Hey, I want to bear your children. Present your cock, slut!'  At the same time, it's not really fair to just jump her britches and ride her 'til the sun rises without her knowing what's up.  Also, the tail being white's a dead giveaway, unless I fuck her with my cloak on.  So, I take Mai to their kitchen, pour us some wine, ask her how's things, make small talk.  That gets her suspicious, of course, and finally I have to say, 'So, remember the last few weeks, we've been hanging out, and you keep saying how much you want to have kids, but can't find a good man or woman and you don't want to raise your spawn in the city, anyway?  Yeah, so, I kinda want to have kids too and this is really sudden but what do you say, lover girl?  You and me, let's make a baby!'</i>\"");
	outputText("\n\n\"<i>I'm not a diplomat or a bard, but eventually I talk her into it.  She's all nervous by the time I yank her nightgown off, asking all the wrong questions.  'Can I visit?  What do we name her?  What would a salamander-fox look like?  Do you want a boy or a girl or a;' I'm laughing, the I tell her to shut up and fuck me.  Well, by the time I get her panties off, that puppy pecker's nice and swollen, bright red with a thick knot ready to stretch me wide.</i>\"  Hel pauses to lick her lips, staring into the distance.  \"<i>She's raring to go, but I'm going to take it slow, give her a night to remember.  I get down between her legs, running my fingers across that supple flesh of hers, licking her tight little cunt 'til she's drooling on my tongue.  My tail sneaks around and does its thing, gently teasing that precious little spot where the skin meets the fluff of her tail, working its way down to her little pucker.  God, she makes the cutest little gasps when I get inside her, worming my tail into her ass 'til I find the nub of her prostate and get to milking.  Now her cock's standing at attention, and I climb into bed with her, kissing and fondling those big perky tits of hers until I can feel her ready to burst.  I go slow down on her, leaning back on my haunches until I can feel just the tip of her pressing in on my cunt; oh, she's whimpering and whining by then, grabbing my hips to try and bring me down on her, begging me to fuck her brains out, to let her swollen little knot pop its load deep inside me.</i>\"");
	
	outputText("\n\n\"<i>Finally, even I can't stand it anymore, and I drop like the hand of god on her, taking her knot and all in one go.  She came right then and there, screaming loud enough to wake the neighbors - and digging her fingers in enough to leave scratches on my ass.  But she flooded me with cum until it drooled out around her knot.  And knotted we were, let me tell you.  But that's just an excuse to go again, and with my tail right on her prostrate, she was up and at it again in half a minute, moaning as I got to work bouncing on her cock like a... I dunno, a sex bunny.  So on we go for hour after hour until Mai's just about passed out, and we're both covered in sweat and cum and that shitty lube she keeps around.  Shit, we were still at it by the time Miko got back, and suddenly I've got an extra knot tearing up my asshole and another pair of hands to play with my tits while I propped Mai up, head buried in my cleavage.</i>\"");
	
	outputText("\n\n\"<i>Come sunrise, and the three of us are filthy: the twins look like they're made of cum, and I'm gushing it out of every hole.  Eventually I managed to tell Miko what she'd stumbled into, and she insisted on making us a celebratory breakfast.  She got all excited about being an aunt, but Mai was just about passed out by the time I left - just strong enough to pull me down, give me a goodbye kiss, and rest her head on my belly, whispering cute nothings to the baby she spent all night fucking into me.</i>\"");
	doNext(dontTellMeAboutMai);
}

//Nah // Combine
private function dontTellMeAboutMai():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>So, let's just say I came away from that encounter carrying enough foxy herm cum to fill a bucket.  If I'm not carrying her child now, then I'm hopeless.  But... you know, I think I can feel it, [name].  I shouldn't be able to, but I can.  Oh, god,</i>\" Hel says, looking pointedly away from you, staring wide-eyed into the morning sky.");
	
	outputText("\n\n\"<i>What's wrong?</i>\"");
	
	outputText("\n\n\"<i>I-I really am going to be a mother.  I can feel it, [name].  Mai's seed taking inside me, the dawn of a new life.  I just hope... I hope this wasn't a mistake, [name].</i>\"");
	
	outputText("\n\nYou put an arm around the mother-to-be's shoulder, saying, \"<i>I thought this was what you wanted, Hel.  You were-</i>\"");
	
	outputText("\n\n\"<i>Yeah, I know.  Forget about it, I'm fine.  Really.  It's just that this happened all so suddenly, you know?  This isn't exactly where I saw myself a year ago.  Not that I'm complaining,</i>\" she adds, turning back to you with a kiss, squeezing you with her tail.  \"<i>I just hope I'm ready, I guess.  Until the Pale Flame took, I'd never really thought about being a mother.  Never really wanted it.  But last night, it was like I was possessed, like I couldn't control myself.  I just... needed you.  Well, maybe not your sperm - not literally, I mean - but it was like my body screaming 'You've found " + player.mf("him","her") + ", " + player.mf("he","she") + "'s the one, this is a keeper!  Time to propagate!'  I-I can't help but feel like this wasn't entirely my choice, you know? Like I was acting on instinct, like an animal, not a person.  But at the same time, if I've made a mistake, then I have you here with me, to help me like you always do.  I love you with all my heart, [name]");
	//if HelLove is Yes:
	if(flags[kFLAGS.HEL_LOVE] == 1) outputText(", and I'm so very, very glad you love me back.");
	else outputText(", even if you can't say the same. And that's alright; it doesn't change my heart, and it never will. I love you.");
	outputText("</i>\"");
	
	outputText("\n\nThe two of you snuggle up for a good long while, content to lie in each others' arms.  \"<i>I'm glad we're in this together, my love. I'm going to... to need you during this.</i>\"");
	
	outputText("\n\nYou tell her to rest easy: that you'll be there for her every step of the way.  She smiles ");
	if(player.tallness >= 90) outputText("up ");
	else if(player.tallness <= 72) outputText("down ");
	outputText("at you, holding you tight for a long moment before stepping away, still holding your hands.  \"<i>This is all new to me, [name].  I never pictured myself as a mother, with a mate and a stable, safe home - or as stable and safe as anything these days - but with you by my side, there's nothing I can't take on.</i>\"");
	
	outputText("\n\nYou give your lover one last kiss before getting back to your quest.");
	doNext(recalling ? recallWakeUp : camp.returnToCampUseOneHour);
}


//Helia's Pregnancy
//In addition to the alterations to her appearance screen, given above, the following new scenes and changes occur once Hel's been knocked up.
//Hel's pregnancy should last for ~2 weeks in-game time. Each week, she'll move from bulging to swollen to gravid every 5 days or so, which alters her Appearance slightly, and can change her pregsex scenes.
//Note that, during the pregnancy, Hel's ability to Fight and Wrestle with the PC is removed. She's not willing to let her baby get hurt!

//Hel enters "bulging" state, play at random from camp menu:
//if(flags[kFLAGS.HELIA_PREGNANCY_INCUBATION] < 300 && flags[kFLAGS.HEL_PREGNANCY_NOTICES] == 0) {
public function bulgyCampNotice():void {
	clearOutput();
	helScene.helSprite();
	outputText("As you're walking through camp, your eyes wander over toward Helia, sunning herself on a stone near the edge of camp.  You can just see that her belly's starting to bulge out from under her, and Hel's hands lie protectively over her full womb, absently rubbing the bulge of her stomach.");
	doNext(playerMenu);
}
//Hel enters "swollen" state, play at random from camp menu:
//if(flags[kFLAGS.HELIA_PREGNANCY_INCUBATION] == 200 && flags[kFLAGS.HEL_PREGNANCY_NOTICES] == 1)
public function heliaSwollenNotice():void {
	clearOutput();
	helScene.helSprite();
	outputText("You note that Hel's wandering aimlessly around camp, one hand over her belly as she mumbles to herself.  You could swear she was cursing her now quite swollen belly, but suddenly she gives a girlishly happy cry and waves you over.\n");
	outputText("\n\"<i>Come feel, [name], quick! It's kicking!</i>\"\n");
	outputText("\nYou trot over and press your ear to Hel's big belly, running your hands along her taut skin.  A moment later, and you feel a little push against you, a tiny kick right to the head from the little salamander inside your lover.");
	outputText("\n\n\"<i>Feels like she's gonna kick her way out of there sometimes,</i>\" Hel says, chuckling.  You help her sit down, both of you running your hands along the surface of her belly, responding to the little pushes her child's making.  \"<i>She's going to be a fighter, [name], let me tell you.</i>\"");
	outputText("\n\n\"<i>She?</i>\" you ask, grinning.");
	outputText("\n\n\"<i>Or he.  Whichever... so, which do you want, lover mine?  A big strong boy, or a fiery little girl just like her mom?</i>\"");
//Shouldn't be needed, bet this was originally here to stop duplicate notices:	flags[kFLAGS.HEL_PREGNANCY_INCUBATION]--;
	menu();
	addButton(0,"Boy",youWantABoy);
	addButton(1,"Girl",youWantAGirl);
}

//Boy
private function youWantABoy():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>Is that so? Yeah, I can see it.  ");
	if(player.hasCock() && !player.hasVagina()) outputText("If I were a guy, I'd want a big strong son to hang out with, too.  Take him fishing, teach him how to fight the way you do... you'll make a great dad, my love.  I'm sure you will.");
	else outputText("Would be nice to have a man around here, you know?  I miss hanging around the boys back home, watching 'em strut like peacocks for every passing girl.");
	outputText(" And any son of mine is going to be a real lady killer, mark my words.  We're going to have to fight off whole hordes of goblin sluts, all looking for a piece of our handsome little boy before you know it.</i>\"");
	outputText("\n\nYou share a quiet laugh with your lover before leaving her with a kiss and a final pat on the belly - and feeling the little kick of your spawn reacting to you.");
	doNext(playerMenu);
}

//Girl
private function youWantAGirl():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>Yeah, a girl would be pretty great.  ");
	//if PC is male:
	if(player.hasCock() && !player.hasVagina()) {
		outputText("I dunno if you had any sisters growing up, [name], but let me warn you: a little girl, especially a little salamandress, is going to be a hell of a handful.  But I can just see you when she's all grown up, packing a big old sword and threatening every boy that wants a piece of her: 'Treat her right or you'll have the CHAMPION to deal with.  Rawr.'");
	}
	else outputText("We're going to be a gaggle of tittering girls before you know it, though.  Salamanders grow up so fast, [name]...  I just hope she doesn't turn out like me, you know?  I don't know if I could stomach seeing my little girl becoming a wanton slut like her mom.  I might get jealous, after all...");
	outputText("  Any daughter of ours is going to be a real beauty, mark my words. She'll make a succubus look like a toad before she's out of swaddling.</i>\"");
	
	outputText("\n\nYou share a quiet laugh with your lover before leaving her with a kiss and a final pat on the belly - and feeling the little kick of your spawn reacting to you.");
	doNext(playerMenu);
}

//Hel enters "gravid" state, play at random from camp menu:
//if(flags[kFLAGS.HELIA_PREGNANCY_INCUBATION] == 100)
public function heliaGravidity():void {
	clearOutput();
	helScene.helSprite();
//Shouldn't be needed, bet this was originally here to stop duplicate notices:	flags[kFLAGS.HEL_PREGNANCY_INCUBATION]--;
	outputText("You can't help but notice that Hel's starting to have a hard time getting around, lately - and she's been sticking closer and closer to camp, barely leaving at all the last few days.  Now, she's fussing around her part of camp, trying to beat some spare logs into a crib one-handed.  You can't remember the last time you saw her walking around without a hand on her back to support her gravid belly, the other absently rubbing or poking at it, already playing with the child inside her.");
	
	outputText("\n\n\"<i>Hey, sweetheart,</i>\" Hel says as you wander over, planting a kiss on her cheek.  \"<i>So, it won't be long now, I don't think.  I hope.  If I get any bigger I'm liable to burst.</i>\"");
	
	outputText("\n\nYou chuckle to yourself and hold the wood beams still for Hel, helping her to fit the last few pieces together.");
	
	outputText("\n\n\"<i>Thanks, [name].  God, I feel so fucking useless lately... you know, a shitty little goblin jumped me the other day, and I actually pussied out and waddled the fuck home.  Ugh.  I can't drink, I can't get laid half the time, and whenever I get a chance to fight I get freaked out the baby might get hurt and run home with my tail between my legs.  I am so ready for this to be over,</i>\" she groans, awkwardly sitting down with both hands wrapped over her gut.  You put an arm around her shoulders, pulling Helia close; she smiles prettily and rests her head on your chest, sighing heavily.");
	outputText("\n\nAfter a minute, she looks up at you and asks, \"<i>So, have you thought about a name?</i>\"");
	
	outputText("\n\n\"<i>Hm?</i>\"");
	
	outputText("\n\n\"<i>A name.  For the kid.  I've been thinking pretty hard about it, the last few days.  What do you think about Kyros or Hylas for boy names?  They were brothers in this ancient legend mom used to tell me, a pair of salamander master smiths who sought out the great dragon Perethal and stole from his horde the first steel the world had ever seen, and forged it into a magic sword.  It was so beautiful, the legend went, that Marae herself took it for her own, gave it to the greatest of her champions for generations: once even a descendant of the smiths.  And if we have a girl... I don't really know, yet.  Maybe Syn or Chara.  Dad says I should name her after mother, but that doesn't sit right with me. Dunno why, but I just don't want a ghost's name on my living girl, you know?</i>\"");
	
	outputText("\n\nGently, you ask what her mother's name was.");
	
	outputText("\n\n\"<i>Oh, I never told you? Her name was Tanis, and she was the most beautiful woman in the world.</i>\"");
	
	outputText("\n\nYou give her a moment, but Hel seems to be done talking for now, instead staring off into the distance.  You leave her with a kiss, and get back to your duties.");
	doNext(playerMenu);
}

//Hel Talk 7 (New, play first time PC [Talk]s to Hel once she's at least "swollen")
internal function heliaTalkSeven():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HELIA_TALK_SEVEN] = 1;
	outputText("You take Hel with you to a secluded spot at the edge of camp and sit with her, asking how she's doing as you run a hand across her pregnant belly.  She nuzzles against you, wrapping her lengthy tail around your waist as her cheek nestles into the nape of your neck.  \"<i>It's... not like I expected, [name].  Whenever I used to think of being a mother, I always sort of skipped the whole 'carry the little bastards around in your belly' part.  I just feel so... full, I guess?  Like I just ate a horse, and the horse is inviting its friends to come party at night whenever I try to sleep.  Heh, this little firebrand just loves to kick and squirm at night, let me tell you.  Speaking of which-</i>\"  Hel takes your hand in hers and places it over her belly, letting you feel the subtle little movements inside her as your growing child pushes out toward the world.");
	
	outputText("\n\nStill caressing the swell of Hel's stomach, you mention that you'd have expected a salamander to lay an egg - even if she's only carrying a half-salamander.  Hel's chuckles, \"<i>Salamanders ditched the whole egg thing ages ago, I guess.  I mean, we're scaly lizard folk and all, but come on - these aren't just for show, you know,</i>\" she says, cupping her hefty tits, which seem to have grown just a touch larger since she conceived.");
	
	outputText("\n\n\"<i>Getting ready to swell with milk,</i>\" Hel says, proudly patting her bust.  \"<i>Don't worry, lover mine; we salamanders are hard drinkers right out of the womb, but I'll be sure to save plenty for you!</i>\"");
	
	outputText("\n\nA moment of laughing passes before Hel adds, \"<i>But seriously, lover, thanks for checking in on me.  I don't... I can't do this on my own, you know?  I'm trying, but it's hard, and getting harder.  Every night since this started, I've lain up thinking 'Oh god, what if I screw this up?  Wh-what if I say something wrong, or do something that just twists my kid's mind and fucks her up forever?  Or she turns into a bigger whore than I am,' or a million other things I can't stop thinking about.  I just keep worrying that I'm going to be a shit mom.  But you know... with you around, I feel at least a little more confident.  I don't know if I even could have a good impression on our kid, but... I know you will, [name].  You're a strong " + player.mf("man","woman") + "; stronger than I'll ever be.  I just hope a tiny little sliver of your strength - and maybe a healthy dose of your looks - rub off on him.  Or her.  That's all I'd ask for");
	//if PC isn't daddy:
	if(flags[kFLAGS.HELSPAWN_DADDY] != 0) outputText(", even if he's not your get, I can hope, you know?  If he spends enough time around you, maybe he'll take more after you than me");
	outputText(".</i>\"");
	menu();
	addButton(0,"EncourageHer",encouragePregalia);
	addButton(1,"Wellll...",helsLifestyle);
}

//[Encourage Her]
//[Hel's Lifestyle]
//Encourage Her
private function encouragePregalia():void {
	clearOutput();
	helScene.helSprite();
	outputText("You squeeze Hel's shoulder and tell her that she's going to be a great mother, and that her child would do well to learn from a beautiful, powerful warrior like dear old mom.  ");
	if(flags[kFLAGS.HEL_LOVE] == 1) outputText("You love Hel");
	else outputText("Hel's your friend");
	outputText(", and if her child follows in her footsteps, so much the better.  Your lover manages a half-hearted laugh, blushing at your words.  Her tail tip brushes your cheek as its owner cuddles up against you, smiling.  \"<i>Thanks, lover mine.  I just hope I - we - can do right by the kid.  That's all.</i>\"");
	outputText("\n\n\"<i>I know,</i>\" you answer, kissing her.");
	doNext(playerMenu);
}

//Hel's Lifestyle
private function helsLifestyle():void {
	clearOutput();
	helScene.helSprite();
	outputText("Being very serious for a moment, you tell Hel that if she's worried about her terrible choices rubbing off on her kid, maybe she ought to reconsider some of the things she's done: be less of a slut, drink less, be less of a bloodthirsty maniac in battle.  Slowly, Hel nods to the rhythm of your words.  \"<i>Yeah, maybe... maybe I should.  I don't know if I can change though, [name].  I'm not as young as I was - or at least, I don't feel it - and I've been living the way I have been for years.  I don't know if I could just give up the shit I do: the partying and the drinking, the fighting and the fucking.  It's part of who I am, ");
	if(flags[kFLAGS.HEL_LOVE] == 1) outputText("and I hope that's part of why you love me");
	else outputText("even though I know that's probably part of why you can't love me back");
	outputText(".  I'll try and rein it in, but maybe... it'd be better if you were the one who raised my child, [name].  God knows I'm the least qualified person to do it.</i>\"");
	
	outputText("\n\nYou start to answer, but Hel puts a finger to your lips, telling you she needs a little while to think.  You nod, and head back to your work.");
	doNext(playerMenu);
}

//IT'S TIME! (Play the morning of the 15th Day of Helia's pregnancy)
public function heliaBirthtime():void {
	if (prison.inPrison) {
		prison.prisonLetter.letterFromHelia1();
		return;
	}
	clearOutput();
	helScene.helSprite();
	outputText("The morning dawns like any other, though as you're getting dressed, you can't help but notice Hel waddling back from the edge of camp, both hands firmly gripping her positively massive belly.  You walk over just in time to hear her groan, \"<i>Oh fuck me sideways and call me a harpy, this shit sucks.</i>\"  You put an arm around her to steady the sickened salamander, but she barely notices you as she flops down beside her still, nearly grabbing a glass before stopping herself.  \"<i>Fucking shit fuck I am so done with this.  I - oh god,</i>\" she doubles over, squeezing her belly.  \"<i>Ow ow oh god ow.</i>\"");
	
	outputText("\n\nYou ask Hel if she's okay, which earns you a bestial growl and a murderous look.  Her look softens a moment later when she doubles over again, seized by agony.  \"<i>Just about time, [name].  Oh fuck, this hurts something fierce.</i>\"");
	
	outputText("\n\nKneeling beside the salamander, you ask what she needs - what can you do?");
	
	outputText("\n\n\"<i>I-I don't know!</i>\" Hel cries, leaning back against you, her legs spreading.  \"<i>I don't </i>fucking<i> know! Just - aahhhh - hold my hand!</i>\"");
	
	outputText("\n\nYou dutifully hold Helia's hand as water gushes out from between her legs, heralding the birth of ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 1) outputText("your ");
	else outputText("her ");
	outputText("child.  Hel screams and cries, gripping your hand so tight you feel like your bones are about to break in her iron gasp; you try and tell her to push, to remember everything the Midwives of Ingnam would say when a village girl gave birth.  It seems a small comfort to the screaming salamander, but she does as you say, pushing harder and harder until you can see the crown of a little baby's head pushing out of your lover's well-stretched cunt.  Suddenly with a roar that echoes across the wasteland and a mighty push, a squalling baby tumbles out of Hel's birth canal and into your waiting arms.");
	menu();
	addButton(0,"Next",heliaBirthEpilogue);
}

private function heliaBirthEpilogue():void {
	clearOutput();
	helScene.helSprite();
	//It's a girl! 
	//If PC was the father: 
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("A healthy baby salamander gurgles and cries as you wrap her in a towel, looking up at you with a pair of bright golden eyes.  Hel takes your daughter, holding the little bundle of you to herself, cooing and laughing at the new life in her arms.  \"<i>Oh my god, [name], look... it's... it's our baby girl.  And she's got your eyes.  The same look I see in your eyes every day.  Oh, this one's going to grow up big and strong.  Aren't you?</i>\" she laughs, rubbing the baby's cheek.  It makes a high, gay little coo in response, nuzzling against Hel's finger.");
	//If Mai was the father:
	else if(flags[kFLAGS.HELSPAWN_DADDY] == 2) outputText("What you hold in your arms isn't <b>quite</b> a salamander, though.  The little girl you've by now got wrapped up in a towel looks mostly like her mother, with a full body of red scales and pale flesh, and a brightly flaming tail; but atop her head, rather than finned reptilian ears are a pair of perky, puppy-dog like ears.  Taking her daughter, Hel laughs, scratching the newborn behind the ears, making it coo and giggle.  \"<i>Oh my god, [name], look... it's... it's our baby girl.  And she's got Mai's ears, holy shit.  Look at that.  Oh, you're going to be adorable when you grow up, aren't you?</i>\" she laughs, rubbing the baby's cheek.  It makes a high, gay little giggle in response, nuzzling against Hel's finger.");
	else outputText("What you hold in your arms isn't <b>quite</b> a salamander, though. The little girl you've got wrapped up in a towel has the same shape as her mothers, a body covered in leather scales and a brightly-flaming tail... but her scales are a midnight black, the same color as a spider's chitin.  The little girl looks up at you with bright red eyes as Hel takes her from you, laughing as she runs her hand across her daughter's dark scales.  \"<i>Well, that's a hell of a thing, isn't it [name]?  A black-scaled salamander... she's beautiful.  Oh you're going to be gorgeous when you grow up, aren't you?</i>\" she laughs, rubbing the baby's cheek.  It makes a high, gay little giggle in response, nuzzling against Hel's finger.");
	//[New Paragraph]
	outputText("\n\nThough still panting from the ordeal, Hel's motherly instincts kick in as her daughter tries to eat her finger, and pulls her scaled top down to reveal the swell of her big, milky breast.  The newborn latches on immediately, sighing happily as it takes its first meal.  A sentiment echoed by her mother, who slumps over onto your shoulder, breathing easy for the first time in the day.  \"<i>That was... gaaah.  But look... look at her.  My god, she's amazing.  So beautiful... she's perfect, [name].  And she's- oh, she's got a hell of a bite.  Ow.</i>\"");
	menu();
	addButton(0,"Next",nameDatHelspawn);
}

//[NEXT]
private function nameDatHelspawn():void {
	clearOutput();
	helScene.helSprite();
	outputText("You and Helia share a laugh, looking down at ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("your ");
	else outputText("her ");
	outputText("little girl as she suckles.  After a few happy, blissful minutes though, Hel turns to you with a question:");
	outputText("\n\n\"<i>So... what do we name her, love?  I honestly hadn't put that much thought into girl names.  Kind of expected a boy, I guess, but... it's up to you, [name].  What do you think?</i>\"");
	menu();
	addButton(0,"Next",applyHelspawnName);
	mainView.nameBox.text = "";
	mainView.nameBox.visible = true;
	mainView.nameBox.width = 165;
	mainView.nameBox.x = mainView.mainText.x + 5;
	mainView.nameBox.y = mainView.mainText.y + 3 + mainView.mainText.textHeight;
}
private function applyHelspawnName():void {
	helScene.helSprite();
	//Easter Egg Names Hel WILL NOT ALLOW:
	if (CoC.instance.testingBlockExiting)
	{
		// We're running under the testing script.
		// Stuff a name in the box and go go go
		mainView.nameBox.text = "Kiderp";
	}
	else if(mainView.nameBox.text == "" 
			|| mainView.nameBox.text == "Hellgirl" 
			|| mainView.nameBox.text == "Kid" 
			|| mainView.nameBox.text == "Phoenix" 
			|| mainView.nameBox.text == "Savin" 
			|| mainView.nameBox.text == "Helia" 
			|| mainView.nameBox.text == "Mini-doofus") 
	{
		clearOutput();
		if(mainView.nameBox.text == "") outputText("<b>You must select a name.</b>");
		else if(mainView.nameBox.text == "Hellgirl") outputText("\"<i>Hey, that's copyright infringement.  Probably.</i>\"");
		else if(mainView.nameBox.text == "Kid") outputText("\"<i>Wow, what are you, five?</i>\"");
		else if(mainView.nameBox.text == "Phoenix") outputText("\"<i>Oh hell no.  You're not naming my little girl after one of those... things!  Sorry Kiri, but still!</i>\"");
		else if(mainView.nameBox.text == "Savin") outputText("\"<i>That's a boy's name, dumbass.</i>\"");
		else if(mainView.nameBox.text == "Helia") outputText("\"<i>My favorite name!  Except it's kinda taken, love.  Don't want things to get too confusing around here, do you?</i>\"");
		else if(mainView.nameBox.text == "Mini-doofus") outputText("\"<i>Oh yeah, Kiha'll get a laugh out of that.  You ass.</i>\"");
		//[Back to the name field you go!]
		menu();
		mainView.nameBox.x = mainView.mainText.x + 5;
		mainView.nameBox.y = mainView.mainText.y + 3 + mainView.mainText.textHeight;
		addButton(0,"Next",applyHelspawnName);
		return;
	}
	flags[kFLAGS.HELSPAWN_NAME] = mainView.nameBox.text;
	mainView.nameBox.visible = false;
	//[Name Field]
	//Easter Egg Names:
	clearOutput();
	if(flags[kFLAGS.HELSPAWN_NAME] == "Helspawn") outputText("\"<i>That's what I was gonna call her!  Except not at all.  God dammit, seriously, [name]?</i>\"\n\n");
	if(flags[kFLAGS.HELSPAWN_NAME] == "Jayne") outputText("\"<i>That sounds like a hero's name... I like it.  A name that demands respect!</i>\"\n\n");
	if(flags[kFLAGS.HELSPAWN_NAME] == "Hesper") outputText("\"<i>Ah, the Evening Star.  She'll be the star of my life, alright...</i>\"\n\n");
	if(flags[kFLAGS.HELSPAWN_NAME] == "Kiri") outputText("\"<i>Aw, that's great, lover.  Sis'll shit her pants when she hears her niece is named after her!  Gonna get confusing, though...</i>\"\n\n");
	if(flags[kFLAGS.HELSPAWN_NAME] == "Mai") outputText("\"<i>Aw, that's great, lover.  Mai'll be honored, I know it.  And it is a great name...</i>\"\n\n");
	if(flags[kFLAGS.HELSPAWN_NAME] == "Tanis") outputText("\"<i>I don't... I don't know if I want her to have that name, lover.  It's got a lot of baggage, but... but it does my mother an honor.  More than I could ever give her.</i>\"\n\n");
	//Syn: 
	if(flags[kFLAGS.HELSPAWN_NAME] == "Syn") outputText("\"Awesome.  I was hoping you'd choose that one, lover mine.</i>\"\n\n");
	if(flags[kFLAGS.HELSPAWN_NAME] == "Chara") outputText("\"<i>Awesome.  You liked my ideas, after all!</i>\"\n\n");
	
	outputText("\"<i>So... " + flags[kFLAGS.HELSPAWN_NAME] + " it is.  That's a good name, my love.  A strong name.  ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("Our");
	else outputText("my");
	outputText(" little girl's going to grow up big and strong with a name like that... and with you around to guide her,</i>\" Hel says, kissing your cheek.  \"<i>Why don't you give me a minute to catch my breath and get the little one situated, and let's talk.  Alright?</i>\"");
	
	outputText("\n\nYou nod and help Helia to her feet, still holding " + flags[kFLAGS.HELSPAWN_NAME] + " to her breast.  Your lover gives you a wink before walking bow-legged back toward her part of camp, and the little crib she's built beside her hammock.");
	helSpawnsSetup();
	doNext(camp.returnToCampUseTwoHours);
}

//NOTE: HelSpawn's personality meter & Growing Up
public function helSpawnsSetup():void {
	//HelspawnChaste and HelspawnSlutty are the new Variabls for Helspawn, indicating the ways you can morph her personality, whichever is higher at the end of the Teenage years indicates whether she gets to be a proud, chaste warrior girl fit for Paladinhood or a slutty, filthy whore of a berzerker like mom. 
	//Depending on who her daddy was, she gets a bonus to one or the other stat:
	//>If Mai is the daddy: +10 HelspawnSlutty
	flags[kFLAGS.HELSPAWN_PERSONALITY] = 50;
	if(flags[kFLAGS.HELSPAWN_DADDY] == 2) flags[kFLAGS.HELSPAWN_PERSONALITY] += 10;
	//>If Spiderbro is daddy: +10 HelspawnChaste
	if(flags[kFLAGS.HELSPAWN_DADDY] == 1) flags[kFLAGS.HELSPAWN_PERSONALITY] -= 10;
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) {
		//>If Corrupt (66+ Corr) PC is daddy: +10 Helspawn Slutty
		if(player.cor >= 66) flags[kFLAGS.HELSPAWN_PERSONALITY] += 10;
		//>If Pure (33> Corr) PC is daddy: +10 Helspawn Chaste
		if(player.cor <= 33) flags[kFLAGS.HELSPAWN_PERSONALITY] -= 10;
	}
	flags[kFLAGS.HELSPAWN_AGE] = 1;
	flags[kFLAGS.HELSPAWN_GROWUP_COUNTER] = 1;
	helScene.pregnancy.knockUpForce(); //Clear Pregnancy
	//>If the two scores tie at the end somehow, Sluttymandergirl prevails!
}

//Hel Talk 8 (Only while HelSpawn is still a baby)
internal function heliaTalkEight():void {
	clearOutput();
	flags[kFLAGS.HEL_TALK_EIGHT] = 1;
	helScene.helSprite();
	outputText("Watching your little daughter crawl around, you and Hel sit down together arm in arm, smiling as the little salamander girl plays with bits and pieces of Hel's gear.");
	outputText("\n\n\"<i>She's growing up so fast... and only getting faster.  By the time I pulled her off my breast the first time, I swear she'd doubled in size.</i>\"  You nod, able to see it clearly yourself.  Your little girl's growing fast... and it's not just a ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("parental ");
	else outputText("care giver's ");
	outputText("pride, either.  She really is growing up faster, many times faster than a human girl.  And, by the sound of things, many times faster than a salamander ought to.  You ask Hel if that's right, and she nods gravely.");
	
	outputText("\n\n\"<i>I don't know what it is about this world, but it's touched me... my daughter... already.  She's growing like a little goblin, and I don't know why.  Could it have been something I drank?  Something I fucked?  I can't... I don't know, [name].  It's probably my fault, but I can't imagine what I did wrong.  She should be taking years to get this big, but look at her...</i>\"");
	
	outputText("\n\nHel's right. Your little girl looks like she's five, maybe six years old already.");
	
	//If Amily is at camp: 
	if(amilyScene.amilyFollower()) outputText("\n\nYou mention how Amily managed to reverse-engineer a goblin's potion to accelerate her childrens' growth.  Hel grimaces, running a hand over her belly.  \"<i>God damn green menaces.  I never - almost never - drank any of their shit.  Succubus milk?  Sure, why not.  Snake oil, bring it on... But goblin potions?  I'm not that stupid, [name].  It couldn't have been...</i>\"");
	
	outputText("\n\nSighing, Hel leans her head on your shoulder, wrapping her tail around your waist.  \"<i>Well, I guess we get even less time to learn how to be parents, huh?  I guess it doesn't matter how it happened - what matters is that ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("our");
	else outputText("my");
	outputText(" little girl's going to be a big girl damn soon.  Let's enjoy it while we can, eh?</i>\"");
	
	outputText("\n\nYou nod to your lover, and both of you walk over to spend some quality time playing with " + flags[kFLAGS.HELSPAWN_NAME] + ".");
	doNext(camp.returnToCampUseOneHour);
}

//From Hel's menu: [Play with Kid]
internal function playWithYourKid():void {
	clearOutput();
	helScene.helSprite();
	outputText("Picking " + flags[kFLAGS.HELSPAWN_NAME] + " up off the ground, you spin the giggling little girl around, laughing as your ");
	if(flags[kFLAGS.HELSPAWN_DADDY] != 0) outputText("ward ");
	else outputText("daughter ");
	outputText("cries out in surprise and glee.  Soon, you're bouncing her, then down on the ground crawling around with her, playing peek-a-boo and a dozen other games as you and " + flags[kFLAGS.HELSPAWN_NAME] + " laugh and hug.  Helia herself slips down with you before you know it, holding her daughter close as she tries to communicate, teaching the ever-growing girl a few words at a time.");
	
	outputText("\n\n\"<i>Mommy!</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " eventually cries, bopping her mother on the nose. Hel laughs, but it turns into a sigh as her daughter reaches down and fiddles with her top, obviously hungry.");
	
	outputText("\n\n\"<i>We've got to wean this one before she bites my tits off,</i>\" Hel groans as " + flags[kFLAGS.HELSPAWN_NAME] + " latches on, starting to suckle.  \"<i>Those teeth came in fast...</i>\"");
	
	outputText("\n\nLaughing, you rustle " + flags[kFLAGS.HELSPAWN_NAME] + "'s fiery hair and leave mother and daughter to finish the meal.");
	doNext(camp.returnToCampUseOneHour);
}

//Event: Helspawn Graduates from Baby to Teenager
//(Play as the PC wakes up)

public function helSpawnGraduation():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HELSPAWN_GROWUP_COUNTER] = 1;
	flags[kFLAGS.HELSPAWN_AGE]++;
	outputText("You wake up to a scream, high-pitched and terrified.  You bolt up out of bed, tangling up in your bedroll for a minute before stumbling over to Hel and... " + flags[kFLAGS.HELSPAWN_NAME] + "?");
	outputText("\n\nYou do a double take as you lay eyes on the ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 1) outputText("black");
	else outputText("red");
	outputText("-scaled figure curled up next to Helia; Hel herself is looking wide-eyed down at the drowsy figure on her breast, just barely opening her eyes.  \"<i>Y-you're... you're huge!</i>\" Hel manages to gasp out, pushing herself back and away from her daughter.");
	
	outputText("\n\n\"<i>Mom?</i>\" the girl asks, rubbing her temple.  As she sits up, you can see that she's grown exponentially since you put her to bed the night before: she's nearly six feet tall, her hair hanging down in long, silky locks to her bare behind.  Her figure's filled out, a pair of burgeoning breasts and flared hips showing themselves on her feminine body.  She'd easily match any of the teenage girls in your home town in terms of size and figure, maybe fifteen or sixteen in appearance now.");
	
	outputText("\n\n\"<i>Ugh, what's wrong?</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " groans, looking up at Hel, then to you.  \"<i>" + championRef() + ", why's mom screaming?</i>\"");
	outputText("\n\n\"<i>Oh my god you're a giant!</i>\" Hel babbles, curling her knees up to her chest.  \"<i>Wh-wh-what... what happened to... to my little girl?</i>\"");
	
	outputText("\n\nYou have to admit, the change is sudden and drastic... but the girl's scales, her eyes, they're certainly " + flags[kFLAGS.HELSPAWN_NAME] + "'s.  ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 2) outputText("And the puppy ears, now more wolf-like, are a dead giveaway.  Utterly unique to her.  ");
	outputText("You sit down beside the obviously confused girl and stroke her hair, telling her it's all right, her mother's just startled, that's all.");
	
	outputText("\n\n\"<i>It's just me, mom,</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " says, sliding over to sit beside her mother, who's still wide-eyed with shock.  Your girl tries for a few moments to talk to Hel, but seeing that venture prove fruitless - Hel seems utterly insensate, paralyzed by shock - she instead curls back up beside her mother, head rested on Helia's shoulder.  Eventually, warily, Hel reaches out a trembling hand to brush her daughter's cheek.");
	outputText("\n\n\"<i>My god, she's growing so fast... and I don't want to lose her so soon.  I want my baby back.</i>\"");
	
	outputText("\n\nCupping Hel's cheek, you sit beside her, holding your lover tight as her daughter dozes beside her, clearly exhausted after the massive growth spurt she's endured while you were sleeping.");
	
	outputText("\n\nIt looks like you've got a teenager, now.  A wide-eyed, impressionable youth.  You can only hope you make the right choices in raising her now, when it counts...");
	doNext(camp.returnToCampUseOneHour);
}

//Event: Helspawn Discovers Booze
//(Play at random during Teenage Helspawn days)
public function helspawnDiscoversBooze():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HELSPAWN_DISCOVER_BOOZE] = 1;
	outputText("As you're moving through camp, you notice Hel's away from her little nook - probably off visiting the family, seeing as her cloak's gone.  You wouldn't have given her part of camp a second look, except for a sudden whiff of brimstone and burning brewery on the wind.  Cocking an eyebrow, you creep over to Hel's still, quiet as ");
	if(player.race() != "cat-boy" && player.race() != "cat-girl") outputText("a cat");
	else outputText("the cat you are");
	outputText(", and poke your head around the iron body of the still.");
	
	outputText("\n\nFlopped down on the ground with her mouth right under the spigot is " + flags[kFLAGS.HELSPAWN_NAME] + ", using her tail to keep the tap open and flowing into her waiting maw as she lazes beneath it.  When you loudly clear your throat, she flails around a moment, letting the tap go as she scrambles to her feet - only to fall drunkenly on her ass.  \"<i>Uh...</i>\" she groans, wiping the booze off her cheeks as she hiccups drunkenly.  \"<i>Hi there, " + championRef() + ".</i>\"");
	menu();
	addButton(1,"Scold Her",scoldHelSpawn);
	addButton(0,"Encourage",encourageHelspawn);
}

//Scold Her
private function scoldHelSpawn():void {
	clearOutput();
	helScene.helSprite();
	outputText("You cross your arms over your chest and ask your little salamander exactly what she thinks she's doing.");
	outputText("\n\n\"<i>Uh, I'm... uh...</i>\" she starts before you pick her up by the scruff of the neck, pulling her away from the still.  She squirms and flails drunkenly in your grasp, but is unable to escape in her condition.  \"<i>P-put me down, " + championRef() + "!</i>\" she squeals, but you only tsk your tongue as you drag her away, dropping her on your bedroll, well away from the booze.");
	outputText("\n\nCrossly, you again ask what she was doing.");
	outputText("\n\n\"<i>I was, uh, just havin' a drink.  Mom drank twice as much as I must've 'fore she left...</i>\"");
	outputText("\n\nAnd just because her mother does something means she should, too?");
	outputText("\n\n\"<i>Wha..</i>\"");
	outputText("\n\nYou sit down beside " + flags[kFLAGS.HELSPAWN_NAME] + " and grab a waterskin, telling her to drink some of this instead - it'll curb the hangover later.  With a look from you, she meekly obeys, sipping at the waterskin as you start to explain that there's no good to come from being a drunkard: that it impairs her decision making, and clouds her mind; like she is now, barely able to think straight after downing gallons.  She's lucky she doesn't die from drinking that much, especially without the tolerances her mother's probably spent years building up.");
	outputText("\n\n\"<i>But I was just...</i>\" she whines, looking up at you plaintively.  You sigh, and put an arm around her shoulder, telling her it's okay.  She just needs to hold off on the booze... she's too young for that.");
	outputText("\n\n\"<i>You'll have plenty of time for things like that later.  For now, stay away from mom's still, alright?</i>\"");
	outputText("\n\n\"<i>Alright, " + championRef() + ",</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " says, curling up beside you, head resting on your [chest].");
	//{HelspawnChaste +10}
	flags[kFLAGS.HELSPAWN_PERSONALITY] -= 10;
	doNext(camp.returnToCampUseOneHour);
}
//Encourage Her
private function encourageHelspawn():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>Move over, you,</i>\" you say, sliding down beside your little salamander as you pop the tap open again.  \"<i>Gotta pace yourself, see,</i>\" you add, taking a long draught before closing it off again, savoring the potent taste of Hel's mighty brew.");
	outputText("\n\n\"<i>Wha...?</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " starts to say, before catching on as you drink, inviting her to join you.");
	outputText("\n\n\"<i>The trick is,</i>\" you say, letting your daughter get back under the tap, \"<i>You gotta build up your tolerance.  Your mom's been drinking like a fish for a decade; you can't just dive in and expect to do what she does.  You have to pace yourself.</i>\"");
	outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " nods slowly, slurping up a cheek-full of beer before you switch out with her again.  While she doesn't have a mouth full of Hel's distillery, you pass her a waterskin, telling her that the more water she drinks, the less shit she'll feel later on.  She drinks eagerly, switching off with you time after time until your entire world seems like a blur and your muscles seem like leaden weights far beyond your control.  You're both utterly shit-faced, giggling and stumbling by the time you manage to pull yourself away from the nearly empty still.");
	outputText("\n\n\"<i>Hey, what gives,</i>\" a voice snaps from somewhere beyond your hazy sight.  It sounds mildly like a cat, though you can't tell why in your state.");
	
	outputText("\n\n\"<i>Uh...</i>\" you groan, slumping over onto your [ass].  " + flags[kFLAGS.HELSPAWN_NAME] + "'s right behind you, collapsing on top of you in a pile of ");
	if(flags[kFLAGS.HELSPAWN_DADDY] != 1) outputText("red ");
	else outputText("black ");
	outputText("scales and the smell of a burning brewery.");
	
	outputText("\n\n\"<i>You two drank the entire fucking thing!</i>\" the voice shrilly shouts as a flaming red figure materializes in front of you.  \"<i>I turn my back for five minutes, and the two of you drink me outta house and home!</i>\"");
	
	outputText("\n\n\"<i>I saved some for ya, mom,</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " groans, retching.");
	
	outputText("\n\n\"<i>Oh. Oh that's just great, [name].  Good job.</i>\"");
	
	outputText("\n\n\"<i>I was just teachin' her howta hold her liquor.</i>\"");
	
	outputText("\n\n\"<i>I am so not cleaning this up,</i>\" Hel grumbles, flopping down beside you and fishing out a flask from her cloak.  \"<i>Well, at least you didn't drink </i>everything<i>.</i>\"");
	//{HelspawnSlutty +10}
	flags[kFLAGS.HELSPAWN_PERSONALITY] += 10;
	doNext(camp.returnToCampUseOneHour);
}

//Event: Helspawn Chooses a Fighting Style
//(Play during the day when returning to camp)
public function helSpawnChoosesAFightingStyle():void {
	clearOutput();
	helScene.helSprite();
	outputText("As you make your way back to camp, you begin to hear the sounds of fighting from ahead.  Readying your [weapon], you pick up the pace until your campsite comes into view.  You relax, seeing that it's only " + flags[kFLAGS.HELSPAWN_NAME] + " and her mother.  Helia's standing near the center of camp, ");
	if(camp.companionsCount() > 3) outputText("apparently having cleared out most of your other followers for the moment, ");
	outputText("her sword held at a guard pose between herself and a training dummy. " + flags[kFLAGS.HELSPAWN_NAME] + " stands a few feet behind her mother, watching intently as Hel paces around the dummy, breathing hard.");
	
	outputText("\n\nSuddenly, the towering salamander screams a deafening battlecry and lunges forward, nearly topping the dummy in a mad bull rush before swinging her scimitar in a flurry of crushing blows that send bits of pieces of dummy flying in all directions.  There isn't much left by the time Hel's finally finished with it, slumping over the fallen mannequin as she huffs and puffs, completely out of breath.");
	
	outputText("\n\n\"<i>Okay, let me... Lemme go pick up the, uh, pieces and then you try, sweetie,</i>\" Hel says, picking up the dummy's severed arm.");
	
	outputText("\n\n\"<i>Hi, " + championRef() + ",</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " says cheerily as you wander over, inspecting the carnage.  \"<i>Mom's teaching me how to be a berzerker.</i>\"");
	
	outputText("\n\nHel chuckles to herself, \"<i>Yep.  Probably gonna need a new dummy, though.  They, uh, appear to have a low survival rate...  hey, any chance you could float me a loan, lover mine?  Got a friend in town who found a sword just like mine, and I'd love for " + flags[kFLAGS.HELSPAWN_NAME] + " to have it.  Kinda strapped for cash at the moment, though. Dad's place sprung a leak, had to get that fixed.</i>\"");
	
	outputText("\n\nWell.  You suppose you could float Hel a loan and let little " + flags[kFLAGS.HELSPAWN_NAME] + " grow up as a furious salamander berzerker just like dear old mom.  Or, if you have the time, you could instead do her combat training yourself.  You probably can't completely get rid of the 'mander temper, but a few hours in the ring with you would certainly make her less brazenly reckless - something Hel could benefit from, too, if she's willing to stick around.");
	//{If PC has a bow & skill 100+}: 
	if(player.statusEffectv1(StatusEffects.Kelt) >= 100) {
		outputText("\n\nThen again, while the little salamander needs to be able to defend herself, it might be better to give her a more defensive weapon altogether.  The guards of your village called the bow the wise man's weapon, as the archers sat behind the lines or atop high walls, picking off enemies.  While you weren't trained with it back home, you've gotten pretty good with your bow during your time here.  Perhaps it's time to pass on those skills to " + flags[kFLAGS.HELSPAWN_NAME] + ".");
	}
	menu();
	if(player.statusEffectv1(StatusEffects.Kelt) >= 100) addButton(2,"Bow",snipermanders);
	addButton(0,"You Train",swordAndBoardmander);
	addButton(1,"Loan",dasBarbarimander);
	
}

//Archery (Dat Snipermander)
private function snipermanders():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HELSPAWN_WEAPON] = "bow";
	outputText("You tell Hel to take a break: you've got this handled. Grabbing your bow and quiver from over your shoulder, you hand them over to ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("your");
	else outputText("Hel's");
	outputText(" eager daughter. " + flags[kFLAGS.HELSPAWN_NAME] + " takes them up with surprising reverence, holding them as gingerly as glass.  Grinning, you clasp her shoulder and tell her how to put the quiver on, and get her stance right for shooting.  It takes her a moment to get set up: her scaled, reptilian legs don't naturally stand in the shooting pose you've adopted");
	if(player.lowerBody == LowerBody.LIZARD) outputText(", even with your own lizard legs");
	outputText(", and you find yourself having to correct her grip on the haft several times.  But, finally, you get her ready to shoot.");
	
	outputText("\n\nYou slip behind " + flags[kFLAGS.HELSPAWN_NAME] + ", putting your arms on hers as you guide her through nocking an arrow, head resting on her fist, a lone finger outstretched toward the dessicated dummy.");
	
	outputText("\n\nBreathing hard, the young salamander draws back the bowstring, lining up on her target.  She chews on her lower lip, eyes squinting, deep in concentration, wanting to make this first shot count - to make you proud.  She looses the arrow, and gasps as it bolts away with lethal force... and sails across camp, well away from the target.");
	//If Rath is @ camp:
	if(player.hasStatusEffect(StatusEffects.CampRathazul)) outputText("  You hear your old alchemist friend suddenly putting up a ruckus as the sounds of breaking glass echo throughout camp.  " + flags[kFLAGS.HELSPAWN_NAME] + " looks up at you nervously, but you ruffle her fiery hair and tell her to try again. Rath is probably just fine.");
	//else if Valeria/Latexy is at camp: 
	else if(flags[kFLAGS.VALERIA_AT_CAMP] == 1) outputText("  You hear a sudden yelp of pain from across camp. Valeria slithers up to you with an irritated look on her gooey face, pointing an accusing finger at an arrow sticking out of her tit.  \"<i>Dammit, [name], I'm a googirl, not a pin cushion!</i>\"  You wave her off, and tell " + flags[kFLAGS.HELSPAWN_NAME] + " to try again.");
	else if(latexGooFollower()) outputText("  You hear a sudden yelp of pain from across camp.  " + flags[kFLAGS.GOO_NAME] + " slithers up to you with an irritated look on her gooey face, pointing an accusing finger at an arrow sticking out of her tit.  \"<i>Dammit, [name], I'm a googirl, not a pin cushion!</i>\"  You wave her off, and tell " + flags[kFLAGS.HELSPAWN_NAME] + " to try again.");
	
	outputText("\n\n\"<i>I-I dunno, " + championRef() + ",</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " whines, biting her lip as she traces the arrow's path with her eyes.  \"<i>Maybe mom was right. I should just stick to a sword. That's easy....</i>\"");
	
	outputText("\n\nYou sigh and tell her to try again.  She can't expect to be perfect on the first try, after all.  It takes a little convincing, but soon you've got " + flags[kFLAGS.HELSPAWN_NAME] + " back into form and nocking an arrow.  You put your hands on hers, helping the young salamander take aim, drawing down on her straw-stuffed target.  Barely audible over " + flags[kFLAGS.HELSPAWN_NAME] + "'s nervous breathing, you whisper, \"<i>Take it easy.  Relax.... Good.  Take aim... now breathe out.  Exhale and loose.</i>\"");
	
	outputText("\n\nAgain, " + flags[kFLAGS.HELSPAWN_NAME] + " lets an arrow fly - and this one strikes true.  You watch the missile streak across camp, slamming into the training dummy's crotch with deadly force.  It sways, buckles, and falls to pieces.");
	
	outputText("\n\n\"<i>Ouch,</i>\" Hel laughs, sipping on her flask behind you.  \"<i>What'd that poor dummy ever do to you?</i>\"");
	
	outputText("\n\n\"<i>I did it!</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " shouts, pumping her fist in the air. Her mother reaches over to ruffle her fiery hair, and you both shower her with congratulations.");

	outputText("\n\nBefore she can get cocky, though, you push the bow back into her hands.  \"<i>Lesson 2, kiddo: one shot is never enough.</i>\"");
	
	outputText("\n\nBy the time " + flags[kFLAGS.HELSPAWN_NAME] + " has her shooting stance back, her mother's already set the dummy back up, ready for round two.  It's several hours long before the three of you quit: time spent drilling " + flags[kFLAGS.HELSPAWN_NAME] + " on stance and aim, even going a round with her and a pair of daggers to remind her that enemies will eventually close in if she's not careful.  She learns quickly, though, and soon she hardly needs your help to plant an arrow in the target's chest.");
	
	outputText("\n\nA few hours like this every night, and ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("your ");
	else outputText("Hel's ");
	outputText("daughter will be a warrior worthy of her parent");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("s");
	outputText("."); 
	doNext(camp.returnToCampUseOneHour);
}

//Teach Her {Sword and Boardmander}
private function swordAndBoardmander():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HELSPAWN_WEAPON] = "scimitar and shield";
	outputText("You tell Hel to take a break: you've got this handled.  You grab some kindling and string from your supplies, and a few minutes later you've got a pair of small, vaguely sword-like practice weapons pieces together.  Tossing one to the young salamander, you tell her to come get some.");
	
	outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " gives the blade a few practice swings before grabbing the wooden blade in both hands and charging at you.  You put your guard up, catching her first overhand blow and turning it aside, nearly toppling the girl over.  She rolls with it, spinning out of your guard and trying a strike from the side.  You parry it, catch an opening, and give her a nice wallop on the shoulder.  A real blade would have nearly cut her arm off, but " + flags[kFLAGS.HELSPAWN_NAME] + " merely stumbles back, yelping in pain.");
	
	outputText("\n\n\"<i>Again,</i>\" you say, assuming your fighting stance.");
	
	outputText("\n\nShe lunges, yelling a warcry as she slashes for your throat.  You nimbly dodge aside, letting her tumble through the space you occupied a moment ago, giving her a swat on the ass as she flies by.  She flops to the ground, eating dirt and rubbing her butt.");
	
	outputText("\n\n\"<i>Owwww.  No fair.  Hold still, " + championRef() + "!</i>\"");
	
	outputText("\n\nYou sigh.  \"<i>Again.</i>\"");
	
	outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " picks herself up and grips her blade.  This time she's a little more cautious, approaching slowly, pausing just out of reach.  You hide a grin and bring your own sword up, the tips of your blades nearly touching.  \"<i>Good.  No need to be reckless, kiddo.  Don't just charge in at the first opportunity; you'll get yourself killed.</i>\"");
	
	outputText("\n\n\"<i>Get " + player.mf("him","her") + ", " + flags[kFLAGS.HELSPAWN_NAME] + "!</i>\" Hel calls from the sidelines, sipping on a mug.  \"<i>Show " + player.mf("him","her") + " what a salamander can do!</i>\"");
	
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("\n\nYour");
	else outputText("\n\nHer");
	outputText(" daughter braces herself, drawing a breath just a second before she launches her attack, giving herself away.  You parry three quick blows, stepping back as " + flags[kFLAGS.HELSPAWN_NAME] + " leaps into another overhand strike.  You dodge, spinning out of the attack and slicing her right across her bare belly.");
	
	outputText("\n\n\"<i>Gah!</i>\" she cries, stumbling to her knees.  \"<i>I-I can't...</i>\"");
	
	outputText("\n\nYou pull " + flags[kFLAGS.HELSPAWN_NAME] + " to her feet and ruffle her hair.  \"<i>C'mon kiddo, don't give up.  Here,</i>\" you say, grabbing a dinner plate and some leather straps from your kit.  In a moment, you've got a rudimentary shield cobbled together.  You fit it over the young salamander's free arm and give her a few pointers on stance.  Nervously, she brings her makeshift shield to bear against you, fidgeting under the heft of it as you make a few slow, easy to parry swings for her to get used to it.  Steadily you pick up the pace, swinging your training sword faster and harder, forcing " + flags[kFLAGS.HELSPAWN_NAME] + " to parry and block, retreating against your onslaught.  You keep it up for a full minute before relenting, letting the kid seize the initiative.  She swings at you, rolling with each parry you make, cleaving into another swing, turning your ripostes aside with her shield and forcing you back.");
	outputText("\n\nYou wince in pain as " + flags[kFLAGS.HELSPAWN_NAME] + " manages to nick you, turning one of your blows aside with her shield and striking through the opening left in your guard.  \"<i>Alright, alright,</i>\" you laugh, rubbing your shoulder.  \"<i>Good job, " + flags[kFLAGS.HELSPAWN_NAME] + ". You're getting the hang of that shield!</i>\"");
	
	outputText("\n\n\"<i>Thanks, " + championRef() + "!</i>\" the little salamander grins, hugging you.");
	
	outputText("\n\n\"<i>Alright, alright,</i>\" Hel says, grabbing the dummy sword from your hand.  \"<i>Now it's time to fight a REAL warrior, " + flags[kFLAGS.HELSPAWN_NAME] + ". Come get some!</i>\"");
	
	outputText("\n\nIt's several hours long before the three of you quit: time spent drilling " + flags[kFLAGS.HELSPAWN_NAME] + " on stance and parrying, trading off with Helia every few rounds to keep ");
	if(flags[kFLAGS.HELSPAWN_DADDY] != 0) outputText("her");
	else outputText("your");
	outputText(" daughter on her toes.  She learns quickly, though, and soon she hardly needs reminding to keep her shield up and stance braced against Helia's overwhelming assaults.");
	
	outputText("\n\nA few hours like this every night, and ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("your ");
	else outputText("Hel's ");
	outputText("daughter will be a warrior worthy of her parent");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("s");
	outputText(".");
	//{HelSpawnChaste +10}
	flags[kFLAGS.HELSPAWN_PERSONALITY] -= 10;
	doNext(camp.returnToCampUseOneHour);
}

//Berzerker (Das Barbarimander)
//{if PC has 200 gems}
private function dasBarbarimander():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HELSPAWN_WEAPON] = "scimitar";
	if(player.gems >= 200) {
		outputText("You sigh and dig out a handful of gems.  Helia beams at you, planting a quick kiss on your cheek before grabbing " + flags[kFLAGS.HELSPAWN_NAME] + " and the loot.  \"<i>Thanks for the loan, lover mine.  C'mon, sweetie, we're going for a trip to town.</i>\"");
		outputText("\n\n\"<i>Awesome!</i>\" the little 'mander grins, following along after her mother.");
		player.gems -= 200;
	}
	//{if PC is po' as fuck}
	else {
		outputText("\n\nYou turn out your pockets, telling Hel you're about a broke as she is.  The salamander groans, dramatically putting a hand to her brow in mock shame, \"<i>Woe is me, forced to turn tricks in a dark alley to provide for my child!</i>\"");
		outputText("\n\nA moment passes in silence.  \"<i>Bad taste, huh?  Guess I'll just go kick some minotaurs' shit in.  C'mon, sweetie, we're going hunting!</i>\"");
		outputText("\n\n\"<i>Awesome!</i>\" the little 'mander grins, following along after her mother.");
		outputText("\n\nYou can't imagine how that could end badly.");
		//{HelSpawnSlutty +10}
		flags[kFLAGS.HELSPAWN_PERSONALITY] += 10;
	}
	doNext(camp.returnToCampUseOneHour);
}
		
//Event: Helspawn's a Little Slut Like Mommy
//{Play at night, while sleeping.}
public function helspawnIsASlut():void {
	if (prison.inPrison) { //No choices for you in prison!
		prison.prisonLetter.noControlOverHelspawn();
		return;
	}
	helScene.helSprite();
	flags[kFLAGS.HELSPAWN_FUCK_INTERRUPTUS] = 1;
	outputText("\nSomething's moving in your camp.");
	
	outputText("\n\nYour eyes flicker open as a scaled foot moves past your face, hushed breathing barely concealing a giggle.  Another foot, this time a shimmering blue-black, moves past.  You ");
	if(player.weaponName != "fists") outputText("clutch your [weapon]");
	else outputText("ball your fists");
	outputText(" as the intruder passes by, ready to defend yourself and your loved ones.  The moment they're out of reach, you roll onto your [feet], looking around for signs of a massed demon attack.  Instead, you see the outline of " + flags[kFLAGS.HELSPAWN_NAME] + " in the dying embers of the fire light, leading what looks like a spider girl by the hand toward her bed.");
	
	outputText("\n\nYou creep closer, trying to get a closer look at what your ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("daughter ");
	else outputText("ward ");
	outputText("is doing.  Well, it doesn't take a genius to figure that out, really, but still, you have to be sure.  You slide right up to them, just out of their lines of sight, as " + flags[kFLAGS.HELSPAWN_NAME] + " turns around, letting the spider-kin unclasp her bra and grab her tits, squeezing the small mounds as " + flags[kFLAGS.HELSPAWN_NAME] + " suppresses a moan, reaching back to slip a hand into the spider's crotch, grabbing her - his dick.");
	
	outputText("\n\nWell then. You suppose you ought to go stop " + flags[kFLAGS.HELSPAWN_NAME] + " from making a whore of herself... but then again, she's old enough to make her own mistakes by now.");
	if(player.cor >= 50) outputText("  And by mistake you clearly mean old enough to get her ass fucked in by a cute little spider trap... you contemplate jumping in on it, but with a sigh figure it's " + flags[kFLAGS.HELSPAWN_NAME] + "'s catch.  Let her enjoy it.");
	menu();
	addButton(0,"Stop Them",helSpawnStopFucking);
	addButton(1,"Do Nothing",helspawnDoNothing);
}

//Do Nothing
private function helspawnDoNothing():void {
	clearOutput();
	helScene.helSprite();
	outputText("You turn around and head back to your bed.  As soon as you're under your blanket, your ears are assaulted with the quiet moans and grunts of pleasure coming from " + flags[kFLAGS.HELSPAWN_NAME] + "'s bed as she and her first little boyfriend get it on.  You can practically hear the tail-pegging from here.  How cute!");
	//{HelspawnSlutty +10}
	flags[kFLAGS.HELSPAWN_PERSONALITY] += 10;
	doNext(playerMenu);
}

//Stop Them
private function helSpawnStopFucking():void {
	clearOutput();
	helScene.helSprite();
	outputText("You sigh and step out of the shadows, grabbing the feminine little spider boy by the shoulder and yanking him away from " + flags[kFLAGS.HELSPAWN_NAME] + ".  \"<i>And just what the hell do you two think you're doing?</i>\" you yell, scowling ");
	if(player.tallness >= 90) outputText("up ");
	else if(player.tallness <= 72) outputText("down ");
	outputText("at your ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("daughter ");
	else outputText("ward ");
	outputText(". " + flags[kFLAGS.HELSPAWN_NAME] + " gives a shrill cry of surprise and tumbles away from you, trying to cover herself as best she can; the spider trap squirms in your unrelenting grasp, one set of arms covering his rapidly-wilting erection as the other flails around, trying to get you off of him.  Not happening.");
	
	outputText("\n\n\"<i>You!</i>\" you say, pointing an accusing finger at " + flags[kFLAGS.HELSPAWN_NAME] + ".  \"<i>What the hell, kid?  Who the fuck is this?</i>\"");
	
	outputText("\n\n\"<i>That's, uh.... Alex, meet ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("my dad");
	else outputText("[name]");
	outputText(". " + championRef() + ", Alex.</i>\"");
	
	outputText("\n\n\"<i>H-hi.</i>\" the spider mumbles, his voice high and adorably girly.");
	
	outputText("\n\n\"<i>And you!  You leave my girl alone, you hear me?  Leave.  Her.  ALONE!</i>\"");
	
	outputText("\n\n\"<i>B-but I...</i>\"");
	
	outputText("\n\n\"<i>" + championRef() + "...</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " groans as you grab the spider boy and toss him out of camp, watching with hawk-like eyes as he slinks back to his jungle.  When he's gone, you sigh and walk over to " + flags[kFLAGS.HELSPAWN_NAME] + ", wiping a tear from her cheek.  Putting an arm around her shoulder, you give her a long, long talk about not being a whore.");
	
	outputText("\n\n\"<i>B-but mom...</i>\"");
	
	outputText("\n\n\"<i>That's why you </i>shouldn't<i> be bringing men home.  Or women.  Or anything else, kiddo.");
	//If No Hel Love:
	if(flags[kFLAGS.HEL_LOVE] != 0) outputText("  You don't want to be a whore like your mother, do you?  The girl that everyone's had a ride with.");
	//if HelLove:
	if(flags[kFLAGS.HEL_LOVE] == 1) outputText("  I'm not going to a raise a whore, " + flags[kFLAGS.HELSPAWN_NAME] + ".  Your mother's made mistakes, sure, but...</i>\" you sigh.  \"<i>");
	outputText("  You don't have to be that person, " + flags[kFLAGS.HELSPAWN_NAME] + ".  Don't just give yourself out to the first person that asks, you know?  Save it for someone you really care about.  Trust me, it'll be worth it.</i>\"");
	outputText("\n\nYou spend a bit more time with the chastened, and hopefully now more chaste, salamander girl before putting her to bed.  Stroking her hair, you slip back to your own bunk, hoping she'll take what you've said to heart.");
	//{HelspawnChaste +10}
	flags[kFLAGS.HELSPAWN_PERSONALITY] -= 10;
	doNext(camp.returnToCampUseOneHour);
}

//Capstone Event: Helspawn's All Grown Up
//{Play the morning after Event 3}
public function helspawnAllGrownUp():void {
	clearOutput();
	helScene.helSprite();
	outputText("You wake up the next morning, and soon find your eyes drawn to where " + flags[kFLAGS.HELSPAWN_NAME] + " lies, barely an arm's reach from her mother's hammock, still snoring peacefully.  You sigh wistfully as you get up and get dressed, still thinking of the night before and your girl's little misadventure with the spider.  God, she's grown up fast.  Faster than you could have imagined - or her mother, for that matter.  Helia, too, is still reeling from her daughter's rapid, mutagenic growth.  But there's nothing to be done about that, now, and it seems she's reached what passes for adulthood in this strange world.  She's had the body of a woman for some time now, and it seems the mind and desires of one as well.");
	
	outputText("\n\nA part of you is sad to see her all grown up, and now you know it's time to treat your ");
	
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("daughter ");
	else outputText("ward ");
	outputText("like a woman.  The time to raise her, to shape her development, is over.  You can only hope you've done a good enough job to keep her safe in this hellish world; to give her sound judgment and the abilities she'll need to protect herself in the years and adventures to come.");
	
	outputText("\n\n<b>" + flags[kFLAGS.HELSPAWN_NAME] + " has been added to the Followers menu!</b>");
	flags[kFLAGS.HELSPAWN_AGE] = 3;
	flags[kFLAGS.HELSPAWN_GROWUP_COUNTER] = 0;
	doNext(camp.returnToCampUseOneHour);
}


//Helspawn’s Main Menu @ Camp [Followers Tab]
public function helspawnsMainMenu():void {
	clearOutput();
	outputText("You call " + flags[kFLAGS.HELSPAWN_NAME] + " over to you and she comes running, ");
	if(player.tallness <= 72) outputText("grabbing you off your [feet] and clutching you in a tight hug");
	else outputText("throwing her arms around you and hugging you tightly");
	outputText(".  Laughing despite yourself, you ruffle her fiery hair and ask her if she’s got a minute.");
	
	outputText("\n\n\"<i>Sure, " + championRef() + "!  What’s up?</i>\"");
	addButton(0, "Appearance", helSpawnsAppearanceScreen).hint("Take a closer look at [helspawn] and admire the beauty of your daughter.");
	//[Talk]
	addButton(1, "Talk", talkToHelspawn).hint("Spend some time talking with [helspawn].");
	//[Sex]; bipeds only, lust must be high, incest must be flagged active, and player must have a dick.
	if (flags[kFLAGS.HELSPAWN_INCEST] == 1) {
		addButton(5, "Sex", helSpawnSexMenu).disableIf(player.lust < 33, "You're not aroused enough to have sex");
		addButton(6, "Kiss", helspawnSmooch).hint("Kiss your daughter romantically.");
	}
	//[Spar]
	addButton(4, "Spar", sparHelspawn).hint("Have a sparring match with [helspawn].");
	//[Hug]
	addButton(3, "Hug", hugHelspawn).hint("Share a nice hug with your daughter. You are sure she'll love it, she's Hel's girl after all.");
	//[Headpat]
	addButton(2, "Headpat", helspawnHeadpats).hint("Good daughters get pats.");
	//[Sleep With]
	addButton(9, "Sleep " + (flags[kFLAGS.SLEEP_WITH] == "Helspawn" ? "Alone" : (flags[kFLAGS.SLEEP_WITH] == "salamanders" ? "Without" : "With")), sleepWithHelspawn);
	if ((flags[kFLAGS.SLEEP_WITH] != "Helia" || flags[kFLAGS.SLEEP_WITH] != "salamanders") && !flags[kFLAGS.HELSPAWN_INCEST]) addButtonDisabled(9, "Sleep With", "Your relationship would need to become more intimate before you can sleep with her.");
	addButton(14, "Back", flags[kFLAGS.HELSPAWN_INCEST] ? camp.campLoversMenu : camp.campFollowers);
}

public function helSpawnSexMenu():void {
	menu();
	if (silly()) addButtonIfTrue(0,"Marathon", sexHelspawn, "This scene requires you to have a cock.",!player.hasCock());
	//Note--the first part of the following scene could be used as a chaste sex introduction should more options ever be made.
	if (flags[kFLAGS.HELSPAWN_PERSONALITY] < 50) {
		addButton(1, "Lovemaking", helspawnLovemaking);
		addButtonIfTrue(2,"Facesitting", helspawnFacesitting, "This scene requires you to have a vagina.",!player.hasVagina());
	}
	else addButton(1,"Fuck Her", helspawnSlutsex).hint("Have some fun with your indecent daughter");
	addButton(4, "Footjob", helspawnFootjob).hint("Have her use those cute, reptilian feet.");
	addButton(14, "Back", helspawnsMainMenu);
}

//Hug
private function hugHelspawn():void {
	clearOutput();
	//{if PC is less than 6' tall:}
	if(player.tallness <= 72) {
		outputText("You reach up and pull " + flags[kFLAGS.HELSPAWN_NAME] + " down to your level, wrapping your arms tight around her slender shoulders.  Grinning from ear to ear, the towering girl squeezes you right back, her powerful muscles just about crushing your smaller body.  Her tail slips around your [hips], the warm leather binding you to your beloved ");
		if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("daughter ");
		else outputText("ward ");
		outputText("as she nuzzles up against you.");
		
		outputText("\n\n\"<i>Love you too, " + championRef() + ",</i>\" she laughs, planting a quick kiss on your cheek before letting you go.");
	}
	//{If PC is 6' or taller:}
	else {
		outputText("You grab " + flags[kFLAGS.HELSPAWN_NAME] + " and pull her into a tight hug.  She lets out a girlish giggle as she falls into your arms and squeezes you right back.  Her powerful arms threaten to crush your bigger body, smothering you in affection.  Her tail slips around your [leg], the warm leather binding you to your beloved ");
		if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("daughter ");
		else outputText("ward ");
		outputText(" as she nuzzles into your [chest].");
		
		outputText("\n\n\"<i>Love you too, " + championRef() + ",</i>\" she laughs, planting a quick kiss on your cheek before letting you go.");
	}
	doNext(camp.returnToCampUseOneHour);
}

//Talk
private function talkToHelspawn():void {
	//{Note: Talk 1 displays first and only once, followed by a random selection from the other scenes. Most of Helspawn's talk scenes involve other characters from camp, since after all, it takes a village!}
	clearOutput();
	var temp:int = rand(5);
	//Talk 1
	if(flags[kFLAGS.HAD_FIRST_HELSPAWN_TALK] == 0) {
		flags[kFLAGS.HAD_FIRST_HELSPAWN_TALK]++;
		outputText("You sit down with " + flags[kFLAGS.HELSPAWN_NAME] + ", telling her you need to talk.  Specifically, about her nocturnal misadventures.  She gulps, but you reassure her with a pat on the back, telling her it's all right.  She's a grown woman, now, as frightening as that is - for her and her mother both, it seems.  But she's an adult now, with the needs and cunning and abilities of one.  She can fight, drink, and she can fuck.  She's not a child anymore, even if she'll always be your kid at heart.");
		outputText("\n\nShe smiles.  \"<i>Sorry for bringing my friend home uninvited.  I just... didn't want to upset you. I love you, " + championRef() + ",</i>\" she says, resting her head on your shoulder, tail slipping around your waist.  You smile, holding the young 'mander girl - no, woman - close.  You tell her that you love her too, and that you're worried about her bringing random monsters home.");
		//{if Sluttymander:
		if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) outputText("  Even if she wants to be just like mom, she shouldn't be bringing monsters home.  Some of them may be dangerous, and she's not a warrior quite like you and Helia yet.");
		else outputText("  She should know better than to bring monsters back.  She's not her mother; lust doesn't have to dominate her life like that.");
		
		outputText("\n\nPerhaps you could learn more about this spider boy of hers.  He actually had a name, and seemed to be fairly civil.  Lucky break for her.  Then again, you could tell her to just save herself and stop trying to fuck things altogether.  ");
		if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("Of course, as her father, you could always say it's your duty to keep her happy...");
		else outputText("Of course, as her adoptive father, you could always say that you love her in a different, more intimate way.");
		outputText("  She wouldn't need monsters with you around.");
		menu();
		addButton(0,"Stop Fucking",dontFuckAlex);
		addButton(1,"Her Boyfriend",helSpawnBoyfriend);
		addButton(2,"Incest",incestWithHelspawn);
		//if (silly() && flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) addButton(3, "Both", whyNotBoth).hint("Why don't we have both?")
	}
	//Talk 2
	//{Kiha must be at camp}
	else if(temp <= 0 && followerKiha()) {
		outputText("\"<i>Oh hey, " + championRef() + "!  You gotta come see what I was making!</i>\"");
		outputText("\n\nShe grabs you by the [armor], pulling you back toward where she had been standing, near the center of camp.  A large cast-iron cauldron’s sitting on your firepit, full of a dark-green substance that’s bubbling along.  Your dusky dragoness lover, Kiha, is sitting on the edge of the pot, apparently immune to the scalding heat, a long wooden ladle grasped between her dexterous claws.  She grins up at you as you and your daughter wander over.  \"<i>Hey, Doofus, come for an early taste?</i>\"");
		outputText("\n\n\"<i>C'mon, " + championRef() + ", try it!</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " adds happily.  \"<i>It's aunt Kiha's favorite recipe.</i>\"");
		
		outputText("\n\n\"<i>And it'll be YOUR favorite too, mini-doofus, just you wait,</i>\" the dragoness laughs, her foot making another slow, steady circuit around the pot, stirring the ingredients.  Grinning at you, Kiha lifts her landle up, letting you take it from between her toes.  The powerful reek of whatever it is they’re trying to cook almost overwhelms you when you bring it up to your lips, nearly staggering you.  By Marae, what did Kiha <i>put</i> in this?  Raw ass?");
		//[Oh God EW] [Um, yum?]
		menu();
		addButton(0,"Oh God Ew",ohGodEwKihaAndHelspawnSuckAtCooking);
		addButton(1,"Um, Yum?",umYum);
	}
	//Talk 3
	//{Needs Rath at camp]
	else if(temp <= 1 && player.hasStatusEffect(StatusEffects.CampRathazul)) {
		outputText("\"<i>" + flags[kFLAGS.HELSPAWN_NAME] + "!</i>\" you hear a ragged old voice call, \"<i>Get back here this instant!  I'm not done with you yet!</i>\"");
		
		outputText("\n\n\"<i>Coming!</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " calls back as Rathazul shuffles into view, waving around what looks like a tiny hammer.  Whispering, " + flags[kFLAGS.HELSPAWN_NAME] + " says, \"<i>Could you come with me, " + championRef() + "? Rathazul weirds me out.</i>\"");
		
		outputText("\n\nChuckling, you nod and follow " + flags[kFLAGS.HELSPAWN_NAME] + " as she returns to Rath's makeshift laboratory and seats herself on one of his tables.  Grumbling about kids, the old rat proceeds to rap his little hammer on her knee - nearly getting kicked in the face for his trouble - before asking her to hold her breath as he listens to her heartbeat.  She's nearly blue in the face before he nods approvingly and tells her she can go. " + flags[kFLAGS.HELSPAWN_NAME] + " goes running, happy to get away as Rath turns to you, shaking his head.");
		
		outputText("\n\n\"<i>Just checking up on her, [name].  Her meteoric growth is of some concern - and scientific interest, I might add, if I could determine what caused it.  If I could mass-produce it.  ");
		if((amilyScene.amilyFollower() && !amilyScene.amilyCorrupt())) outputText("Little Amily's solution was makeshift at best, and the children are beyond my reach to study.  Still.  ");
		outputText("Imagine whole legions of children reared and raised in the time it takes a goblin to do the same. We might have a fighting chance for once, with numbers to match the demons.</i>\"");
		
		outputText("\n\n\"<i>But I suppose that's still out of reach, [name].  She's finished growing, and there's no sign of the exact chemical needed to synthesize the compound.  I'll keep checking up on her for health, though perhaps one day I'll find the means to make accelerated growth safe and widespread.  An old man can hope, yes?</i>\"");
		doNext(camp.returnToCampUseOneHour);		
	}
	//Talk 4
	//{Bath Slut w/ DD or HHH must be at camp}
	else if(temp <= 2 && milkSlave() && flags[kFLAGS.MILK_SIZE] > 0) {
		outputText("\"<i>Hey, have you seen " + flags[kFLAGS.MILK_NAME] + " around anywhere, " + championRef() + "?</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " asks, looking around the camp.  \"<i>Mom asked me to milk her, but I haven't seen her around.  She wouldn't have run off, would she?</i>\"");
		if(flags[kFLAGS.MILK_SIZE] == 1) outputText("\n\nYou tell her it'd be more of a wobble, but");
		else outputText("\n\nYou doubt she would have; " + flags[kFLAGS.MILK_NAME] + " seems to have a fancy for you, but");
		outputText(" it wouldn't hurt to check around.  She does tend to wander into the traps around camp from time to time.  Offering " + flags[kFLAGS.HELSPAWN_NAME] + " your hand, you start searching the camp for your missing milk maid.  The two of you make a circuit around camp, checking the traps and behind various rocks and hollows, to no avail.  Finally, as you're starting to get worried about the dusky maid, you happen to look into the steel pool in her part of camp.  Sure enough, you spy " + flags[kFLAGS.MILK_NAME] + " curled up at the bottom of the pool, cuddled up with a ragged blanket to catch a quick nap.");
		outputText("\n\n\"<i>Aww,</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " grins, looking down at the napping " + flags[kFLAGS.MILK_NAME] + ".  \"<i>Guess I can milk her later, then.</i>\"");
		menu();
		addButton(0,"MilkHerLater",	helSpawnSureMilkHerLater);
		addButton(1,"MilkHerNow",helSpawnMilkHerNow);
	}
	//Talk 5
	//{Isabella must be at camp}
	else if(temp <= 3 && isabellaFollower()) {
		outputText("\"<i>Oh hey, " + championRef() + "!</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " says, suddenly grinning, \"<i>Mom bought me a new guitar in town.  Wanna come listen?</i>\"");
		
		outputText("\n\n\"<i>Sure, kiddo,</i>\" you say, absently wondering how she plays a guitar with those giant claws of hers as she leads you back to her and Helia's part of camp, where she quickly produces a dinged up guitar.  Looks like Hel's been visiting the pawn shop, but hey, " + flags[kFLAGS.HELSPAWN_NAME] + " doesn't seem to mind.  She hops up onto a nearby rock and gives the instrument a few experimental strums, pausing to adjust the tuning or fix a string that snaps a little too easily.  But after a moment of preparation, she's ready.");
		
		outputText("\n\nA soft, melodic tune starts to play as " + flags[kFLAGS.HELSPAWN_NAME] + "'s dexterous fingers dance across the fret, plucking at the strings with some small hesitation.  She's a beginner, but not bad at all; the simple tune is sweet and she plays it with burgeoning proficiency, slowly settling into the rhythm of the piece until you can close your eyes and relax, letting her playing sooth you, carrying your troubles far away.  You barely notice when a high, soft voice adds itself to the guitar, a lilting, haunting soprano that slowly grows in power as the young 'mander's playing intensifies, building toward crescendo.  She's singing, surely, but the words are alien and unknowable; you think, for a moment, that perhaps they're in Helia's native tongue, but when a second voice, powerful and operatic, joins " + flags[kFLAGS.HELSPAWN_NAME] + "'s, you know who's been teaching her.");
		
		outputText("\n\nYou open an eye as Isabella approaches, belting out a misty-eyed verse in her strange language, and you can practically feel her homesickness, her separation from a lifetime of friends and loved ones.  As her arms cross under her enormous breasts, you can't help but think of the mutations she has undergone");
		if(player.race() != "human") outputText(" and you yourself have suffered as well");
		outputText(".  You smile as Isabella seats herself beside " + flags[kFLAGS.HELSPAWN_NAME] + ", joining their voices together for the final chorus that leaves them both shaking as " + flags[kFLAGS.HELSPAWN_NAME] + " strums the last, desperate notes, nearly clawing through the strings in her passion.");
		
		outputText("\"<i>");
		if(!isabellaAccent()) outputText("Sehr gut");
		else outputText("Very good");
		outputText(" little " + flags[kFLAGS.HELSPAWN_NAME] + ",</i>\" Isabella says, pulling the young 'mander into a great big hug that threatens to smother her betwixt the cowgirl's massive bosoms.  Grinning, you congratulate " + flags[kFLAGS.HELSPAWN_NAME] + " on her performance, showering your girl in praise before you depart, leaving her to Isabella's instruction.  As you walk away, you can't help but notice Helia standing a short ways off, rubbing her eyes.");
		
		outputText("\n\nWhen you approach, your lover smiles at you, saying, \"<i>I always wanted to be a bard when I was a little girl.  I'm... I'm glad " + flags[kFLAGS.HELSPAWN_NAME] + "'s getting the chance, at least.</i>\"");
		doNext(camp.returnToCampUseOneHour);
	}
	else {
		outputText("Unfortunately, there doesn't seem to be anything in particular to talk about at the moment.  The two of you spend the time in companionable quiet, making smalltalk.");
		doNext(camp.returnToCampUseOneHour);
	}
}

//Boyfriend
private function helSpawnBoyfriend():void {
	clearOutput();
	outputText("\"<i>So tell me about this spider boy.</i>\"");
	outputText("\n\n\"<i>Alex?</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " asks, brightening up.  \"<i>I met him on the way to Tel'Adre.  Mom was stopping to, uh, take care of a few stray witches, and I ended up wandering off...</i>\" she says, launching into the tale of her meeting the effeminate spider boy, and the whirlwind romance that brought them giggling back to camp in the middle of the night.  It's typical teen talk, but then, you're not much older than she seems, now, and you remember the days at home when you could have done the same.  You grin as she recounts her first kiss, and note the bright blush on her cheek.");
	
	outputText("\n\nMaybe she ought to keep seeing this boy after all...");
	doNext(camp.returnToCampUseOneHour);
}


//StopFucking
private function dontFuckAlex():void {
	clearOutput();
	outputText("Stroking " + flags[kFLAGS.HELSPAWN_NAME] + "'s hair, you try to tell her that there's a better way, that she doesn't have to just fuck everything she comes across.  Her mother's that way, sure, but she could do so much better, so much more with herself than giving in to constant lust.");
	//{If Sluttymander:}
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) {
		outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " scoffs, shaking her head.  \"<i>But I </i>like<i> mom's way.  I love jilling off, the feeling of my cunt getting stretched and my ass being torn apart by the big toys I buy in town.  That's who I am, " + championRef() + ".  I'm like mom, and I don't think... no, I know I don't want to change.  I love sex, even if you stopped me and Alex from it.  I want to feel a gang of minotaurs raping me, I want to jump on a drider's cock and ride him down.  I want to do the things I heard mom doing, and that's just what I'm going to do. I'm sorry.</i>\"");
		
		outputText("\n\nYou try to say something, but " + flags[kFLAGS.HELSPAWN_NAME] + " steps away, calling back, \"<i>I love you, " + championRef() + ", but I can't be what you want me to be.  I'm going to be a slut like mom, and there's nothing you can do to stop me!  It's who I was born and raised to be.</i>\"");
		
		outputText("\n\nYou may have made a horrible mistake.");
	}
	//{If Chastemander:}
	else {
		outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " nods slowly, taking in your words.  \"<i>I... I know, " + championRef() + ".  I'm sorry I brought Alex home last night.  It won't happen again.  I don't... I love mother, but I don't want to be like her.  A whore.  She's a great woman, but the things she does... they disgust me.</i>\"");
		
		outputText("\n\nShe catches herself and sighs.  \"<i>I shouldn't say that.  I'm sorry, I know she tries.  She loves us, even if she has a strange way of showing it.  I'll do better in the future.  I promise.</i>\"");
	}
	doNext(camp.returnToCampUseOneHour);
}

//Incest / You & Me
private function incestWithHelspawn():void {
	clearOutput();
	outputText("You cup " + flags[kFLAGS.HELSPAWN_NAME] + "'s cheek, turning her to you... only to have her leap you, straddling your [legs] as her powerful arms wrap around your neck.  Her thin lips press hard to yours, slender tongue probing against yours as her svelte body presses against you.  You respond in kind, grabbing her big ass and squeezing, kneading the delicious curves as she starts to grind against you, breath hot and heavy on your " + player.skinFurScales() + ".  \"<i>I said I love you, " + championRef() + ",</i>\" she grins, so close you can practically feel the beat of her heart through her perky breasts.  \"<i>Glad to know you feel the same way.</i>\"");
	
	outputText("\n\nYou grin as the beautiful salamander strokes your cheek, and says, \"<i>You're a hell of a lot better than any femmy spider boy, " + championRef() + ".  I'm a lucky girl to have someone like you to raise me... and to love me.</i>\"");
	
	outputText("\n\nYou kiss her again and send her on her way with a sharp swat on the ass.  She gives it a sexy wiggle as she walks, winking back at you as she saunters off.");
	dynStats("lus", player.sens/10+5, "scale", false);
	flags[kFLAGS.HELSPAWN_INCEST] = 1;
	doNext(camp.returnToCampUseOneHour);
}

//[Oh God EW]
private function ohGodEwKihaAndHelspawnSuckAtCooking():void {
	clearOutput();
	outputText("You spew the stew onto the ground and grab a nearby waterskin, trying to flush the taste from your mouth.  Kiha and " + flags[kFLAGS.HELSPAWN_NAME] + " look on with horror as you wipe your mouth and begin to try and coherently explain just how god awful whatever that... STUFF... you just put in your mouth was.  Shock turns to anger before you’re halfway through admonishing the pair of scaly redheads.  Kiha scowls at you and snatches the ladle from you.");
	outputText("\n\n\"<i>Oh, what the fuck do you know anyway, you big ass!  It's perfectly fine, isn't it " + flags[kFLAGS.HELSPAWN_NAME] + "?</i>\" she growls, spooning up a mouthful of the stuff before you can stop her.  A heartbeat after she swallows, Kiha goes completely stiff; her eyes growing as wide as saucers as they water.  She collapses backwards, falling onto her back with a muted <i>THUD</i>.");
	
	outputText("\n\n\"<i>K-Kiha?</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " yelps, watching the dragoness collapse into a pile of limp scales and leather.  \"<i>Are you okay?  Is she okay, " + championRef() + "?</i>\"");
	
	outputText("\n\nLooking down at the clearly unconscious dragoness, you pick up the cauldron and dump it out onto the parched earth, watching the wasteland swallow the abominable concoction up - though even it seems hesitant to consume Kiha's cooking, as the cracks in the ground fill with the musky liquid, only slowly draining away into the dirt.");
	outputText("\n\n\"<i>Right,</i>\" you say, washing out the cauldron, \"<i>let me show you how it's really done, kiddo.  Pass me that spoon?</i>\"");
	
	outputText("\n\nYou and " + flags[kFLAGS.HELSPAWN_NAME] + " are soon working away, stirring up your own special blend of your rations and the spices she and Kiha gathered for the first attempt.  Once you've got the basics in, you step back and hand the ladle over, telling the young 'mander to go wild.  Grinning like a kid, she goes to work, mixing in a wild combination of ingredients.  The cauldron's full to bursting by the time she's done, and no sooner does she ladle out the first bowel of it than Kiha sits up, groaning.");
	
	outputText("\n\n\"<i>The fuck happened?</i>\" the dragoness hisses, rubbing her temple.  \"<i>Feel like I got hit with a hammer.</i>\"");
	
	outputText("\n\n\"<i>You, uh, fell off the edge, aunt Kiha.  And spilled all the stew.  Here, we remade it for you!</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " lies, presenting \"aunt Kiha\" with a bowl full of an aromatic brown goop, full of carrots and spices floating atop it like boats on a placid lake.  At least it smells better.");
	
	outputText("\n\n\"<i>Hmm?</i>\" Kiha says, snatching the bowl.  \"<i>You didn't muck with this, did you doofus?</i>\" she asks, giving you an accusing glance.");
	
	outputText("\n\n\"<i>Of course not.  Just the way you'd have made it,</i>\" you lie, crossing a pair of fingers behind your back.");
	
	outputText("\n\nKiha gives you an incredulous look, but takes a tentative sip anyway.  Her eyes brighten as she takes a second, and then a third gulp, soon shoveling it in greedily.  \"<i>Told ya, doofus!</i>\" she gloats, putting down the empty bowl.  \"<i>Nothing beats aunt Kiha's special recipe!</i>\"");
	
	outputText("\n\nYou just shake your head and grab a bowl, sitting down with the scaly ladies as you enjoy your lunch, trying to ignore the little shit-eating grin " + flags[kFLAGS.HELSPAWN_NAME] + "'s sporting all the while.");
	player.refillHunger(25);
	doNext(camp.returnToCampUseOneHour);
}
private function umYum():void {
	clearOutput();
	outputText("Um, yum?");
	if (player.hunger > 25)
	{
		outputText("\n\nCringing, you set the offered bowl back down, squeaking out that it's delicious, thank you very much, but you have something to take care of right now; maybe you can have more later.  Kiha rolls her eyes and shoos you off before she and " + flags[kFLAGS.HELSPAWN_NAME] + " spoon out their lunch. \n\nAs you're wandering off looking for somewhere to hurl, ");
		player.refillHunger(5);
	}
	else
	{
		outputText("\n\nCringing, you are about to set the offered bowl back down but you are reminded by your growling stomach. You have no choice but to cover your nose and just gulp down the contents of the stew. ");
		player.refillHunger(25);
		outputText("\nYou feel a bit nauseous. That stew surely is strange.");
		if (rand(3) == 0)
		{
			//Player vomits. Poor player. Damages hunger by 15-25.
			outputText("\n\nGasp! You feel like you're going to throw up. You get up and rush behind the bushes. You suddenly bend over and spew the contents of your stomach from your mouth onto the ground. It takes a while but you eventually recover and you get up. ");
			player.takePhysDamage(player.maxHP() / 4);
			player.damageHunger(rand(10) + 15);
			dynStats("lib", -10);
			dynStats("lust", -100, "scale", false);
		}
		outputText("You set the finished bowl down and ")
	}
	outputText("you hear the tell-tale groans and gagging of a pair of scaly ladies who've just realized what kind of abomination they've created.");
	
	outputText("\n\nMaybe you ought to start doing the cooking around here...");
	doNext(camp.returnToCampUseOneHour);
}

//Sure
private function helSpawnSureMilkHerLater():void {
	clearOutput();
	outputText("You chuckle, telling her to let the poor girl sleep.  There'll be plenty of milk later.");
	doNext(camp.returnToCampUseOneHour);
}

//Now
private function helSpawnMilkHerNow():void {
	clearOutput();
	outputText("\"<i>Oh, no.  You're not getting out of your chores that easy, kiddo.  In you go,</i>\" you say, giving her a little push toward the edge of the pool.");
	
	outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " gives a rebellious huff as she clambers down, slipping down to the bottom and giving " + flags[kFLAGS.MILK_NAME] + " a gentle nudge.  \"<i>C'mon, cutey, wake up.  Time to relieve some pressure.</i>\"");
	
	outputText("\n\nYawning powerfully, " + flags[kFLAGS.MILK_NAME] + " rises to her knees and rubs the sleep from her eyes");
	if(flags[kFLAGS.MILK_SIZE] == 2) outputText(", already working to unfasten her shift");
	outputText(".  \"<i>Suckle?</i>\" she asks, turning her full teats toward " + flags[kFLAGS.HELSPAWN_NAME] + ".");
	
	//If Sluttymander:
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) outputText("\n\n\"<i>Wouldn't have it any other way!</i>\" the salamander answers with an eager grin, easing herself into " + flags[kFLAGS.MILK_NAME] + "'s arms and wrapping her lips around one of her prominent teats. " + flags[kFLAGS.MILK_NAME] + " gives a pleasured little shudder as " + flags[kFLAGS.HELSPAWN_NAME] + " starts to suckle like a babe, drinking down the dusky maid's seemingly endless supply of milk.");
	
	//If Chastemander:
	else outputText("\n\n\"<i>Sorry, " + flags[kFLAGS.MILK_NAME] + ", you know I'm not really into that.  Just turn around and sit back, alright?</i>\"  With a sigh, " + flags[kFLAGS.MILK_NAME] + " does as she's asked, leaning back into " + flags[kFLAGS.HELSPAWN_NAME] + "'s arms as the young salamander goes to work, clawed fingers gently caressing her prominent nubs until a white flow springs fort, splashing her knees as the dusky maid gives a little gasp of pleasure.");
	
	outputText("\n\n<i>They seem to get on all right</i>, you think as you watch the pair of them.  It's nice to have someone else around to help keep " + flags[kFLAGS.MILK_NAME] + "'s production under control.  Poor thing just never stops lactating.");
	doNext(camp.returnToCampUseOneHour);
}

//Spar
private function sparHelspawn():void {
	clearOutput();
	outputText("You ask " + flags[kFLAGS.HELSPAWN_NAME] + " if she's up for some battle practice, and she answers with an eager nod as she grabs her weapon.");
	//If Sluttymander: 
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) outputText("\n\n\"<i>Ready to get your shit kicked in, old " + player.mf("man","lady") + "?</i>\" she grins, drawing her weapon.");
	else outputText("\n\n\"<i>Just go easy on me, okay?  I'm still new at this...</i>\" she says, stepping back as she draws her weapon.");
	startCombat(new Helspawn());
}




//PC Somehow Loses Despite Being Like Level 20+
// The irony is that you can't even get her till like, Level 20 because dungeon. And she's lower level but then Hel's lower level than HER which makes shit for sense. Fuck logic, get bitches.
internal function loseSparringToDaughter():void {
	//if Sluttymander:
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) {
		outputText("As you stumble back, ");
		if(player.lust >= player.maxLust()) outputText("succumbing to your own lusts");
		else outputText("unable to withstand her unending hail of attacks");
		outputText(", " + flags[kFLAGS.HELSPAWN_NAME] + " quickly sweeps your [legs] out from under you, dropping you right on your ass.  You collapse with a grunt, ");
		if(player.weaponName != "fists") outputText("weapon tumbling out of hand");
		else outputText("unable to even clench your fists anymore");
		outputText(", and a moment later " + flags[kFLAGS.HELSPAWN_NAME] + "'s on you, straddling you with her powerful legs, pushing you down into the dirt.");
		
		outputText("\n\n\"<i>Now, what shall I do with you, hmm?</i>\" she teases, licking her lips as she surveys her conquest.  \"<i>Mother always said it's bad form to let someone go with just an asskicking...</i>\"");
		
		outputText("\n\nShe can barely finish the sentence before you both break out snickering.  She gives you a rough punch on the shoulder and rolls off, flopping onto her back beside you.  \"<i>That was fun, " + championRef() + ".  Thanks for spending a little time with me.  No hard feelings?</i>\"");
		outputText("\n\nYou chuckle and stumble to your [feet], pausing to ruffle her hair and collect your gear.");
		outputText("\n\nDamn but they grow up fast.");
	}
	//Else If Chastemander:
	else {
		outputText("As you stumble back, ");
		if(player.lust >= player.maxLust()) outputText("succumbing to your own lusts");
		else outputText("unable to withstand her unending hail of attacks");
		outputText(", " + flags[kFLAGS.HELSPAWN_NAME] + " grabs your arm, catching you before you can fall.  \"<i>Easy there, " + championRef() + ", I got you,</i>\" she says, pulling you into a quick hug.");
		
		outputText("\n\n\"<i>You didn't go easy on me, did you?</i>\" she asks as you regain your balance.  When you shake your head, she beams, smiling from ear to ear. Prancing out of reach, she breaks down into a happy little dance, gloating over her victory over the mighty Champion.  You shake your head and ruffle her hair, reminding her not to get too full of herself.");
		outputText("\n\n\"<i>I wouldn't dream of it, " + championRef() + "!</i>\" she grins, planting a quick kiss on your cheek before you head off to ");
		if(player.HP < 1) outputText("recover from that ass kicking");
		else outputText("dunk your head");
		outputText(".");
	}
	cleanupAfterCombat();
}

//PC kicks Helspawn's shit in, surprising nobody. 
internal function beatUpYourDaughter():void {
	clearOutput();
	//{If Sluttymander loses to lust (you monster)}:
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50 && monster.lust >= monster.maxLust()) {
		outputText("\"<i>N-no more...</i>\" the slutty little salamander moans, slumping down to the ground, arms wrapping around herself.  \"<i>Fuck, you're sexy... so horny...</i>\" she groans, hands slipping down to her soaked bikini bottom.");
		
		outputText("\n\nShaking your head, you give her a little push, flopping her onto her back.  She just lets out a little whimper and finally tears her panties away, giving her unrestricted access to her sodden box.  \"<i>Hey, d-don't just leave me like this,</i>\" she whines, but to no avail.");
		//If No Incest: 
		if(flags[kFLAGS.HELSPAWN_INCEST] == 0) outputText("  You wash your hands of the defeated slut and head back to camp, leaving her to work through her tension herself.");
		else {
			outputText("  You reach down and give your lovely, lusty daughter a pat on her expansive rear, telling her she'll always look her best with her ass in the air, begging for ");
			if(!player.hasCock()) outputText("sex");
			else outputText("your cock");
			outputText("... and that if she's lucky, you might tend to her when you've cooled off.");
		}
	}
	else {
		outputText(flags[kFLAGS.HELSPAWN_NAME] + " stumbles back, dropping her weapon and waving her arms, \"<i>I give, I give.</i>\"");
		outputText("\n\nWith an approving nod, you lower your [weapon], telling her she did a fine job.  Not many people can stand up to you for as long as she did, after all.  She grins a little, but winces when you try and get close");
		if(monster.HP <= monster.minHP()) outputText(", rubbing her many bruises");
		else outputText(", blushing brightly after your slutty display");
		outputText(".  You chuckle and ruffle her hair, \"<i>C'mon, kiddo, let's get some food in you.</i>\"");
		outputText("\n\n\"<i>Yeah, food,</i>\" she groans, stumbling after you as you both recover from the furious sparring match.");
	}
	cleanupAfterCombat();
}

//BONUS SCENES!
//(Scenes are repeatable; small chance to play one at any given [appropriate] time. All require Adult Minimander.)
//Mai Visits Her Kid
//{Requires Helspawn be Mai's daughter; play when returning to camp:}
public function maiVisitsHerKids():void {
	clearOutput();
	helScene.helSprite();
	outputText("As you head back into camp, you notice Hel and " + flags[kFLAGS.HELSPAWN_NAME] + " are sitting around the cook fire in the center of camp, with your foster daughter balanced precariously on the lap of her own father, Mai the fox-girl.");
	
	outputText("\n\n\"<i>Heyya, lover mine, look who stopped in!</i>\" Hel calls, waving you over until you slip down beside her, a warm, leathery tail quickly wrapping around your waist.");
	
	outputText("\n\n\"<i>Hi, [name],</i>\" Mai says with a demure smile, arms wrapped around " + flags[kFLAGS.HELSPAWN_NAME] + "'s belly, trying to hold the daughter that's near a foot taller than she is.  Finally, laughing, she lets the young salamander go.  " + flags[kFLAGS.HELSPAWN_NAME] + " drops down to sit beside her mother and father, and quickly has both a smooth and scaly hand stroking her hair.");
	//If Chastemander:
	if(flags[kFLAGS.HELSPAWN_PERSONALITY] < 50) outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " happily leans her head against Mai's leg, accepting the affection with her tail swishing gaily behind her, foxy ears twitching as Mai brushes them.");
	else outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " leans back, pulling out a flask and taking a deep swill before passing it to her father, who takes it with a knowing smile and knocks it back like a champ.");
	
	outputText("\n\n\"<i>So what do you think, Mai?</i>\" Hel says, nodding down to her daughter.");
	
	outputText("\n\n\"<i>Yeah, we did good, Hel,</i>\" she says, leaning over to give the salamander a quick kiss.  \"<i>She's a real beauty... and knowing you, she's going to be a hell of a fighter some day.  You should bring her around to Tel'Adre some time.  We could use guards like her.</i>\"");
	
	outputText("\n\n\"<i>A salamander guard? That'll be the day!</i>\" Hel laughs, \"<i>they barely let Pop and Kiri in.  No, you're gonna have to walk it if you wanna see your little girl.</i>\"");
	
	outputText("\n\nMai gives a mock sigh.  \"<i>Well, we could always have another.  One for you, one for me!</i>\" she says, a little more serious this time - and with a less than subtle hint of lust in her voice.");
	
	outputText("\n\n\"<i>Oh, no,</i>\" Hel laughs, giving her lover a playful push, \"<i>this one's enough of a handful, aren't you?</i>\"");
	
	outputText("\n\n\"<i>Heeeeeyyyyyy,</i>\" " + flags[kFLAGS.HELSPAWN_NAME] + " whines, crossing her arms with a huff.");
	
	outputText("\n\nHer parents laugh, and Mai drops down to a knee beside her, reaching into a pocket to produce a small box.  \"<i>I know it's not much, but since I can't get out here often enough...</i>\" Mai says, opening it to produce a gold necklace adorned with a small gem clasp.");
	
	outputText("\n\n" + flags[kFLAGS.HELSPAWN_NAME] + " lights up as Mai slips the gold chain around her daughter's neck.  \"<i>Something to remember me by when I'm not around,</i>\" she says with a wink, letting her kid skip off to find a mirror.");
	
	outputText("\n\n\"<i>And you, [name],</i>\" she says, turning to you, \"<i>Thanks for taking care of " + flags[kFLAGS.HELSPAWN_NAME] + ".  I-I mean, I know I was really making her for you and Hel anyway, but still... she's a good kid, and I love her anyway.  Keep her safe, alright?</i>\"");
	
	outputText("\n\nYou promise that you will, and with a quick nod, Mai runs after " + flags[kFLAGS.HELSPAWN_NAME] + " to say goodbye for the day.  As she leaves, Helia grins, holding you tight against her.  \"<i>She's a good girl, [name].  Couldn't have picked a better father for our girl.</i>\"");
	doNext(camp.returnToCampUseOneHour);
}

//Spider Bro's Gift
//{Requires Helspawn be fathered by a spiderbro. Play at morning.}
public function spiderBrosGift():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.SPIDER_BRO_GIFT] = 1;
	outputText("As you're getting ready to head out for the day, you notice " + flags[kFLAGS.HELSPAWN_NAME] + " prancing around camp with a long, brightly-colored scarf wrapped around her neck, standing painfully in contrast with her midnight-black scales and pale flesh.");
	
	outputText("\n\n\"<i>Whatcha got there, kiddo?</i>\" you ask, walking over to the clearly quite pleased salamander.");
	
	outputText("\n\nShe grins, hugging the scarf to herself.  \"<i>I don't know, I woke up and there it was, right next to me.  I think mom bought it for me");
	//if Isabella: 
	if(isabellaFollower()) outputText(", or aunt Isabella might have knitted me a new one, I don't know");
	outputText(".</i>\"");
	
	outputText("\n\nYou shrug, but as she turns away, you grab the corner of the scarf and feel it.  Spider silk, if ever you've felt it.  A grin spreads across your face as you realize who must have made this.");
	
	outputText("\n\nThen you realize someone just walked into your camp and could have slaughtered you all.  You should probably fix that.");
	doNext(camp.returnToCampUseOneHour);
}



//Hakon and Kiri Come to Visit
//{Play as the PC returns to camp in the evening / late afternoon}
public function hakonAndKiriComeVisit():void {
	clearOutput();
	helScene.helSprite();
	flags[kFLAGS.HAKON_AND_KIRI_VISIT] = 1;
	outputText("As you're returning to camp, you notice Helia running around like a chicken with her head cut off, fussing about damn near everything in her part of the camp");
	if(camp.companionsCount() > 1) outputText(" and everyone else's too, much to their chagrin");
	outputText(". As she's furtively polishing off her giant still, trying to get the dingy old thing to shine, you approach and clear your throat. She gives a sharp yelp and spins around, but seems to relax as she sees it's just you.");
	outputText("\n\n\"<i>H-hey, [name],</i>\" she says nervously.  \"<i>Just in time.  I was about to go looking for you.  Uh, so...</i>\"");
	
	outputText("\n\n\"<i>What's going on?</i>\"");
	
	outputText("\n\n\"<i>Pop and Kiri are coming over, and this place is a wreck!  Like a fuckin' tornado just blew right through.</i>\"");
	
	outputText("\n\n\"<i>That's how it always looks, though,</i>\" you say with a shrug, indicating the field of debris surrounding Hel's hammock, most of which has just been pushed under her cloak.");
	
	outputText("\n\n\"<i>Well yeah, </i>I<i> like living in a dump, but it's my dad and sister, and I don't want them to think I live like a rutting animal, you know?</i>\"");
	
	outputText("\n\nYou consider protesting the point, but soon have a wash rag shoved into your hands before Hel dashes off to fix some other minor flaw in camp.  You sigh, but it never hurts to tidy up a bit anyway.  What you're supposed to do to an open camp with a cloth, though, you have no idea.  Mop the dirt?");
	
	outputText("\n\nIt hardly matters, as a few minutes later, you hear a cry of unabashed glee from the edge of camp, and turn to see " + flags[kFLAGS.HELSPAWN_NAME] + " running up to meet a pair of oncoming figures.  You wave as Hel's father swoops his granddaughter up into a great bear hug, hefting the half-breed 'mander off her feet in his powerful arms.  " + flags[kFLAGS.HELSPAWN_NAME] + " squeals with delight as she's practically carried into camp, until Hakon sets her down and hugs her mother, pulling Hel into a tight hug before she can finish saying hello.");
	
	outputText("\n\n\"<i>Hi, [name],</i>\" Kiri says, fluttering over to plant a peck on your cheek.  \"<i>Long time no see.</i>\"");
	
	outputText("\n\n\"<i>Too right.  Put 'er there, " + player.mf("son","girl") + ",</i>\" Hakon says, extending a hand to you, grinning wide as he lets his daughter and granddaughter go.  You shake the old salamander's hand, nearly wincing as his powerful grip throttles your wrist vigorously, practically walking you back into the heart of the camp.");
	
	outputText("\n\nTurning to " + flags[kFLAGS.HELSPAWN_NAME] + ", Hakon smiles with pride.  \"<i>Gods and demons, girl, you've grown!  What have you two been feeding her, huh?</i>\"");
	
	outputText("\n\n\"<i>And you should see how strong she is!</i>\" Hel grins.  \"<i>Go on, " + flags[kFLAGS.HELSPAWN_NAME] + ", show the old scales what you've got.</i>\"");
	
	outputText("\n\n\"<i>Old scales!?  I'll show you old, you little brat.  Come on, hit me!</i>\" Hakon says, just before " + flags[kFLAGS.HELSPAWN_NAME] + " punches him right in the chest, knocking him right on his ass.  He tumbles back with a grunt, shaking his head with a wry laugh.  \"<i>Ha!  Maybe these scales are getting old after all.  This one's gonna be a hell of a fighter, though.  Should take her hunting with us one of these days.  What do you say, kid?</i>\"");
	
	outputText("\n\n\"<i>Sure!  ");
	if(flags[kFLAGS.HELSPAWN_WEAPON] == "scimitar and shield") outputText(championRef() + "'s been teaching me how to fight.");
	else outputText("Mom's been teaching me how to fight.");
	outputText("  I'm not as good as mom and " + championRef() + " yet, but I'd love to come along.</i>\"");
	
	outputText("\n\n\"<i>That's the spirit.  Now we just have to convince your aunt Kiri to come along.  And ");
	if(flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("your old man");
	else outputText("[name]");
	outputText(", too.</i>\"");
	
	outputText("\n\n\"<i>I-I don't like fighting.  Especially 'hunting.'  Those poor gnolls,</i>\" Kiri says, avoiding her father's gaze.");
	
	outputText("\n\n\"<i>Aww, you're no fun,</i>\" Hel teases, giving the half-harpy a light punch on the shoulder before turning to you.  \"<i>What do you say, lover mine?  Wanna go hunting with your three favorite salamanders some time?</i>\"");
	menu();
	addButton(0,"Sure",goHuntingBitches);
	addButton(1,"Maybe Not",noHuntingBitches);
}

//Sure!
//Eventually needed to get into Helia Expansion 5: The Valley of Fire
//lol like I'll ever actually get there
private function goHuntingBitches():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>Sure,</i>\" you say, quickly earning approving nods from Hakon and Helia.");
	outputText("\n\n\"<i>No mercy for gnolls!  Right, sweetheart?</i>\" Hel shouts, grabbing a mug of ale and lifting it in the air.");
	
	outputText("\n\n\"<i>R-right!</i>\"");
	
	outputText("\n\nWith that settled, you sit down as Hel passes out something that must be akin to dinner for her family - mostly booze and rations - and soon you're enjoying a meal with the rowdy family, laughing at Hel's ribald jokes or Hakon's old war stories.  Eventually, Hakon and Kiri leave, but not before promising to come and get you and the family for their next gnoll hunt.");
	doNext(camp.returnToCampUseOneHour);
}
//Maybe not
private function noHuntingBitches():void {
	clearOutput();
	helScene.helSprite();
	outputText("\"<i>I'll pass,</i>\" you say with a laugh, earning a shrug from the salamanders.");
	outputText("\n\n\"<i>Well, maybe you'll change your mind next time.  Plenty of evil furbags to go around!</i>\" Hel says with a laugh.  \"<i>C'mon, let's find something for the folks to eat, huh?</i>\"");
	
	outputText("\n\nWith that settled, you sit down as Hel passes out something that must be akin to dinner for her family - mostly booze and ration - and soon you're enjoying a meal with the rowdy family, laughing at Hel's ribald jokes or Hakon's old war stories.  Eventually, Hakon and Kiri leave, waving goodbye until the next time they can visit.");
	doNext(camp.returnToCampUseOneHour);
}

	//Sex. Now you can finally fuck your daughteru! Savin can go suck a fat cock and cry little bitch tears.

	private function sexHelspawn():void {
		clearOutput();
		//INTRO TEXT
		outputText("You decide that it's high time you and [helspawn] share a little quality time together. As if sensing your intention she gives you an inviting smile, one you feel mirrored in your own[face].[pg]");

		if (player.tallness < 72) {
			outputText("You reach up and take [helspawn]'s cheek in your hand. The gentle caress of your fingers causes her to shiver with longing. The young woman stands before you with her ");
			if (flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("golden");
			else if (flags[kFLAGS.HELSPAWN_DADDY] == 2) outputText("bright green");
			else outputText("crimson");
			outputText(" eyes lit up like stars. She stares into your own eyes with all the adoration in the world as she leans in to kiss your lips. ");
		}
		else if (player.tallness >= 72 && player.tallness < 96) {
			outputText("You stand eye to eye with [helspawn] as you frame her face in your hands. She reaches up to tug a stray lock of hair from her face moments before you press your lips against hers. You hold her close as you kiss, and she releases a soft moan as she melts into your arms. ");
		}
		else if (player.tallness >= 96) {
			outputText("You reach down and wrap little [helspawn] up in your arms. She softly moans against your [chest] as the two of you hold each other tightly. She then looks up into your [face] with eyes bright as stars as she stands on her toes to kiss your lips. ");
		}
		outputText("Once the kiss is over you ask her if she wants to spend a little quality time with you.[pg]");
		outputText("[helspawn] smiles as she answers with a simple, [say: I'd like that, [Daddy].][pg]");
		outputText("The young lady watches you disrobe. You strip as sensually as your [armor] will allow, showing off your form and moving to music only you can hear. You even throw in a few sexy dance moves you saw others do in Ingnam. Your exotic display has [helspawn] all a twitter as she shivers with longing. When you're finally in the buff [helspawn]'s eyes drink in your naked form with open hunger. You proudly display your " + player.cockDescript() + " and [ass] for her viewing pleasure. Then you thrust your [chest] forward and flex your biceps for her. She claps in appreciation of your show, squirming as her arousal takes hold.[pg]");
		outputText("Now that it is her turn to strip she stands, tall and proud, and begins to shed her own clothes.[pg]");

		if (flags[kFLAGS.HELSPAWN_PERSONALITY] >= 50) {
			outputText("[helspawn] reaches behind her, chest thrust forward while she unsnaps the clasp of her scale bikini top. As she allows said top to fall she reveals her twin knockers with a seductive little shimmy. You can't help reaching forward and pulling her by the waist, taking a single nipple into your mouth. You suck and nibble on her tit for a moment before she turns away with a giggle. She bends forward seductively and slowly lifts her tail. She begins to slowly slide her scaled bikini bottom off of her very enticing ass. The squishy glorious globes of her ass distort slightly as the garment moves across her skin, soft flesh reforming as the garment slides off. The tight bud of her tailhole is uncovered moments before her glistening sex is revealed. All inches away from your face. The scent of your little girl's arousal wafts around you, a scent so sweet it makes your mouth water.[pg]");
			outputText("[say: Fuck yes, [Daddy],] she groans as you take a moment to rub and tease her holes, both in need of a good long fuck.");
		}
		else {
			outputText("[helspawn] takes a moment to unbutton her sky blue blouse before sensually pulling it off, a coy smile playing on her lips. The blouse falls to reveal a single fancy white lace bra. She reaches backward and with a simple motion undoes the clasp. She holds the bra, slowly sliding it down to reveal the gentle curve of her bosom. You reach forward, taking her by the waist and tasting her pert nipples, tugging and sucking them with wet lips until she turns away, blushing. She takes a moment to undo her skirt. The clothing falls to reveal the soft mounds of tender flesh upon which she sits every day. She works her hips as she pulls down the soft white lace panties, revealing her rear entrance and tender glistening womanhood for your viewing pleasure. The scent of your little girl's arousal wafts around you, a scent so sweet it makes your mouth water.[pg]");
			outputText("[say: Yes, [Daddy],] she gasps as you take a moment to massage her naked bottom, cupping the squishy flesh and spreading it to see her two waiting entrances.");
		}
		outputText("You lean in with every intention of tasting her but she steps away, apparently ignorant of your desire to taste her. It seems great minds think alike, however; she turns to face you and kneels before you as if you were some royal king and she your humble servant.[pg]");

		doNext(sexOralHelspawn);
	}

	private function sexOralHelspawn():void {
		clearOutput();
		//ORAL SEX TEXT
		var x:int = player.biggestCockIndex(), y:int, z:int;

		if (player.hasVagina()) {
			outputText("Helspawn begins by pushing your thighs up and out of her way. She takes one look at your [vagina] and licks her lips before leaning and giving you a gentle teasing lick right next to your moistening lady bits. She teases you for what seems like forever, licking your [skinfurscales] and making you shiver and groan.[pg]");
			outputText("Once you're begging for it she gives your glistening lips a single smooth lick. As her tongue glides across your feminine opening your body begins to heat up. She slurps across your [clit] and rubs her face in your folds, with a beautiful smile.[pg]");
		}

		if (player.balls > 0) {
			outputText("[helspawn] reaches forward and moves [eachCock] out of her way. With her free hand she cups your ");
			if (player.balls == 1) outputText("ball, pulling it up as she plants a wet kiss on your orb. She buries her face in your sac, basking in the scent of your masculine genitalia. Soft wet lips gently tug at your ball, swirling your cum factory around in her mouth and making you grind your sac into her lips.");
			else outputText("balls, pulling them up as she plants a wet kiss on each orb. She buries her face in your sac, basking in the scent of your masculine genitalia. Soft wet lips gently tug at your balls, swirling your cum factories around in her mouth and making you grind your sac into her lips.[pg]");
			outputText("[say: Oh... so much bottled up cum,] [helspawn] says with a soft moan, [say: Is all of this just for me, [Daddy]?] You answer her with a nod as your [face] spreads into a gracious smile. Satisfied with your answer she smiles broadly before leaning in and massaging your ");
			if (player.balls == 1) outputText("ball");
			else outputText("balls");
			outputText(" with that hot, talented tongue of hers. [eachCock] jumps as she gently pulls a single sensitive orb into her hot wet mouth. She orally caresses each one in turn, not leaving your cream filled balls alone until your body is cringing against her lips. Then she gazes up at you, her ");
			if (flags[kFLAGS.HELSPAWN_DADDY] == 0) outputText("golden");
			else if (flags[kFLAGS.HELSPAWN_DADDY] == 2) outputText("bright green");
			else outputText("crimson");
			outputText("eyes locking onto you with a smile as her mouth sits poised above [eachCock].[pg]");
		}

		if (player.cockTotal() == 1) {
			outputText("With her lips spread wide [helspawn] drags her tongue across the belly of your " + player.cockDescript() + " with exaggerated slowness. Then her tongue lashes at your " + player.cockDescript() + " one moment before soft hands pull your dick down so that she may tickle the cum slit with that wonderful tongue of hers. She rubs your " + player.cockDescript() + " across her face, happily smearing your leaking precum across her features. Her ecstasy filled eyes drink in your naked form as she works. She is hungry to please you, to make you feel so good you explode in her mouth.[pg]");
			outputText("[say: Good girl.] You sigh, grabbing your " + player.cockDescript() + " to rub it against her outstretched tongue. The wet surface combined with the increased heat of her fiery aura causes your " + player.cockDescript() + " to jump against her puckered lips as she suck at your " + player.cockDescript() + ". Her fiery breath bathes your nethers as she begins to kiss your shaft, each smooch ending in a loud sucking noise. When she reaches your [cockHead] she takes a moment to suck at the cumslit, drinking your pre-cum as if it's the tastiest meal in the cosmos.[pg]");
		}
		else if (player.cockTotal() == 2) {
			y = player.biggestCockIndex2();
			outputText("[helspawn] takes hold of [eachCock] with a grin. She listens intently as you groan while she presses your two dicks together. She massages your twin shafts and you have to admit it feels heavenly, the way [eachCock] rubs together while wrapped in both of her soft warm palms. As you react to the sensations she drags her tongue up the crevice formed by " + player.cockDescript() + " and " + player.cockDescript(y) + " she makes sure to keep them steady even though your body is not. When her soft, hot, perfect thumb smears precum across the head of your " + player.cockDescript() + " while tasting your " + player.cockDescript(y) + " with her tongue you almost lose it.[pg]");
			outputText("Instead you groan. [say: Good girl.] while thrusting [eachCock] against her mouth. Her grip tightens and together with her lips she begins to go up and down your shaft, forming a three walled orifice that is both alien and perfect. You begin to tremble again as her lips slather heated spit across the belly of your two cocks while her hands press them together, the three sensations causing your body to thrust as if fucking soft triangle of flesh. After giving you free rein to do as you will she pulls back, licking your tasty precum from her lips.[pg]");
		}
		else if (player.cockTotal() >= 3) {
			y = player.biggestCockIndex2();
			z = player.biggestCockIndex3();
			outputText("[helspawn] reaches forward and pulls your " + player.cockDescript() + " into her lips, suckling the [cockHead]. Then her hands wraps around your " + player.cockDescript(y) + " and your " + player.cockDescript(z) + ". The sight of her pleasing 3 of [eachCock] combined with the sensation of soft hands, tight grips and a wet tongue has you bucking against her. She hums against your " + player.cockDescript() + " for a second before she wraps her arms around the base of [eachCock], pulls them together and rubs her soft face in them all. You revel in her dripping tongue, her heated gasps and her vibrating lips as she hums and kisses you a cock at a time. You call out, your voice breaking as you are hit with waves of euphoric delight that cause you to almost lose control. She eases up, allowing you to come back from the brink as she looks up at you with bright eyes.[pg]");
		}
		outputText("[say: Oh [Daddy],] she says with a smile as she takes your " + player.cockDescript() + " into her hand, [say: I love you so much.] You say it back, meaning every word. Before you can expand on how much you love [helspawn] she opens up and sucks you in so quickly you'd swear her mother was a cock milking machine if you didn't already know better.[pg]");

		if (player.cockArea(x) <= 27) outputText("You begin to howl as she slides your entire " + player.cockDescript() + " into her mouth without hesitation. She bobs for a moment, your " + player.cockDescript() + " shining with her saliva as she engulfs you again and again. Then she slides your " + player.cockDescript() + " to the front of her divine lips and begins swirling her tongue around your sensitive " + player.cockHead() + " before diving back down. She repeats this torturous practice, enveloping your " + player.cockDescript() + " in her hot wet orifice again and again.[pg]");
		else if (player.cockArea(x) < 36 && player.cockArea(x) > 27) outputText("Your [hips] buck as [helspawn] takes you into her mouth. When your " + player.cockHead(x) + " reaches the back of her throat she swallows, pulling you into her mouth with a wet slurp and a gulp. It takes every ounce of willpower you have not to fuck her face as she slobbers up and down your length. Slurp, gulp, slurp, gulp and with every swallow your body cringes into her talented throat as it wraps you up and pulls you in dick first. She even buries her face in your groin, inhaling your scent as she swallows your " + player.cockDescript(x) + " whole.[pg]");
		else if (player.cockArea(x) >= 36) outputText("However, she barely gets past your " + player.cockHead() + " before she starts having trouble. Watching her try to stuff your entire length into her mouth turns you on something fierce. You take a hold of her fiery red hair and gently tug her off, a silent command for her to slow down and take her time. After you slow her lips to a speed she's comfortable with she continues to work you over, unperturbed. Your big " + player.cockDescript() + " can't fully fit inside her mouth but it doesn't matter, she still has you trembling with need as you appreciate the amount of skill involved in her oral machinations.[pg]");

		if (player.cocks[x].cockType == CockTypesEnum.DOG) outputText("She pulls your " + player.cockDescript() + " up and gives your knot a tender kiss. The kiss quickly evolves into loud sucking that has you trembling. She plays with your knot, lashing its sensitive surface with her hot tongue and nibbling at it with wet lips. The combination of her hot breath, her warm hands and her wet tongue has you on edge.[pg]");
		else if (player.cocks[x].cockType == CockTypesEnum.CAT) outputText("She giggles as she twirls the nubs of your cat dick in her hand. Then she drags her gloriously hot tongue against the surface before reversing and swirling her tongue around each barb. She gently pinches the tip, squeezing pre out of your slit and licking the copious liquid from your drooling and spit shined " + player.cockDescript() + ". The combination of her hot breath, her warm hands and her wet tongue has you on edge.[pg]");
		else if (player.cocks[x].cockType == CockTypesEnum.HORSE) outputText("She slides a hand across the segments of your " + player.cockDescript() + ". Each time she does the odd sensation forces your hips to buck. Then she begins nibbling at them, drooling across the surface of your " + player.cockDescript() + " before loudly sucking it back up. She kisses your cum slit and hums as she sucks more pre into her hungry lips. The combination of her hot breath, her warm hands and her wet tongue has you on edge.[pg]");
		else if (player.cocks[x].cockType == CockTypesEnum.TENTACLE) outputText("[helspawn] groans as she works your living pecker over. She traps it like prey and lashes her tongue across its writhing belly. It rewards her with juice which she laps up and sucks from the " + player.cockHead() + ". She growls with it poking around inside her lips, vibrating her mouth as her tongue wrestles with your excited " + player.cockDescript() + ". The combination of her hot breath, her warm hands and her wet tongue has you on edge.[pg]");
		else outputText("She takes a moment to explore your " + player.cockDescript() + " further. Her convulsion inducing lips drool on your " + player.cockDescript() + " before loudly sucking it up. She shines your knob with kisses so sweet each gentle smooch is accompanied a deep sound that vibrates your [chest]. Her smooth lips begin to glide across your cock's surface, leaving no stone unturned and no nook unexplored. Then her wet tongue lashes the belly of your quivering " + player.cockDescript() + " over and over again. The combination of her hot breath, warm hands and wet tongue has you on edge.[pg]");
		outputText("She keeps you near climax for a while, easing off to give you a brief respite before surging forward and pushing you back toward the brink. She plays your " + player.cockDescript() + " like a musician with her favorite instrument. Every strum of your quivering rod releases a tender note of ecstasy, every breath ends in music. She's a skilled virtuoso whose every movement produces art in the form of your strained voice.[pg]");
		outputText("It quickly becomes apparent that [helspawn] doesn't mind staying here, like this, with you. You're tempted to let her, the way she's sliding up and down your " + player.cockDescript() + " is flooding your entire being with sexual euphoria. You have to gather all of your remaining mental strength to tug her off so you won't unintentionally flood her mouth.[pg]");
		outputText("She remains kneeling after your trembling hands have pulled her away from [eachCock]. She patiently watches as you take deep slow breaths to calm yourself down. Once you've mastered your quaking libido you lower yourself to [helspawn]'s height and give her a deep kiss. As you snake your tongue into her mouth you push her onto her back.[pg]");
		outputText("[say: Yes [Daddy],] she groans as you nuzzle her neck, sucking the tender flesh and making her grind against your body. You paint a trail of wet kisses down to her pert tits. You stay there a moment, sucking her erect nipples into your mouth whilst your hands massage her waist. She cringes as you tickle and tease her, giggling like a schoolgirl as she begs for your " + player.cockDescript() + ".[pg]");
		outputText("But you have other things in mind. Besides, you know after that blow job you're going to need a few more minutes to settle down. Wanting to enjoy your quality time for as long as possible, you begin to trail a second trail of sweet kisses down her inner thigh. She tenses once she figures out what it is you're planning on doing.[pg]");
		outputText("[helspawn] shudders the moment your drag your tongue across her inner thigh. You kiss the spot and she groans in frustration. You tease her with quiet breaths that shudder and tickle her glistening womanhood. You spread your tongue and slide it across her inner thigh, reveling in the shivering flesh as it tickles your tongue. You constantly come dangerously close to her feminine fruit only to float away, tracing complicated designs onto her inner thigh and soft tummy with your tongue.[pg]");
		outputText("You keep this up until her glistening pussy is practically flooding itself in anticipation of the moment you finally give it a good licking.[pg]");
		outputText("[say: [Daddy], please,] she whines with a sexy edge to her voice when she can take no more.[pg]");
		outputText("So you press her legs back to further spread her glistening lips. Her clitoris is a hard pearl reaching for your lips so you give it a lick. [helspawn]'s entire body jerks at the brief contact. You lay flat against the ground as you wrap your lips around that hard pearl and suck it. [helspawn]'s body convulses and shivers and you hang on, rolling your neck and enjoying the ride on her thighs.[pg]");
		outputText("You press your lips into her wet sex and massage her nether lips with yours. You growl against it, vibrating her flooding pussy. You pay attention to every gasp, groan and thrilling scream [helspawn] releases as you work her over. Then her legs suddenly clasp around your neck, trapping you in this position as she reaches down and smashes your head into her pussy, obviously lost in ecstasy.[pg]");
		outputText("If that's how she wants to play... you're game.[pg]");
		outputText("You redouble your efforts, sucking a hot beverage of lady cum from her tingling gash with the ferocity of a man dying of thirst. You nibble at her clit, you french kiss her nether lips and suddenly she's gushing a fountain of pale fluid that tastes every bit as sweet as candy.[pg]");
		outputText("Above you [helspawn] is screaming like a woman possessed, her body gyrating as if she is mid seizure. She holds you against her squirting pussy with a grip like iron. Your [face] is pressed against her hot sex and being showered by her sweet ejaculant. Once the sugary fountain has subsided she releases you and you rise. Her face is suffused with a soft glow of pure elation as she thanks you over and over again with a lazy smile.[pg]");
		outputText("You grin down at her, saying, [say: But [helspawn]... I'm not done yet.][pg]");
		outputText("With that you take a hold of her legs and spin her around. She rolls over and, at your command, rises to her knees. You shove your [face] into the squishy mounds of her soft round asscheeks.[pg]");
		outputText("[say: That feels so... weird,] [helspawn] says with a giggle, even as she presses her hungry ass against your thrusting tongue. You make a point to loudly slurp and suck her exposed back door, reveling in the pristine condition of the tight opening. With your hands you spread her voluptuous cheeks apart to get a better angle. That's all it takes for a tortured thrilling scream to fill the air. [helspawn] grunts and groans, trembling as you make her ass feel \"weird\". Your hand lands with a smack on her ass and you watch the mound of flesh jiggle with carnal delight. You're raring to go, [eachCock] rock hard and dangling between your legs as you prepare her tight back door for entry. She begins to shudder against your lips as your oral attention drives her up the wall.[pg]");
		outputText("You begin to alternate, greedily dragging your tongue between her still wet pussy across her swollen taint to kiss her hungry asshole. When you finally rise from her dripping pussy and puckered asshole she looks back at you as if seeing you through a haze of sexual desire.");

		doNext(sexDoggyHelspawn);
	}

	public function sexDoggyHelspawn():void {
		clearOutput();
		var playerCameBeforeRiding:Boolean = false;
		//DOGGY STYLE TEXT
		outputText("On your knees you place [eachCock] between the soft pliable mounds of [helspawn]'s cheeks. You slowly thrust, reveling in the heated sensation caused by slowly moving against her soft cheeks. She groans beneath you and arches her back in obvious invitation. You reach forward and feel her dripping sex, collecting her juices which you allow to drip across [eachCock].[pg]");

		if (player.cockTotal() == 1) {
			outputText("After your " + player.cockDescript() + " is glistening with [helspawn]'s sweet ambrosia you aim its leaking head at her drenched vaginal lips, entering her with a groan.[pg]");

			if (player.longestCockLength() <= 8) {
				outputText("[helspawn] swoons as you slide into her sensitive feminine entrance, pushing into her wet pussy with ease. She grins back at you as she curls her scaly tail around your waist, a gesture you're sure is a positive one. Her entrance is soaked, slick lady cum from her previous orgasm making sliding through her pulsing tunnel all the more pleasurable. Each stroke sends a tingle through your body as she clenches, squeezing your cock internally as she presses against your slow full length thrusts.[pg]");
				outputText("[say: Oh, [Daddy]!] she says, looking over her shoulder with a grin, [say: Fuck me good.][pg]");
				outputText("Not being one to disappoint your little girl you lean forward and press your lips against hers. As her tongue snakes into your mouth you speed up. Soon your thrusts are filling the air with the slapping noise of rapid fucking. She breaks the kiss once the sensations become too much and begins throwing her pussy back against your hard thrusts. Beneath you [helspawn] whoops and hollers like she's on a rollercoaster. Soon her joyful sounds gain a familiar edge to them and you know she's close. You redouble your efforts, fucking her hard until she screams and her pussy is gushing around your still thrusting " + player.cockDescript() + ".[pg]");
			}
			else if (player.longestCockLength() > 8 && player.longestCockLength() <= 12) {
				outputText("[helspawn] groans as you press into her sensitive feminine entrance, your " + player.cockHead() + " spreading her nether lips apart as it tunnels deep into her vaginal sleeve. Her pussy is soaked as you submerge your dick in the tight embrace of her quivering sex. You sit there for a moment, allowing [helspawn] to appreciate the full length of your " + player.cockDescript() + ". Her tail wraps itself around your waist just as you begin to slide in and out of her drenched pussy. [helspawn]'s voices slowly rises as she quickly loses herself in the sensation of your slow, full length thrusts.[pg]");
				outputText("[say: Yes [Daddy],] she voices with a fluttering note of ecstasy, [say: Oh... fuck me good.][pg]");
				outputText("Not being one to disappoint your little girl you lean forward and press your lips against hers. As you snake your tongue into her mouth you speed up. Each thrusts starts with a hard smack that reverberates through her body at lightning speed until it comes out of her mouth in a soul aching groan that vibrates your tongue. She groans and gasps against your lips, struggling to maintain the oral connection as you fuck her brains out. Soon her lips part from yours as she releases a thrilling note. You can tell from the quivering of her womanhood that she's close. Her voice comes out in fluttering groans and deep gasps. You redouble your efforts, fucking her harder until she screams as her pussy gushes around your still thrusting " + player.cockDescript() + ".[pg]");
			}
			else if (player.longestCockLength() > 12 && player.longestCockLength() <= 18) {
				outputText("[helspawn] grunts you press into her sensitive feminine entrance. You have to work your " + player.cockHead() + " into her with a gentle rocking motion. It's slow work but very rewarding as her pussy quivers around your " + player.cockDescript() + " while it massages her insides until they allow it to advance. Once you've buried the entirety of your " + player.cockDescript() + " into her vaginal walls [helspawn] begins to sing a soft song of shaking moans and shuddering gasps. Her tail wraps around your waist, something you're sure is to help her control the pace of your thrusts. So you begin to move and her voice begins to ring out, rising and falling in time with your slow, full length thrusts.[pg]");
				outputText("[say: Oh... [Daddy]... I... FUCK ME!] she screams into the air.[pg]");
				outputText("Not being one to disappoint your little girl you lean in and press your lips against hers. She accepts your tender kiss with a slavish hunger but the moment you begin thrusting harder she drops the kiss, unable to maintain the tender gesture as you fuck her into rapid convulsions. She screams as each hard thrust reaches deep into her feminine sleeve and forces her open. You can tell from the edge in her screams that she's close. Sure enough soon her shrill voice speaks as her pussy gushes around your still thrusting " + player.cockDescript() + ".[pg]");
			}
			else if (player.longestCockLength() > 18) {
				outputText("[helspawn] tenses as your " + player.cockDescript() + " tunnels into her sensitive vaginal sleeve. It is clear from the way her pussy stretches around your " + player.cockHead() + " that you're pushing her to the limit. Being as patient as possible you begin the slow work of massaging your " + player.cockDescript() + " into the quivering folds of her tight vagina. The way her vaginal walls squeeze your dick more than makes up for the amount of time it takes to open her up. Once you've managed to bury an acceptable amount of your " + player.cockDescript() + " into her pussy you hold, allowing her to get accustomed to the sensation of being filled to the max.[pg]");
				outputText("As you wait for her to adjust to your size her tail hesitates around your waist, possibly to help her control your speed when you start thrusting. You tell her to take slow, deep breaths and once you feel as if she can continue you begin to slide your " + player.cockDescript() + " in and out of her pussy with slow, full length thrusts that make her entire body convulse in pleasure.[pg]");
				outputText("[say: Ahh... fuh... FUCK me, [Daddy]!] she practically screams.[pg]");
				outputText("Not being one to disappoint your little girl you lean forward and press your lips against hers. She kisses you passionately, your lips moving together as you slowly increase speed. Once you're at a decent pace she pulls away from the kiss, her body twitching with every downward stroke. Your trunk never reaches her thighs because, despite her slick pussy drenching itself, you're just too big. You soon fuck her into rapid convulsions, her voice a constant reminder of how good you're making her feel. You can tell she's close when her body begins to tremble uncontrollably. Sure enough moments later her pussy clenches and quivers, gushing around your still thrusting " + player.cockDescript() + ".[pg]");
			}
			outputText("Once her orgasm has subsided she reaches back and pulls your [face] into hers, kissing you passionately.[pg]");

			if (flags[kFLAGS.HELSPAWN_HADSEX] == 0) {
				//first time only
				outputText("At this point your curiosity peaks as she rubs her ass against you, her soaked vagina squeezing around your embedded " + player.cockDescript() + ". Wouldn't it be nice to slip into her other hole, to feel its tight embrace wrapped around your cock as your little [helspawn] squeezes and groans? If she's anything like her mother she'll definitely enjoy it. When you make your proposition you feel the tip of her tail slide down your backside and dip into the crevice of your [ass].[pg]");
				outputText("[say: Okay [Daddy],] she says, still breathless from your recent exertions, [say: You can play with mine, but I want to play with yours,] she says with a grin as she presses the tip of her tail against your [asshole]. You can't help but verbally note the obvious differences between your " + player.cockDescript() + " and her tail. To which she replies, [say: You can set the pace... I'll just follow your lead. I'll go as deep as you go and as fast as you go.]");
			}
			else {
				//repeatable
				outputText("At this point a thought occurs to you. The first time you and [helspawn] shared a little quality time it was at this point that the two of you made your propositions. [helspawn] must be having similar thoughts because before you can react or make any offer you feel her tail slip into the crevice of your [ass], just like last time.[pg]");
				outputText("[say: You know what I want, [Daddy],] she says with a sly grin.");
			}
			outputText("[pg]<i>(You can let [helspawn] peg you with her tail while you fuck her in the ass, or abandon the idea of anal sex and let her ride you instead.)</i>");
		}
		else if (player.cockTotal() > 1) {
			outputText("You take a moment to rub her dripping lady juice onto [eachCock], specifically focusing on your " + player.cockDescript() + " and " + player.cockDescript() + ", getting them nice and lubed up for what you have planned. Sure the blowjob was probably enough but a good parent spares no expense for their little girl. From the looks of things her tight rear has seen more action than her wet vagina, probably due to self tail pegging during masturbation. You simply shake your head at how much like her mother she is as you finish lubing up your cocks.[pg]");
			outputText("With your " + player.cockDescript() + " in hand you press your " + player.cockHead() + " up against [helspawn]'s rear entrance. She swoons as you rub your slick cock against her pristine back entryway, your chest swelling with pride at how good her hygiene is. Then you tighten your grip and enter her, slowly.[pg]");

			if (player.longestCockLength() <= 10) outputText("[helspawn]'s face curls into a big sexy grin as you push into her rear passage. Sliding your " + player.cockDescript() + " into her welcoming tailhole is like pushing into a tight glove that quivers and massages you just right. The heat is sweltering which only serves to further swell your " + player.cockDescript() + ", making you harder and more eager to fuck her in every way she loves. You give a few experimental strokes, making sure she's used to having your " + player.cockDescript() + " inside her eager tail hole.[pg]");
			else if (player.longestCockLength() > 10 && player.longestCockLength() <= 18) outputText("[helspawn] gasps as your " + player.cockDescript() + " begins to tunnel into her rear passage. It takes a little patience and a little work but thanks to your persistence and the mixture of spit and ladycum you glazed all over your rigid pole you make good time. Rocking your hips you push deeper and deeper until your trunk softly mashes against her upturned squishy cheeks. She groans as you hold yourself inside the tight sweltering embrace of her perfect anal sleeve. Her passage quivers around you, massaging your deeply embedded " + player.cockDescript() + " perfectly as she adjusts to your size.[pg]");
			else if (player.longestCockLength() > 18) outputText("[helspawn] grunts as your " + player.cockHead() + " invades her unaccomodating tailhole. You hear the air leave her mouth in one long sigh, letting you know she's filled to bursting. You hold yourself steady with just your " + player.cockHead() + " buried inside her quivering anal sleeve, waiting for her to adjust. Once she's gotten used to the sensation you begin to rock your hips back and forth, gently working your cock deeper into the tight sweltering tunnel that is [helspawn]'s gorgeous ass. Once you've managed to dip as much of your " + player.cockDescript() + " inside of her as you can she gasps. You simply hold yourself inside her dangerously tight hole, patiently waiting for her insides to adjust. When they do you give her a few experimental strokes, reveling in the heat of her blatant arousal as she makes furious sounds of growling pleasure with your every movement.[pg]");
			outputText("You're tempted to just fuck her like this but instead you reach around and grab your " + player.cockDescript() + ", especially since you have better plans.[pg]");
			outputText("With your slickened " + player.cockDescript() + " in hand you take a second to enjoy the view. Your " + player.cockDescript() + " is deep inside [helspawn]'s spread cheeks, the meaty cushions parting beautifully. She looks back at you, catching your eye and licking her lips as if she knows exactly what you have planned. With her tail hole stuffed full of your " + player.cockDescript() + " you pull your " + player.cockDescript() + " up and line it up with her dripping vaginal opening.[pg]");

			if (player.longestCockLength() <= 8) outputText("You push forward, penetrating [helspawn]'s vaginal opening as your " + player.cockDescript() + " pushes deeper into her anal canal. She squeezes both of your embedded cocks with her internal muscles and looks back at you, eyes bright with desire. She wants you so bad her lip quivers as you effortlessly sink into her wet pussy.");
			else if (player.longestCockLength() > 8 && player.longestCockLength() <= 12) outputText("You push forward, penetrating [helspawn]'s vaginal walls as you push deeper into her anal canal. She gasps, looking back at you with [helspawneyes] eyes glazed over with lust as you sink into her dripping pussy.[pg]");
			else if (player.longestCockLength() > 12) outputText("You push forward, stretching [helspawn]'s vaginal walls apart with your " + player.cockDescript() + ". She trembles as your " + player.cockDescript() + " tunnels into her. She wiggles her bottom, the size of your cock combining with the dual sensation to make her twitch. You simply hold yourself inside of her until you feel she's able to take the pounding you're about to give her.[pg]");
			outputText("With your cocks deeply embedded in both of [helspawn]'s holes you begin to slide in and out. It is a veritable heaven. Your " + player.cockDescript() + " is inside a tight canal suffused with heat that massages it as it moves in and out of its welcoming embrace. Meanwhile your " + player.cockDescript() + " is embraced by her dripping wet cleft.[pg]");
			outputText("You start out slow, reveling in the mind blowing sensations of dual penetration as you slide in and out of [helspawn] with a huge grin. Her body quivers against you, combining with her sexy voice to tell you this is exactly what she wants. Taking her by the hips you pull, slowly stuffing her full of your " + player.cockDescript() + " and " + player.cockDescript() + " in one long stroke.[pg]");
			outputText("[say: Fuck.] [helspawn] gasps softly when you begin to pick up the pace, each thrust hitting her harder than the last. First she simply tenses, then she begins to take deep breaths, after that her voice begins to pierce the sky. Then, once you've reached top speed, she begins to cum. You can't help but feel proud of the way she's able to handle your unchecked passion and you know you'll soon be flooding both of her holes with plenty evidence of how good of a job she is doing.[pg]");
			outputText("[helspawn] violently trembles as the dual sensations bring her to climax again and again. For countless moments you keep up the pressure, bringing her back to back release as she claws the ground and begs for mercy. The vision of her beautiful trembling, sweat covered body is only exceeded by the feeling of her vaginal and anal walls gripping your " + player.cockDescript() + " and " + player.cockDescript() + " while flooding your trunk with her sweet smelling lady cum.[pg]");
			outputText("You toss your head back as the rushing feeling of imminent ejaculation takes you over. Your thrusts are suddenly harder, your muscles tense and your entire body shudders as [eachCock] bursts, filling both of [helspawn]'s holes with your magnificent baby batter.[pg]");
			outputText("[Daddy]! [helspawn] cries out and over as your cum starts to pour into her. ");

			if (player.cumQ() < 800) outputText("As your orgasm rages on [helspawn] twitches in pleasure, inadvertently causing your cocks to pop out. [eachCock] continues to spurt, sending thick ropes of cum splashing into the ground and over [helspawn]'s scaled legs. Soon the torrents expelling from [eachCock] reduces to a dribble, leaving a large puddle of hot dick juice rapidly cooling around [helspawn]'s knees.[pg]");
			else if (player.cumQ() >= 800) outputText("As your orgasm rages on [helspawn] twitches in pleasure, inadvertently causing your cocks to pop out. [eachCock] continues to shoot massive loads of hot baby batter. Like waves, each jet of hot cum breaks across [helspawn]'s soft ass and scaled legs. After what seems like days your climax begins to diminish, leaving a small lake of hot seed rapidly cooling around [helspawn]'s cum splattered form.[pg]");
			outputText("Breathing as if you've just run a mile you take a few steps back and take a seat on a nearby rock. As you strive to catch your breath [helspawn] rises and follows you with a happy grin. She sits on your lap and wraps her scaly legs around your waist, smearing and dripping your own cum across your crotch and thighs where she settles and trapping your cocks in the soft but messy cleft of her ass. She simply embraces you, her head lying on your shoulder as she listens to you breathe.");

			playerCameBeforeRiding = true;
		}
		menu();
		addButton(0, "Anal", sexAnalHelspawn);
		addButton(1, "Riding", sexRidingHelspawn, playerCameBeforeRiding);
	}

	private function sexAnalHelspawn():void {
		clearOutput();

		if (flags[kFLAGS.HELSPAWN_HADSEX] == 0) {
			//first time only
			outputText("You find the idea intriguing. You tell [helspawn] that you'd enjoy that as you reach down and begin stroking your " + player.cockDescript() + ". Her tailhole still glistens with your spit from earlier which will make the tight looking anal ring easier to penetrate. You take aim and dip your [cockHead] into her raised and waiting tail hole. The moment you enter her her powerful tail enters you.[pg]");
		}
		else {
			//repeatable
			outputText("You answer [helspawn]'s offer without words, you simply spread your legs and lean forward, pushing your " + player.cockDescript() + " into her still spit slickened tail hole. The moment you enter her her powerful tail enters you.[pg]");
		}

		if (player.longestCockLength() <= 10) {
			outputText("As you push smoothly into [helspawn]'s tight anal ring her tail slides into you for about the same length.[pg]");

			if (player.ass.analLooseness <= AssClass.LOOSENESS_NORMAL) {
				outputText("Being somewhat of a stranger to taking anal penetration, you slowly begin to fuck [helspawn]. Her tail moves through you, causing you to wince and clench, trapping the tail inside the vice like grip of tight your anal ring.[pg]");
				outputText("[say: Uh [Daddy]...] [helspawn] says with a look over her shoulder, [say: You don't do this often do you?] You shake your head in affirmation, [say: Alright, I'll just have to give you a lil help then.][pg]");
				outputText("With that said she pushes deeper into your " + player.assholeDescript() + ". The feeling of her tail slipping into your [asshole] is an odd combination of discomfort and pressure. Before you can decide if you like the sensation or not [helspawn] begins rocking back and forth, forcing you to take her tail while she milks your " + player.cockDescript() + ". The odd dual sensation are a strangely erotic combination of mind numbing pleasure and slight discomfort. Your " + player.cockDescript() + " revels in the glory of the tight spit slick hole using it to fuck itself. Meanwhile your [asshole] shudders as if unable to decide whether the sensations it feels are pleasurable or not. Then [helspawn] hits something inside you and your hips buck.[pg]");
				outputText("[say: Found it!] she says in triumph. She begins tail pegging your [ass] and fucking herself with gusto. Whatever she is hitting inside you has your entire body begging for release, especially when combined with the slapping of your bodies together as her squishy full ass engulfs your " + player.cockDescript() + " again and again. You're not sure you can hold on much longer.[pg]");
			}
			else if (AssClass.LOOSENESS_STRETCHED > player.ass.analLooseness && player.ass.analLooseness > AssClass.LOOSENESS_NORMAL) {
				outputText("Being neither a newbie or a master at taking anal penetration you fuck [helspawn] at a moderate pace. Just as she promised she begins sliding her tail into your [asshole], matching your pace stroke for stroke. Once you feel your backside can take a little more your leisurely thrusts slowly begin to speed up. Her tight asshole flexes and milks your " + player.cockDescript() + " as her tail manipulates your prostate. Once you've reached top speed both of your voices begin to rise and fall in time with your thrusts. Your tail filled asshole and asshole filling " + player.cockDescript() + " are pushing you over the edge. Instead of slowing down to prolong the moment you speed up, working towards your climax with sloppy thrusts as her tail pounds your [ass].[pg]");
			}
			else if (player.ass.analLooseness >= AssClass.LOOSENESS_STRETCHED) {
				outputText("Being somewhat of an expert at taking anal penetration you begin to fuck [helspawn] as hard as you can. True to her word her tail begins spreading your " + player.assholeDescript() + " wide open. The dual sensations of her gloriously tight hole milking your " + player.cockDescript() + " and her rough tail spreading your [asshole] wide are starting to get to you. Throwing caution to the wind you fuck her harder, working towards your climax with sloppy thrusts as her tail pummels your backside.[pg]");
			}
		}

		if (player.longestCockLength() > 10 && player.longestCockLength() <= 18) {
			outputText("As you push into [helspawn]'s tight anal ring her tail slides into you for about the same length. She holds her tail at the same angle and depth you hold your " + player.cockDescript() + " inside of her. Your body shudders at the dual sensations of having a tight hole wrapped around your " + player.cockDescript() + " while you yourself are being penetrated.[pg]");

			if (player.ass.analLooseness <= AssClass.LOOSENESS_NORMAL) {
				outputText("You grunt at the feeling of being penetrated so deeply, but [helspawn] doesn't seem to have a problem. Her anal sleeve is warm, tightly clinging to the surface of your " + player.cockDescript() + ".[pg]");
				outputText("When you don't move she laughs, [say: You don't have a lot of experience in that area, do you [Daddy]?][pg]");
				outputText("You shake your head and ask her what gave you away.[pg]");
				outputText("She smiles at you over her shoulder, [say: Well try to relax and remember to breathe,] she says matter-of-factly before adding, [say: ...and try to hold still, I got this.][pg]");
				outputText("With that she begins to push back slowly, engulfing your " + player.cockDescript() + " as she pushes her tail deeper into your [ass]. Your body jerks and you wonder why anyone would want something this big inside of their " + player.assholeDescript() + ". As if reading your thoughts [helspawn] groans, your " + player.cockDescript() + " is nowhere near the length of the tail she pegs herself with so it's no wonder she's enjoying herself. Your " + player.cockDescript() + " feels like it's fucking a spit slick tunnel of bliss while your [asshole] feels like it's being forcibly invaded. You do your best to hold still as she fucks herself with your cock while filling your rear entrance. Soon the alien feeling is replaced by an odd combination of discomfort and pressure. You can't deny that the feeling of her tail sliding through you is somewhat pleasurable. Then her tail hits something that causes your " + player.cockDescript() + " to jump inside her.[pg]");
				outputText("[say: Found it!] [helspawn] exclaims as she begins using your " + player.cockDescript() + " to fuck herself roughly while pegging you with her tail. With every incursion she hits that glorious spot inside you that makes you shiver. You can't help moving your hips, fucking down into [helspawn]'s soft squishy ass even as she roughly pounds yours. The sight of your hard thrusts rippling through her gorgeous ass is one to behold. Combined with the dual sensations you can't help but feel as though this is going to be over soon.[pg]");
			}
			else if (AssClass.LOOSENESS_STRETCHED > player.ass.analLooseness && player.ass.analLooseness > AssClass.LOOSENESS_NORMAL) {
				outputText("Being neither a master nor a newbie to taking anal penetration you fuck her at a slow pace. The way she matches your size has you pacing yourself but as soon as you're used to the depth to which she plunges into your " + player.assholeDescript() + " you decide it's time to speed up. Stroke by stroke you thrust faster until you've reached full speed. The dual sensations of fucking and being pegged have your body shuddering between thrusts. Beneath you [helspawn] is in a state of supreme bliss. The way her tight spit slick tailhole milks your " + player.cockDescript() + " while her tail manipulates your [asshole] has you dangerously close to the edge.[pg]");
			}
			else if (player.ass.analLooseness >= AssClass.LOOSENESS_STRETCHED) {
				outputText("Being no stranger to taking anal penetration you begin to fuck [helspawn] as hard as you can. [helspawn] makes good on her promise and begins pumping her tail in and out of your [asshole]. Your voices blend together as you both are filled with the mind numbing rapture of your rapid coitus. Throwing caution to the wind you fuck her hard, reveling in the feeling of her tail manipulating your prostate while her ass milks your " + player.cockDescript() + ". You know it won't be long now and you fuck towards your own climax with the fury of an animal.[pg]");
			}
		}

		if (player.longestCockLength() > 18) {
			outputText("When you push into [helspawn]'s tight anal ring her tail slides into you for about the same length. You both grunt as you're entered. Your " + player.cockDescript() + " is nothing to be taken lightly so you allow her to take a second to get used to its length and girth. Meanwhile your body shudders at the dual sensations of having a tight hole wrapped around your " + player.cockDescript() + " while you yourself are being penetrated.[pg]");

			if (player.ass.analLooseness <= AssClass.LOOSENESS_NORMAL) {
				outputText("[helspawn]'s tail is so deep inside you're having second thoughts. The way she is trying to push even deeper to match the depth to which you're penetrating her has you flinching with every movement of her tail.[pg]");
				outputText("[say: You gotta relax, [Daddy]...] [helspawn] says with a slight grimace. When you fail to follow her advice she arches her back, [say: Since you don't do this often I'll help you. Just sit back and try to relax, ok?][pg]");
				outputText("Before you can answer her tail sends another surge through your body. She begins pushing her round ass back as she pushes her tail into your [asshole]. She moves slowly, allowing you to familiarize yourself with the sensation so that you may relax and enjoy it. You do your best to relax and soon she feels you're good enough to speed up. Your breath comes out in ragged huffs as your mind is filled with the dual sensations. One is her glorious ass milking your cock with its hot, tight embrace and spit slick entrance. The other is her tail creating a mixed feeling of discomfort and pleasure. Then she hits something inside of you that causes you to cry out.[pg]");
				outputText("[say: Found it!] [helspawn] exclaims. She begins fucking herself on your " + player.cockDescript() + " while roughly pegging your [asshole]. The sudden change in pace makes you call out as you are assaulted by dual sensations of unbearable pleasure and undeniable fullness. She masterfully manipulates your prostate with every tail thrust while her eager asshole milks your " + player.cockDescript() + ". Soon you're fucking her as hard as you can and she, despite the way she claws at the ground and screams in ecstasy, manages to peg you just as hard with her tail. As the two of you make messes of each other's rear entrances you know you won't be able to hold on for long.[pg]");
			}
			else if (AssClass.LOOSENESS_STRETCHED > player.ass.analLooseness && player.ass.analLooseness > AssClass.LOOSENESS_NORMAL) {
				outputText("Being neither a master nor a newbie you begin taking it easy. Beneath you [helspawn] breathes a sigh of relief, you'd guess the two of you to have about the same experience level when it comes to this. The dual sensations of being pegged while her gorgeous ass takes the full length of your " + player.cockDescript() + " soon hit you like twin tidal waves of euphoria. Now that you're used to the amount of tail being stuffed in your back door you begin to speed up. Thrust by thrust you fuck faster and faster until you've reached top speed. The glorious pressure of her tail manipulating your prostate combines with the mind numbing euphoria of her sexy ass. Soon you're trembling. You don't know how much longer you can last.[pg]");
			}
			else if (player.ass.analLooseness >= AssClass.LOOSENESS_STRETCHED) {
				outputText("You revel in the fullness of the anal cocksleeve beneath you, as [helspawn] shivers. When you begin fucking her with hard full length thrusts she barely manages to keep up with your pace. As her tail slides in and out of your [asshole] you spread your legs, allowing it deeper and fucking her harder. The dual sensations are bliss. The way her tight asshole milks your " + player.cockDescript() + " alone would be enough to make you cum. When combined with the way her tail manipulates your swollen prostate from inside your [ass] it damn near brings a tear to your eye. As you continue to pound her while being pounded by her you feel your own climax quickly approaching.[pg]");
			}
		}

		var x:int = player.longestCock();
		// really we should declare and use x from the top rather than player.longestCock() - by calling .cockThatFits(80); //where 80 is her capacity
		if (player.cocks[x].cockType == CockTypesEnum.DOG) outputText("Even lost in passion as you are you're careful to not shove your " + player.cockDescript() + " in to the knot. Merely banging the sensitive bundle of flesh against her rectal entrance is enough... for now.[pg]");

		if (player.cumQ() < 200) {
			outputText("With a groan you shove your " + player.cockDescript() + " in to the hilt and begin to unload. [eachCock] begins to fire as you tremble against her. [helspawn] squeezes your " + player.cockDescript() + " as she presses your prostate, prolonging your orgasm. When you're done you have to push her eager tail away. When you tug your " + player.cockDescript() + " from her now gaping hole you can't help but admire the cock cream dripping down her scaly ass cheeks and pooling in wet cunt.[pg]");
			outputText("As you work to catch your breath [helspawn] wraps her scaly legs around your waist and holds you close, trapping your " + player.cockDescript() + " in the soft cleft of her ass and laying her head on your shoulder, listening as you breathe.[pg]");
		}
		else if (200 <= player.cumQ() && player.cumQ() < 400) {
			outputText("Growling like a animal you shove your " + player.cockDescript() + " in to the hilt just as [eachCock] explodes. You can feel [helspawn] squeezing your " + player.cockDescript() + " with well developed rectal muscles as her tail continues to bang into your prostate. The whole thing only serves to prolong the rapture that is your climax. As you tremble against her you can feel your own hot jizz escaping her hole and running down your legs. When your orgasm has subsided her tail slips from your backside. When you pull your " + player.cockDescript() + " from her now gaping hole you see your baby batter has made quite the beautiful mess. It's everywhere: on your legs, on her gorgeous ass, her scaly legs. Strings of cum even connect her thighs and drip from her glistening cunt.[pg]");
			outputText("As you try to catch your breath [helspawn] turns to wrap her scaly legs around your waist, trapping your " + player.cockDescript() + " in the soft but sticky cleft of her ass. She holds you close, her head lying on your shoulder as she listens to you breathe.[pg]");
		}
		else if (400 <= player.cumQ() && player.cumQ() < 800) {
			outputText("With a chest vibrating howl you shove in to the hilt just as [eachCock] explodes. She milks your spasming " + player.cockDescript() + " as she continues to pound your prostate, making you shake like a maraca as she prolongs the orgasmic sensations streaming through your body. You can feel your own ejaculate escaping from her asshole, the hot heavy cream soaking into your [skinfurscales] and sliding down your [legs] to your [feet]. Still trembling, you pull your " + player.cockDescript() + " from her and watch as your trapped baby batter cascades down her body now that you're no longer plugging her ass. Everything from a few inches above her tail hole to her inner thighs is covered in your creamy white spunk. Strands connect her thighs as she kneels in an impressive puddle, yet still more leaks from her happy asshole.[pg]");
			outputText("As you strive to catch your breath [helspawn] rises and wraps her scaly legs around your waist, smearing your own cum across your crotch and thighs where she settles and trapping your cock in the soft but messy cleft of her ass. She simply embraces you, her head lying on your shoulder as she listens to you breathe.[pg]");
		}
		else if (player.cumQ() >= 800) {
			outputText("Your chest reverberates with a bestial roar as [eachCock] explodes. You cum blasts so forcefully into [helspawn]'s anal canal that she jumps in surprise, freeing your " + player.cockDescript() + " from her tight hole and causing you to unload all over her thighs and ass. Meanwhile her tail remains inside of you, still pushing against your prostate as you tremble against her. Your orgasm rages on for an eternity of bliss and soon you are standing in a small lake of your own spunk and, somehow, you're still cumming. With a chuckle [helspawn] rises from the massive torrent still erupting from [eachCock] and kisses you. Her mouth massages your lips as you convulse from the enormity of your orgasm. Her entire lower half is glistening white and dripping as if she just got out of a cum shower.[pg]");
			outputText("She wraps her legs around your waist and holds onto you, dripping and smearing your own cum across your crotch and thighs where she settles, and trapping your " + player.cockDescript() + " in the soft but cum-drenched cleft of her ass as the last dregs of your titanic orgasm spill from [eachCock]. Once you've begun trying to catch your breath she simply lays her head against your shoulder and listens to your exhausted breaths.[pg]");
		}

		//FIXME shit don't work
		//player.buttChange(player.cockArea(), true);
		player.orgasm('Anal');
		player.orgasm('Dick');
		doNext(postSexHelspawn);
	}

	private function sexRidingHelspawn(playerCameBeforeRiding:Boolean = false):void {
		clearOutput();
		//HELSPAWN RIDING TEXT

		if (playerCameBeforeRiding) {
			//if player already came (ie. player has 2+ cocks and gave DP)

			if (flags[kFLAGS.HELSPAWN_HADSEX] != 1) {
				//first time only
				outputText("With [eachCock] glazed with your seed you keep your little girl wrapped up in your arms. Squeezing her tightly your enjoy the gentle warmth emanating from her. She is so magnificent with her glistening scales and soft skin. The two of you slowly catch your breath in silence, enjoying the simple intimacy of the moment. Once you've both mastered your breathing she pulls back to get a good look at you.[pg]");
				outputText("[say: Wow, [Daddy],] [helspawn] says with a grin, [say: I just... wow. We should spend more quality time with each other. I mean look at me, I'm shaking!][pg]");
				outputText("This causes you to chuckle because, for some reason, [helspawn] thinks the two of you are finished. You're so turned on that [eachCock] are still standing on end in spite of the fact that you just came. You tell [helspawn] with a grin that your quality time isn't over yet and watch a gorgeous smile of pure joy break across her face like a pale dawn.[pg]");
			}
			else {
				//repeatable scene
				outputText("With [eachCock] glazed with your own seed you keep your precious [helspawn] wrapped up tightly. Holding her close you revel in the warmth she exudes. She is such a beautiful woman with her glittering scales and sweat soaked skin. Once both of you have caught your breath and she smiles up at you, knowing what's coming next.[pg]");
				outputText("You kiss her smiling lips, sliding [eachCock] against her as she sits upon your lap. She grinds down into you as she returns the kiss, her hot tongue snaking into your mouth and massaging yours. A moan vibrates your lips as she presses herself into you. She trusts you completely and why shouldn't she? You are, after all, her [Daddy] and she's your little [helspawn].[pg]");
			}
		}
		else {
			//if player didn't cum yet (ie. player has 1 cock and opted for riding over pegging)

			outputText("You reach back and pull the tip of [helspawn]'s tail away from your [ass]. She smiles like a good sport when you say that there won't be any anal action today.[pg]");
			outputText("[say: Oh well,] she says with eyes full of mischief, giving your " + player.cockDescript() + " one last squeeze with her sopping wet vaginal walls before reaching back and sliding you out, painstakingly slowly. She turns, her naked form every bit as hypnotic as ever, and pushes you back to take a seat on a nearby rock. It's clear that she has a plan B as she straddles you, sitting just above your crotch and wrapping her scaly legs around your waist. [say: ...Maybe next time,] she finishes in a sing song voice.[pg]");
			outputText("She giggles as your " + player.cockDescript() + " nestles between her butt cheeks, and the upperside of it presses against her cunt. [helspawn] pulls you into a deep kiss as she starts to grind her hot, moist need against your " + player.cockDescript() + ". For a moment you simply enjoy the sensation of rubbing against her, but before long the need to be inside her again is too much.[pg]");
		}

		if (player.cockTotal() == 1) {
			outputText("Reaching down, you take hold of your " + player.cockDescript() + " and put it back into [helspawn]'s salivating sex.[pg]");

			if (player.longestCockLength() <= 8) {
				outputText("[helspawn] gasps as your " + player.cockDescript() + " pushes past her post orgasmic nether lips. She sits there with you inside her, squeezing your embedded tool with a look of supreme bliss on her face. She releases a soft moan, as she revels in the feeling of having your " + player.cockDescript() + " so deep inside of her. When she opens her eyes there is a smile on her lips as she looks down at you with all the adoration in the world. You give her a soft peck on the lips, a tender reward for looking so cute.[pg]");
				outputText("[say: Mmmmm...] [helspawn] says as she grinds around your hard dick, [say: ...I love it when you're inside me [Daddy]; it just feels so good.][pg]");
				outputText("You give her another kiss, a silent gesture meant to say you agree. She is bliss wrapped around your " + player.cockDescript() + " and her voice is like sex for your ears. She's so beautiful it hurts.[pg]");
				outputText("She bites her lip and begins bouncing up and down your rigid " + player.cockDescript() + ". Your bodies meet in a symphony of wet claps. Her gorgeous tits begin to undulate in circles as she engulfs your " + player.cockDescript() + " again and again. You marvel at her beautiful body, kissed with glistening sweat as she shrieks and moans. Unable to help yourself you begin thrusting up into her hungry pussy, driving her over the edge until her lady cum is spurting onto your belly and running down your [legs].[pg]");
			}
			else if (player.longestCockLength() > 8 && player.longestCockLength() <= 12) {
				outputText("[helspawn] groans as your " + player.cockDescript() + " pushes past her vaginal lips. She descends slowly, gasping as she wiggles this way and that until your " + player.cockDescript() + " is once again deep inside of her, squeezing your embedded fuck pole as she looks down into your eyes. She silently revels in the elation caused by having your " + player.cockDescript() + " so deep inside of her. Sweat from your previous fuck still glistens across her skin and scales. She's so sexy you can't help but fill her lips with yours, a groan from your lips vibrating her tongue as you suck it into your mouth.[pg]");
				outputText("When you release her she says, [say: [Daddy],] in a sexy voice as she grinds with your rigid cock still inside her slavering vaginal cocksleeve, [say: I love you so much [Daddy]. I love having you so deep inside me.][pg]");
				outputText("You respond with another kiss as you grind your tool around inside of her before lying back to enjoy your little [helspawn].[pg]");
				outputText("She starts off at a moderate pace, riding you with sharp gasps and deep groans. Her pussy slurps up and down your " + player.cockDescript() + ". Slowly she begins increasing the tempo until she's riding you so hard your body scoots across the rock you're sitting on. Soon the wet claps of your bodies meeting ring out across the camp along with your deep groans and her high squeals. Unable to help yourself you begin thrusting upward into her wondrous pussy. As you begin to move she releases a shrill yelp and her pussy begins gushing lady cum that splashes across your stomach and soaks [eachCock], running down your legs.[pg]");
			}
			else if (player.longestCockLength() > 12) {
				outputText("[helspawn] grunts as your " + player.cockDescript() + " pushes past her vaginal lips. Despite your previous incursion she's still pretty tight. So you have to take it slow and allow her to open back up. She tries to remain motionless as you grab her thighs and begin rock your " + player.cockDescript() + " into her quivering pussy. You can feel every fold as you gently work it open.[pg]");
				outputText("[say: Ah!] She gasps once you've worked as much of your " + player.cockDescript() + " into her as you can. She rolls her hips and sings soft wordless declarations of pleasure as she keeps you inside of her. She looks down at you, her sexy eyes filled with lust as she rolls her hips. You're deep inside her and she's smiling. She's ready.[pg]");
				outputText("She begins riding you slow, breathing deeply as her pussy is stretched wide by your " + player.cockDescript() + ". When she begins to pick up the pace it isn't long before she is riding your " + player.cockDescript() + " like a champ. Her face is scrunched up as sweat glistens against her brow. Her tits swing in a circle as her pussy slurps up and down your " + player.cockDescript() + ". Then she's suddenly quivering as her pussy sprays girl cum around your embedded cock. You fuck up into her gushing vagina, reveling in the way it spews her sweet smelling cum everywhere. It's on your stomach, it's sliding down your [ass] it's even running down your [legs].[pg]");
			}
			outputText("She squeals as you begin pulling her up and down your " + player.cockDescript() + ". You fuck her hard, drilling your erection into her gushing vaginal walls. She cums once, twice, again, once more. She keeps cumming as you grip her soft ass and pound her like there's no tomorrow. She trembles, screaming and calling out to the heavens as you decimate her with unbearable waves of pleasure.[pg]");
			outputText("With girl cum cascading across your form like a waterfall you press yourself against [helspawn]. As your cum boils up into your shaft you wrap your arms around her, still fucking the juices out of her. Then your " + player.cockDescript() + " begins shooting into her. You grind your spurting cock into her gushing lady slit. Your voices blend together, harmonizing as you both cum.[pg]");

			if (400 <= player.cumQ() < 800) outputText("The volume of your orgasm proves to be too much for [helspawn]'s womb, and her belly swells as you cum. Trembling you hold onto her tightly as your " + player.cockDescript() + " continues to shoot load after load inside her, even after it begins to spill out and drip to the ground, creating a glistening puddle of spooge.[pg]");
			else if (player.cumQ() >= 800) outputText("The sheer volume of your climax is far too much for [helspawn]'s womb to contain. Her belly swells and her eyes roll back as your " + player.cockDescript() + " blasts massive jets of hot seed inside her. Your cum quickly begins to spill back out, splashing to the ground and creating a small lake of hot baby batter as you hold onto her tightly, quivering with every spurt.[pg]");
		}
		else if (player.cockTotal() > 1) {
			outputText("Reaching down with both hands you hold up both your cum glazed " + player.cockDescript() + " and your cum dripping " + player.cockDescript() + ".[pg]");
			outputText("Still well lubricated from before with your seed and her girl cum, she slides onto both cocks at once, causing you to shudder in pleasure as her vaginal and anal lips engulf you simultaneously. She begins riding you slowly, wiggling her abdominals as she humps forward and backward. Each advance towards you causes her ass to squeeze your " + player.cockDescript() + " while each retreat causes her drooling pussy to massage your " + player.cockDescript() + ". She continues this for a few strokes before she adjusts her scaled feet. Then, looking down at you with lust filled eyes she begins to bounce.[pg]");
			outputText("It starts out slowly as the dual sensations prove too much for her. She trembles, trying to get you off but being too turned on to ride you like she wants to. So you help her along, getting a good grip of her soft ass cheeks and using your hands to speed her up.[pg]");
			outputText("That's all it takes. Without warning she's screaming as her pussy sends girl cum violently spurting across your lower body. It cascades down your [ass] and [legs] and soaks the ground with her lusty secretions. The sight alone is hot enough to make you blow but you hold on, wanting to see how many times your two cocks can make [helspawn] cum.[pg]");
			outputText("She screams in agonized pleasure during the whole process. Most of its unintelligible but what you can make out are declarations of love and only makes you want to last longer, to bring her more pleasure. Her beautiful sweat-covered tits twirl in a circle as you make her ride hard. Her body trembles, her voice breaks: she's coming again.[pg]");
			outputText("She whimpers as you speed up. You do everything you can to hold on as you bring her to completion again and again, thinking of every cascade of lady cum as a victory. Each time she reaches a climax you almost break but through sheer force of will, you prevail again and again until she's shrieking like a banshee and your seat is so soaked you feel like you're about to slide off of it.[pg]");
			outputText("So you let go, howling as each spurt furiously rips through [eachCock] and explodes into your darling [helspawn].[pg]");

			if (400 <= player.cumQ() < 800) outputText("As your huge loads of boiling cum shoot from [eachCock] [helspawn]'s belly begins to swell. She groans as she is filled up, rubbing her rounding belly with lust filled eyes. You can feel your own ejaculant oozing down your legs as her well-fucked holes fail to keep up with your huge volume of baby batter. Soon she almost looks pregnant.[pg]");
			else if (player.cumQ() >= 800) outputText("As your copious loads of boiling cum blast into both of her holes, [helspawn]'s belly expands. Unable to keep up with your immense volume of seed, cum spills out from her ravaged pussy and ass, splashing to the ground between your in an ever-growing puddle. However, you're pumping her full of cum faster than her body can reject it. Soon [helspawn] looks dangerously pregnant.[pg]");
		}
		if (player.cumQ() >= 400) outputText("As your climax begins to diminish [helspawn] rises, and a cascade of your hot cream comes pouring out, joining the already immense pool of spooge around your [feet] as her cum-stuffed belly deflates.");
		else outputText("As your climax begins to diminish [helspawn] rises, and a hot mixture of your cum and her juices runs down her scaly thighs in rivulets.");

		player.orgasm('Dick');
		doNext(postSexHelspawn);
	}

	private function postSexHelspawn():void {
		clearOutput();

		if (player.cumQ() >= 400) outputText("Both slick with sweat, cum and lady juices, the two of you collapse on the ground, ignoring the fact that you're lying in a pool of each other's fluids. You're both breathing as though you've just run a marathon. ");
		else outputText("You both collapse on the ground, breathing like you've just run a marathon. ");
		outputText("Even so, you can't help reaching up and pulling [helspawn] into your [face]. Sitting up you wrap her up in your arms as you kiss her sexy lips again and again. A gorgeous body made slippery by exertion and ejaculation grinds against you, cum covered genitalia pressing against cum covered genitalia with passionate need. Your hands glide across her sweat drenched skin effortlessly as you reach down to grip her luscious ass. Her hands, meanwhile, are sliding across your [chest] and back.[pg]");
		outputText("After a few breathless moments of mutual groping you are the one to break the kiss but only so that you may kiss her elsewhere. With a grin she leans back, her perky breasts shining with sweat as you bury your face in her neck. You hear her squeal as you lay her back against the mess of ejaculants the two of you have made together.[pg]");
		outputText("Using your lips you create a trail of soft kisses, each a wet proclamation of love, down her heated body. You begin with her flawless neck, tickling her as you create soft brown marks that stand out against her pale skin. Then you head down to her pert nipples, twirling your [tongue] around each hard stud that serves as a gentle reminder that she is still aroused. You taste her sweat covered form, kissing her trim belly and her soft thighs. You suckle, lick and kiss her legs and thighs until you pull her knees apart, exposing her cum glazed vagina.[pg]");
		outputText("You look up into her face with a grin and she smiles down at you with a twinkle in her eye. She spreads her legs as her tail presses her body into the air, presenting you with her cum soaked vaginal opening. You just enjoy the sight for a moment, watching as pearly liquid drips down her body to join the cum beneath the two of you.[pg]");
		outputText("Your stomach growls, the meal before you making you hunger, so you dive in. You taste your own masculine seed sweetened with her lady cum. The heavenly combination is a gourmet taste sensation you can't help but love having on your [tongue]. She squeals again as your tongue slides against her vaginal lips and shining clitoris.[pg]");
		outputText("She pushes you away with a giggle, saying, [say: Stop it, [Daddy].][pg]");
		outputText("You smile and ask her if you're doing it wrong, you of course know you're not.[pg]");
		outputText("[say: I'm all tender,] she says as she rubs her belly shyly. [say: It's too sensitive.][pg]");
		outputText("Nodding, you acquiesce to her request and finish by slurping the insanely tasty mixture from her pussy. The taste is mind blowing and you can't help but swirl the potent mixture around in your mouth. Then you notice [helspawn] noticing you with an amused grin as if she's about to make a joke at your expense. So, to shut her up before she even has a chance to speak, you kiss her.[pg]");
		outputText("She groans as you share your meal, eagerly pulling you against her and enveloping you in her warmth. She seems to enjoy the taste as much as you do and sucks every drop from your tongue before following through and giving you one last long, hard kiss.[pg]");
		outputText("Starting to feel tired the two of you fall back with a yawn. [helspawn] snuggles against you, placing her head on your [chest].[pg]");
		outputText("[say: I love you, [Daddy],] your darling [helspawn] says as she begins to drift off.[pg]");
		outputText("With a yawn you kiss her forehead and tell her you love her as well.[pg]");
		outputText("The two of you doze softly for a few moments, enjoying each other's company in silence. As she snuggles against your chest you reflect on all the things that brought the two of you together. You recall how Helia woke you up in the middle of the night. You look down at [helspawn]'s softly sleeping form and know that there are no regrets to be had concerning the beautiful little girl who calls you \"[Daddy]\".[pg]");
		outputText("After a few moments of gazing at her beautiful face you softy extricate yourself from her sleeping arms. She releases a soft moan and rolls over once you've freed yourself. Taking her into your arms you carry [helspawn] over to your bedroll and place her within its folds. She opens her eyes and gives you a smile before closing them again.[pg]");
		outputText("Returning to the cum strewn site of your recent coitus you find your " + player.armorName + " and pull it on. Your duty as champion beckons. With your [armor] on and your [weapon] in hand you give [helspawn]'s sleeping brow a quick kiss and rise, leaving her to doze peacefully.[pg]");

		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnLovemaking():void {
		clearOutput();
		outputText("You pull the salamander in, kissing her affectionately.");
		outputText("[pg][Helspawn] blushes and smiles. [say: " + player.mf("D-Dad", "M-Mom") + "...]");
		outputText("[pg]Though taken by surprise, she's not unhappy about it. [Helspawn] leans in and returns the kiss, slipping her reptilian tongue over yours. You glide your hand down her trim form, tugging at the waist of her blouse. She stops you, saying, [say: Not here, [Dad]! Shouldn't we be more... private?]");
		outputText("[pg]She has a point, and you aren't looking to force your daughter to have sex in the middle of an open camp this time. " + (player.str > 50 ? "You sweep [helspawn] off her feet, carrying her 'princess-style' as you take her to a suitable spot. " + (player.tallness < 55 ? "She stifles a laugh as best she can. [say: I'm like twice your size, [Dad], this is ridiculous.]" : "She gasps in surprise at suddenly being lifted, smiling with a hint of mild embarrassment.") : "") + "You bring the salamander away to your [cabin], hastily laying her down, away from possible prying eyes. This ought to be private enough, surely. With the stage set, you free her of her coverings, feasting your eyes on her nude, light-skinned body.");
		outputText("[pg]Sheepishly, [helspawn] says, [say: Well [dad], I'm all yours,] revealing her excitement through her blushing cheeks. You undo your [armor], revealing your " + (player.hasCock() ? "[cock]" : "[breasts] and increasingly moist genitals") + " to your daughter. " + (player.longestCockLength() < 6 && flags[kFLAGS.HELSPAWN_DADDY] > 0 ? "She immediately giggles at the sight, remarking, [say: I can see why Mom got someone else to help make me.] She lets out a contented sigh and adds, [say: But I don't mind it. I'm still your daughter either way.]" : (player.clitLength >= 6 && flags[kFLAGS.HELSPAWN_DADDY] > 0 ? "She looks to your crotch, spotting your excsesively large clitoris and immediately giggles at the sight, remarking, [say: Oh wow, I'm surprised you didn't just try to make me with that!] She lets out a contented sigh and adds, [say: But I don't mind it. I'm still your daughter either way.]" : "She bites her lip as she eyes it up, holding back her lust for you to make the next move.")));
		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(helspawnLovemaking2);
	}

	public function helspawnLovemaking2():void {
		clearOutput();
		outputText("You bring your face to hers, kissing her passionately. Your daughter deserves some proper foreplay. You dot more kisses on her chin, neck, and chest as you make your way down her body. Suckling her perky bust, you give her nipple a playful nibble. She whimpers at the unexpectedly sharp stimulus, far less accustomed to any level of rough play than her mother, Helia. Still yet to be at your destination, however, you move on from her chest, and trace your route over her firm stomach with the tip of your [tongue]. [Helspawn] stifles a laugh as the sensation proves slightly ticklish.");
		outputText("[pg]At last at the place of interest, you plant a smooch on her clitoris, getting an electrified yelp from your young salamander. Before you can smirk at her sensitivity, she grabs your " + (player.horns.type > 0 ? "horns" : "head") + " and presses you into her crotch, not willing to let you stop for even a moment.");
		outputText("[pg][say: Don't you dare tease me, [Dad]. You started, now commit to it,] she demands, showing you just where Helia's genes went.");
		outputText("[pg]You slip your tongue out, prying her labia apart. She tastes hot and savory, and is so flooded down here that you wonder if it was even necessary to service her. [Helspawn]'s tail wriggles around happily, as your tongue explores her precious valley, and her moans fill the air, adequately answering the passing thought.");
		outputText("[pg]Puckering your lips around her clit again, you suck the tiny nub, eliciting shudders from her as she instinctively grinds her thighs against your face. Mustering your strength, you pry your head from the salamander's eager grasp.");
		outputText("[pg]She immediately whines at you, [say: Wait, I was so close!]");
		outputText("[pg]Which is precisely why you stopped. It mustn't end before the main event.");
		doNext(helspawnLovemaking3);
	}

	public function helspawnLovemaking3():void {
		clearOutput();
		outputText("Crawling back up to your daughter's face, you gently kiss her lips. If she's going to get off, it will be together with you. You stroke your [if (hascock) {[cock]|[clit]}] while adjusting your position. [Helspawn] stares hungrily, having no words to spare as she awaits [if (hascock) {penetration|contact}].");
		outputText("[pg]" + (player.hasCock() ? "Your daughter's pussy tightly resists you as you push forward, gradually permitting you inside. She closes her eyes and sighs blissfully as your cock embeds itself deep within her." : "Your daughter's erect clitoris throbs needily you as you push forward, grinding it against your own. She closes her eyes and sighs blissfully as your genitals rub together passionately. "));
		if (player.sens > 90) {
			outputText(" Overwhelmed due to the high sensitivity of your body, you [if (hascock) {cum instantly|orgasm instantly, trembling, slowing down, and intensely moaning as you do so}]. [Helspawn], momentarily confused, [if (hascock) {slowly pulls away. She quietly leaves you where you are, your cum still dripping down her leg|chuckles as she says, [say: Oh wow, so turned on by your own daughter that you just cum on the spot? I don't think I'll ever let you live that one down.] She gives another hearty and amused laugh. Blushing hotly, you resume grinding against her, noticing that you've coated your daughter's thighs in girlcum}].");
			if (player.hasCock()) {
				player.orgasm('Dick');
				doNext(camp.returnToCampUseOneHour);
				return;
			}
			else player.orgasm('Vaginal');
		}
		outputText(" You hold onto her hips, fingers sliding over her smooth " + (flags[kFLAGS.HELSPAWN_DADDY] == 1 ? "black" : "red") + " scales, slowly [if (hascock) {moving your member in and out|thrusting back and forth against her}]. [Helspawn] reaches out and grabs you, kissing you intensely.");
		outputText("[pg][say: I want you to hold me, [Dad]. Don't let go until you've given me every[if (hascock) { drop you have|thing you've got}].]");
		outputText("[pg]Spurred on by your horny daughter's words, you hug her and lock your lips with her own, all the while pumping your hips. Her [helspawneyes] eyes glisten inches from your own, filled with love for the [man] she's letting [if (hascock) {inside her|take her completely}]. Her legs lift up as you move, inviting you to fuck her harder, to your heart's content. [if (hascock) {The slick walls of her vagina cling to your [cock] with all their might, never as willing to let you leave as they are to let you enter. Y|You occasionally feel your [clit] brush against the entrance to her silky soft vagina, feeling how intensely hot and wet she's become. Even as you do, y}]ou feel the heat rising up inside you; a tension is building in your loins.");
		outputText("[pg]Sporadically breaking the kiss to slip her moans out, [helspawn] rests her face against you and surrenders herself to the pleasure. She pants and gasps, and her tail swings over to wrap itself around you.");
		outputText("[pg]Your salamander daughter winces and screams as she orgasms, [say: I love you, [Dad]!]");
		outputText("[pg]You cave as well, [if (hascock) {releasing every drop of semen as you slam your hips forward one last time|your clit throbbing and your pussy spasming as you let out a flood of your womanly fluids onto her crotch and thighs}]. [Helspawn]'s legs cross behind you[if (hascock) {, locking you in place, keeping every spurt of cum securely trapped inside her|. Locked in place, you are able only to continue thrusting away at her until you feel the last drop of pleasure fade}].");
		player.orgasm(player.hasCock() ? 'Dick' : 'Vaginal');
		doNext(helspawnLovemaking4);
	}

	public function helspawnLovemaking4():void {
		clearOutput();
		outputText("You lay together with your daughter for a while. Her scarlet hair is now frazzled and messy from all the activity, but she still looks serene as she smiles sweetly at you. Once you've both had a while to rest together, you'll get on with your day.");
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnSmooch():void {
		clearOutput();
		outputText(player.tallness < 72 ? "You reach up and pull [helspawn]'s face close to yours." : "You place a hand on each of [helspawn]'s cheeks and bring her face close to yours.");
		outputText("[pg][say: " + (flags[kFLAGS.HELSPAWN_PERSONALITY] < 50 ? (player.mf("D-Dad", "M-Mom") + "?] Your daughter's tone is a bit nervous, and she blushes brightly. [say: Is there something you want?]") : "[say: Hey there, [daddy].] Your slut of a daughter grins at you with confidence and places her hands on your hips. [say: Do you want something from me?]"));
		outputText("[pg]Giving her a slight chuckle, you tell her that there's just one little thing. With a seductive smile, you plant your lips against hers before wrapping your arms around her tightly. " + (flags[kFLAGS.HELSPAWN_PERSONALITY] < 50 ? "[Helspawn] lets out a squeak of surprise but quickly returns the kiss and" : "[Helspawn] lets out an aroused giggle as she") + " embraces your body with her strong arms. Passionately, you part your child's lips with your [tongue] and soon feel her own eagerly responding to it. She pulls you tightly to her, her perky tits starting to squish against " + (player.biggestTitSize() > 1 ? "your own [breasts]" : "your flat chest") + ". Rolling your tongue against hers and pressing your body as close to her as it can get, you slide your hands down to squeeze her soft, plump ass.");
		outputText("[pg]The two of you continue kissing, hugging, and groping at each other for several minutes before you remove your face from hers. Nuzzling your head against her shoulder for a moment, you whisper " + (flags[kFLAGS.HELSPAWN_PERSONALITY] < 50 ? "the extent of your taboo love for" : "how much you want to fuck") + " your own daughter.");
		if (flags[kFLAGS.HELSPAWN_PERSONALITY] < 50) outputText("[pg][say: You're the best, [dad]. You're the only lover I need.] With a satisfied smile, she gives you a big, wet kiss on the cheek, and the two of you break the embrace.");
		else outputText("[pg][say: That was nice, [dad], but make sure to give me more than that soon. Someone raised by you has needs that can only be properly filled by you.] With a seductive smile, she gropes at your " + (!player.isGenderless() ? "crotch" : "[ass]") + " for a moment, lingering a bit before the two of you break the embrace.");
		dynStats("lus", 10);
		doNext(camp.returnToCampUseOneHour);
	}

	//Currently chaste-only
	public function helspawnFacesitting():void {
		clearOutput();
		outputText("With the flash of a smile you place your [hands] on [helspawn]'s hips and stare directly into her [helspawneyes] eyes. Returning the look, she places her hands overtop of yours and steps close. You lean " + (player.tallness < 72 ? "up" : "in") + " and deliver a small kiss to her nose and she blushes, prompting you to tell her that you'd like to go someplace more private.");
		outputText("[pg][say: Of course, [dad]. Lead on.] She smiles cutely and grips one of your hands firmly with her own.");
		outputText("[pg]You return the grip and do as she says. The two of you hold hands, leisurely stroll to your [cabin] and enter to a more private setting. Once alone, you pull your daughter into a tight embrace and deliver a loving kiss to her lips. You tell her that you want her and that you want her now. Grabbing the bottom of her blouse, you pull it upward, and she finishes pulling it off of her torso, tossing it to the side. Her soft, pale skin bared, you run your fingers up and down her muscled body.");
		outputText("[pg]Giggling, she brushes your hands aside. [say: That tickles! Come on, [dad], let's... " + (!player.isNaked() ? "get you a bit more comfortable.] [helspawn] takes charge and eagerly undresses you, visibly excited by every new bit of [skinfurscales] that becomes visible." : "have some fun already.]") + " Smirking seductively at you, your daughter pulls off her boots to reveal her dark-scaled legs to you.");
		outputText("[pg][say: Like what you see, [daddy]?] Nodding enthusiastically, you tell her that you love every part of her. [say: Really now? Well how about...] She deliberately trails off as she slowly and teasingly begins to slide her skirt down, showing her glistening pussy to you. Wordlessly, you step forward and deliver her a kiss while simultaneously pressing a [hand] to her crotch, rubbing gently at [helspawn]'s stiffened clitoris. Fully taking the lead, you lead her up to the foot of your [bed] and press her down onto her back. Holding an arm out, [helspawn] takes your hand and pulls you on top of her.");
		outputText("[pg]Sitting on top of her, you move your body forward and up to [if (singleleg) {position your vulva|a kneeling position}] above her face.");
		outputText("[pg][say: Well, [dad], you sure are giving me quite the view.] Encouraged by your little girl's words, you lower yourself and press your vulva firmly to her mouth, the weight of your body keeping it right where you want it. Without needing to be told, [helspawn]'s reptilian tongue immediately finds itself twirling around your [clit]. Letting out a moan to inform her that she's doing well, you begin gently grinding your pussy against her, making her chin and mouth shine as you coat her face with your wetness.");
		outputText("[pg]" + (player.clitLength >= 3 ? "You rub your oversized, erect clit on her lips, allowing her to easily pop it into her mouth. She sucks and licks at you as you thrust your feminine erection back and forth between her lips, the entrance to your [vagina] rubbing hard against her chin. You arch your back as pleasure builds, and you grind faster and harder. You force much of your body's weight down on your daughter and she skillfully pleasures your clit, which soon brings" : "She licks hard at your labia for a moment before slipping her tongue into your [vagina]. Feeling her inside of you, you arch your back and grind against her mouth and rub your clit on her nose. She alternates between slowly yet forcefully massaging your vaginal walls, flicking her tongue about inside of you, and thrusting it forward and back. As your pleasure builds you grind faster and faster, forcing your weight down against her hard as you grow closer to climax. [helspawn] skillfully works inside of you with her tongue and pushes her face forward at you to rub your erect clitoris using her nose, soon bringing") + " you to an intense orgasm.");
		outputText("[pg]Waves of bliss wash over you, encouraging you to let out a series of pleasured sounds while a gush of girlcum flows onto her face. After finishing riding out your orgasm with slow thrusts, you praise her for her work and lie down next to her on your back. After a moment of catching her breath, your daughter gets on top of you and plants a passionate kiss on your lips, her face shining with proof of her good work.");
		outputText("[pg]Breaking the kiss, she looks you in the eyes with an alluring smirk. [say: So... did you enjoy yourself, [dad]? If so then maybe you'd like to maybe return the favor?] You nod at her and tell her that you'd be glad to give something back. [helspawn]'s eyes light up at your response, and she crawls up to the position that you were in only a few moments ago.");
		player.orgasm('Vaginal');
		doNext(helspawnFacesitting2);
	}

	public function helspawnFacesitting2():void {
		clearOutput();
		outputText("As your daughter's very wet sex lowers closer and closer to your face, a bit of her arousal drips onto your lips. Licking it off, you comment that she really does seem excited. With a fiery blush of embarassment, [helspawn] immediately forces herself down onto your mouth. With her large size she puts down an impressive weight onto you, and she aggressively grinds her vulva against your lips. Responding to her dominant faceriding, you open your mouth and vigorously massage her stiff clit with your tongue while her delightfully wet pussy grinds against your chin. She lets out the occasional moan as she thrusts at you, your tongue skillfully rolling around her pleasure button.");
		outputText("[pg]With the aroused salamander going faster and harder at your face, you soon feel an unexpected sensation brush your own crotch. [helspawn]'s tail presses firmly at your vulva and starts sliding forward and back against, encouraging you to begin grinding on it yourself. You press your [clit] hard to her tail and hump upwardly at it while she presses it down firmly while thrusting it for your pleasure. Moans from her grow louder and more frequent as she increases her aggression to both your face and genitals, the heat [if (singleleg) {of your crotch|between your own legs}] steadily building up as well. Enraptured by ecstasy, it's not long before she cries out in orgasmic delight. Encouraged by her climax, you forcefully massage her clit as she rides it out while simultaneously grinding your pussy at her tail fast and hard until you let out an involuntary cry yourself, a second orgasm hitting you hard.");
		outputText("[pg]The two of you continue your motions until both of your orgasms have subsided, [helspawn] dismounting from you afterwards and laying next to you. She rolls onto her side and puts an arm around you, snuggling up close to you and planting a light kiss on your cheek. [say: That was really really nice. Love you, [dad].] You return the cheek kiss and the embrace while expressing to her that the feeling is mutual. After a few moments of cuddling together quietly, you notice that your little girl has fallen asleep in your arms.");
		outputText("[pg]After laying with your sleeping daughter for a short bit, you carefully work your way out of her arms and get up. Getting dressed, you decide to let her sleep in your [bed] until she wakes up. After giving her a light kiss to the forehead, you exit your [cabin] to continue your day.");
		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnFootjob():void {
		clearOutput();
		outputText("You " + (!helspawnChastity() ? "aggressively" : "affectionately") + " grab your daughter's hand and tell her " + (!helspawnChastity() ? "that you want to take her to your [cabin] and have some fun." : "that you'd like to spend a bit of private time in your [cabin].") + (!helspawnChastity() ? " [say: Oh, do you now, [Daddy]? Wanna fuck your little girl for a while? Then please, lead on.] With an amused smile, your whorish child grips your hand firmly and walks alongside you." : " [say: Well alright, [Dad]. With you, that sounds like it could be a nice way to spend some time.] With a shy smile and bright blush, your fairly innocent girl lovingly wraps her fingers around your hand and walks alongside you."));
		outputText("[pg]When the two of you arrive at your abode, you lead her into the [cabin] first, with you following. Once inside, you hug her " + (!helspawnChastity() ? "bare tummy " : "") + "from behind and press yourself tightly against her. " + (!helspawnChastity() ? "[say: Eager to get a piece of me, [Dad]?]" : "[say: It's always so nice feeling your arms around me, [Daddy].]") + " You respond in agreement and " + (!helspawnChastity() ? "move your hands to strip of her indecent attire, quickly pulling it off with her full cooperation and tossing it aside." : "tell her how much you want her before moving your hands to remove her modest clothing. [say: [Daddy]... you're going so fast with me today.] [helspawn] giggles a bit as she somewhat nervously aids you in removing her modest attire, neatly laying it aside afterwards.") + (!player.isNaked() ? " With your daughter's flesh now properly bared, " + (!helspawnChastity() ? "she turns around to face you so she can" : "you gently turn her to face you and ask her to") + " help you remove your clothing." : "") + " Once " + (!player.isNaked() ? "the two of you are" : "she is") + " fully nude, you sit her down on your [bed]. " + (!helspawnChastity() ? "Quickly and full of lust," : "Slowly and lovingly,") + " you join her and bring your lips to her own. The two of you kiss with passion and " + (!helspawnChastity() ? "arousal" : "affection") + ", your [hands] quickly finding their way to your daughter's perky breasts. [helspawn] lets out " + (!helspawnChastity() ? "a loud and eager" : "a quiet and breathy") + " moan as you begin to grope and squeeze her tits while playing with her erect nipples. Not content simply being fondled as the two of you make out, [helspawn] " + (!helspawnChastity() ? "reaches down to gently rub your erect [if (hascock) {[cocktype]|[clit]}]" : "[if (haslegs) { reaches down to " + (!helspawnChastity() ? "teasingly" : "softly") + "caress your inner thighs|gently caresses your [chest]}]") + ". A few moments of your little girl's touch pours fuel onto the fire that is your arousal, but before you're able to escalate things, she breaks contact and asks you a question. " + (!helspawnChastity() ? "[say: Hey, [Dad]... is there anything you find sexy about me that you've never really talked about with me?]" : "[say: Say, [Daddy], do you think there's anything a bit more... unconventional you'd like to try?]") + " You simply say the first thing that pops into your head and tell her that you've always thought " + (!helspawnChastity() ? "she had cute, soft-looking feet." : "it would be interesting to try something with her cute, soft-looking feet."));
		outputText("[pg]Before you're able to inquire as to why she asks, she " + (!helspawnChastity() ? "smirks mischievously" : "giggles with a hint of excitement") + ". [say: I thought of something special that you might like, [Daddy]. Now just face me and lean back a bit.] You do as she says, leaving your body on full display for her. For a moment, she simply " + (!helspawnChastity() ? "takes in the sight with a grin" : "twiddles her thumbs nervously") + ". But before you're kept waiting too long, she assumes a similar position to you and extends her feet towards you.");
		outputText("[pg][if (haslegs) {She spreads your legs with her feet, putting your aroused genitals on full display. }]Seems it's time for something a bit unconventional. [if (isherm){" + (!helspawnChastity() ? "[say: Alright, [Dad]. So which part do you want me to handle for you?]" : "[say: So... what would you prefer me to focus on?]") + "}]");
		if (player.isHerm()) {
			menu();
			addButton(0,"Pussy", helspawnFootjobPussy).hint("Get those scaly feet a bit wet.");
			addButton(1,"Cock", helspawnFootjobCock).hint("Have her please your cock between those leathery soles.");
		}
		else doNext(player.hasCock() ? helspawnFootjobCock : helspawnFootjobPussy);
	}

	public function helspawnFootjobPussy():void {
		clearOutput();
		outputText((player.isHerm() ? "You tell her your preference and she nods her head. " : "") + "[helspawn]'s reptilian feet approach your increasingly wet [vagina], her soft soles facing you. She " + (!helspawnChastity() ? "smirks" : "smiles") + " as you feel the leathery sensation press against your slick sex. The softness of her sole gently rubs your labia, while she very carefully and delicately teases your [if (hascock) {[cock]|clitoris}] with the side of her short claws. Unusual, but uniquely pleasurable, the sensation of her smooth, reptilian foot on your pussy causes you to relax your body and enjoy the experience. Sparks of excitement tingle [if (haslegs) {between your legs|in your crotch}] as she rubs and slides against your moist vulva, gradually applying more force to you. As [helspawn] works her magic between your legs, you decide it might be nice to make things a little more mutual.");
		outputText("[pg]You extend your [if (haslegs) {legs|lower body}] toward your daughter, prompting her to spread her thighs to the best of her ability without disrupting anything. " + (!helspawnChastity() ? "Without hesitation, you" : "Gently, you") + " press [if (isnaga) {the tip of your tail|your [foot]}] to your daughter's wet vulva and rub against her sex in circular motions. She " + (!helspawnChastity() ? "grunts" : "moans") + " approvingly, encouraging you to use a bit more force. Massaging, grinding, tickling, teasing, and even prodding just barely into the entrance of her tight vagina, you make your little girl " + (!helspawnChastity() ? "buck her hips" : "squirm") + " in delight at your touch. [helspawn] breathes heavily and deals with you more aggressively in return, making it hard not to let out the occasional involuntary moan of pleasure.");
		outputText("[pg]Her sole grinds against your pussy hard, the soft heel of her foot pressing at the entrance to your [vagina] with nearly enough force to enter it. With surprising delight, your [if (hascock) {[cocktype]|[clit]}] is teased and pleased by her dainty claws, which she is shockingly able to manipulate just well enough [if (silly) {to not tear open your blood-engorged organ and maim you in one of the least desirable ways you can think of|to keep from scratching you even once}]. The size of her reptilian foot is more than large enough to completely envelope your cunt, stimulating every part of the exterior with carefully controlled motions. The heat [if (haslegs) {between your legs|in your crotch}] continues building, and you're sure the same is happening for her as you work on your daughter's increasingly wet, glistening little pussy with vigor.");
		outputText("[pg][helspawn] breaks first, her climax arriving suddenly and hard. She " + (!helspawnChastity() ? "lets out loud moans of orgasmic bliss" : "involuntarily lets out loud, breathy moans which she does her best to stifle") + " as you feel her pussy twitch and spasm against your [foot], warm girlcum flooding onto you. Caught up in trying to stimulate your partner to your fullest as she cums for you, the tingling pleasure of your own climax sneaks up on you. You arch your back and let out a moan as you feel your pussy spasm against your daughter's soft sole[if (hascock) { and [cock] twitch between her claws uncontrollably before soon letting out spurts of your cum onto her reptilian foot}]. The two of you both captured in the moment by your intense orgasms, you simply continue going at each other as intensely as you can manage, gazing into each other's eyes " + (!helspawnChastity() ? "with lust" : "with love") + " as you ride it out. Even once you've both cooled down, the two of you continue on for several more minutes, simply enjoying the feeling of one another.");
		player.orgasm('Vaginal');
		doNext(helspawnFootjobEnd);
	}

	public function helspawnFootjobCock():void {
		clearOutput();
		outputText((player.isHerm() ? "You tell her your preference and she nods her head. " : "") + "[helspawn]'s reptilian feet approach your painfully hard [cock], soon flanking your erect member with her soft soles facing it. She " + (!helspawnChastity() ? "chuckles" : "nervously giggles") + " and begins gently stroking it up and down with the side of her claws. Teasing, toying and gently rubbing, she makes sure to see you squirm just a tiny bit before " + (helspawnChastity() ? "apologizing and" : "") + "really starting. [helspawn] places the precise middle of each of her leathery soles against your [cocktype] and squeezes them together, taking firm hold of it. While a bit uncomfortable at first, once she starts gently moving her feet up and down your shaft, it simply feels great. The softness of the bottoms of her reptilian feet is a bit unexpected, but certainly pleasant. [if (silly) {Someone taught this girl to moisturize. }]As she works on you with a steady, strong rhythm, you decide to makes things a bit more mutual for the two of you.");
		outputText("[pg]You extend your [if (haslegs) {legs|lower body}] toward your daughter's glistening vulva, fully revealed as her legs are spread to pleasure you. " + (!helspawnChastity() ? "With immediate force, you" : "After giving her a gentle caress on the thigh, you") + " press [if (isnaga) {the tip of your tail|your [foot]}] to your daughter's increasingly wet pussy and enthusiastically rub at her sex. She " + (!helspawnChastity() ? "bucks her hips a bit against you" : "squirms a bit and lets out a light moan") + " in approval, encouraging you to put a bit more speed and strength in your motions. Rubbing, circling, grinding, thrusting at, and even just slightly prodding into the tight entrance of her vagina, you make your reptilian girl " + (!helspawnChastity() ? "grind herself against" : "blissfully squirm against") + " your touch. [helspawn] breathes heavily and deals with you more aggressively in return, making it all too easy for you to let out occasional involuntary vocalizations of pleasure.");
		outputText("[pg]Her feet tighten further against your cock and speed things up, soon moving at a pace that makes the blissful sensation [if (haslegs) {between your legs|of your crotch}] increase dramatically[if (hasvagina) { while your unattended [clit] throbs needily}]. Just as suddenly as she sped up, she soon switches to long and strong thrusts up then down the entirety of your shaft" + (silly() && player.longestCockLength() >= 48 ? " somehow" : "") + ", soon beginning to alternate between the two paces. The changing, but equally delightful methods leave you squirming as you feel your orgasm coming closer and closer. The nearer you get to your climax, the more speed and force you work her increasingly soaked pussy with, your back soon arching as your [cock] starts twitching without control.");
		outputText("[pg]Your [cocktype] throbs hard against her feet a few times before forcefully shooting your seed out in spurts, covering both the scales of her feet and her leathery soles[if (hasvagina) { all while a flood of girlcum soaks the [bed] beneath you}]. Wrapped up in your own intense orgasm, it takes you a moment before you notice that [helspawn]'s pussy is spasming against you hard, gushing her feminine fluids onto you while she cries out " + (!helspawnChastity() ? "lustily" : "lovingly, doing her best to stay quiet") + ". The two of you keep going at each other, captured by orgasmic pleasure and both determined to maximize the other's orgasm. It's not for a couple minutes that the two of you stop completely, both very fulfilled.");
		player.orgasm('Cock');
		doNext(helspawnFootjobEnd);
	}

	public function helspawnFootjobEnd():void {
		clearOutput();
		outputText("Once the two of you are finished with your somewhat unusual sex, you lay back on the [bed] to relax a bit. [helspawn] quickly joins you, " + (!helspawnChastity() ? "lying next to you with a satisfied look on her face" : "snuggling up against you and pulling you into an embrace") + ". " + (!helspawnChastity() ? "[say: Damn, [Dad], you definitely know how to make a girl feel good with your [feet]. That was just as great as before.]" : "[say: That was... really fun. Though, it always is with you, [Dad].]") + " Expressing your agreement, you wrap an arm around her to simply hold for for a bit. " + (!helspawnChastity() ? "[say: It's always nice spending time with you, [Dad].] [helspawn] hugs you back and gives you quick kiss." : "[say: Love you, [Dad]. Just, lay here with me for a little while and hold me, please.] [helspawn] kisses you on the lips and then nuzzles her head against your neck.") + " You lie cuddled up with her until you're able to tell that she's asleep, then carefully get up from the [bed]. After a few minutes of getting ready, you head out of your [cabin] to continue your [day].");
		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnScales():String {
		return flags[kFLAGS.HELSPAWN_DADDY] == 1 ? "black" : "red";
	}
	
	public function helspawnSlutsex():void {
		clearOutput();
		outputText("This close to your [if (tallness < 78) {not-so-}]little salamander, you can't help but admire the woman your daughter's become. [if (ischild && silly) {She's even older than you now, causality be damned.|[if (lib > 50) { She fits right into your home, enjoying the pleasures of Mareth almost as much as her parents.|She has passion unmatched--so much so that it's impossible not to [if (cor > 50) {want|love}] her.}]}] Perhaps she notices you staring as she leans in, her [helspawneyes] eyes alight with [if (cor > 50) {desire|amusement}] while she waits [if (cor > 50) {for you to|to see if you'll}] make the first move.");
		outputText("[pg][say: What is it, [Daddy]?] she asks, and it'd almost be innocent were it not for [if (isnaked) {the cool metal of her chain bikini pressing against your [if (hascock) {[cock]|[skindesc]}] as she pulls you closer.|her hands tracing down your back, slow and light until she takes your [ass] into her grip.}]");
		outputText("[pg]Your [paternal] bond goes beyond words, her lips gently parting as soon as you move to claim them. They're soft and welcoming, just like you taught her to be, and the first taste of your daughter leaves you desperate for more, her flavor so enticing that you scarcely notice her hand shift until [if (!isnaked) {it slips inside your [armor] and|[if (hascock) { it}]}] [if (hascock) {wraps around your shaft|her fingers flutter against your entrance}]. Her lips remain locked to yours, keeping you silenced even as you [if (hascock) {thrust into her grip|grind against her}].");
		outputText("[pg]You bask in [Helspawn]'s fiery heat as you pull her in tighter, offering no resistance when her tongue brushes against your own. Thoughts of being seen like this with your daughter flit through your mind, [if (cor > 50) {and it's positively exhilarating, especially|but any hesitation you had fades away}] when she [if (hascock) {starts to stroke you, her thumb teasing the head|slips a finger inside, her thumb teasing your clit}], lingering every time you shudder. [if (isnaked) {There's nothing subtle about it|Her motions leave little to the imagination}], and you [if (cor > 50) {revel in her touch, uncaring|burn with a heady mix of arousal and embarrassment, finding it hard to care}] if the world sees your passion for your wonderful daughter.");
		outputText("[pg]Her lips leave yours, softly pulling away, just slow enough that for a moment you think you could lean in and take them again. [if (isnaked) {[say: I don't think you wanted just a kiss, [Daddy].] [Helspawn] gives you one last [if (hascock) {rub|thrust}] before gliding her hands up your [skindesc], smiling as you tremble under her touch.|[say: You look a little uncomfortable, [Daddy].] [Helspawn] gives you one last [if (hascock) {rub|thrust}] before sliding your [armor] off, her breathing heavy as she takes in the sight of your nude body. [say: Isn't that better?]}]");
		outputText("[pg]She's right, you tell her. She always is--your beautiful, smart little girl who knows exactly what her [father] needs. Your daughter grows quiet at the praise, lazily tracing a finger [if (biggesttitsize < 1) {down your chest|around one of your [breasts]}], though even her confidence can't mask the red tinge to her cheeks. [say: Thank you, [Daddy],] she says, her smile growing even wider once her eyes meet yours.");
		outputText("[pg][if (hasscales) {Her [helspawnscales] scales " + (helspawnScales() == player.scaleColor ? "seem to meld with" : "stand in stark relief to") + " your own as your hand brushes against her arm.|No matter how many times you touch them, the smoothness of her [helspawnscales] scales comes as a surprise.}] Yet even better is the softness of her skin--your lips on her neck, drinking in that characteristic salamander heat as your fingers slip underneath the strap of her bikini and trace along her collarbone. [Helspawn] shudders in your arms, and every sound, every swallow she makes flows into you, leaving her unable to hide her desire.");
		outputText("[pg]Especially when she gently pushes you back, her eyes as fiery as her tail while she slips out of her outfit with a fluid, obviously well-practiced motion. It's rather impressive [if (cor < 25) {and a little concerning}], all things considered, but your daughter only smiles in response.[if (isnaked) { [say: We don't all run around naked, you know.]| [say: Interested, [Daddy]? We could have some lessons later...]}]");
		outputText("[pg]Her smoky scent washes over you as you move in, and your fingers brush along the sensitive line where skin and scales meet as you press her up against [if (builtcabin) {the cabin wall|[if (builtwall) {the wall surrounding your camp|a nearby rock}]}]. Before you can even react, her lips find yours again, filled with frantic, needy passion you [if (cor > 50) {always hoped|never thought}] you'd see from your own daughter. It's only thanks to her mouth on yours that you stay silent when [if (hascock) {your [if (cocks > 1) {cocks glide|cock glides}] along her entrance, warm, wet, and tempting.|her tail brushes against [if (singleleg) {you|your thighs}], its heavenly warmth stealing your breath away as the tip flickers across your [clit].}]");
		if (player.hasCock()) {
			outputText("[pg]It's right [i:there], her arousal coating your [if (cocks > 1) {shafts|shaft}] with every excruciating thrust. The tiniest shift would let your [cock] slip effortlessly inside, sinking into your daughter's depths. A bit higher and her lips gently part around the head, your chest tight with anticipation as you simply remain there, savoring her warmth. She squirms in your grasp, her body so close to the pleasure she needs.");
			if (player.str >= 50) {
				menu();
				addButton(0, "Fuck", helspawnSlutsexFuck).hint("Lift her up and take her right here.");
				addButton(1,"Resist", helspawnSlutsexResist).hint("Enjoy your daughter just a bit longer.");
			}
			else doNext(helspawnSlutsexResist);
		}
		else doNext(helspawnSlutsexYuri);
	}

	public function helspawnSlutsexFuck():void {
		clearOutput();
		outputText("You can't wait any longer. [if (cor < 25) {No matter how much you try to control yourself, you want this as much as she does.|Ever since [helspawn] [if (allowchild) {was a little girl|first matured}], [if (helspawnvirgin) {you've fantasized about this very moment|you couldn't keep your eyes off her}].}]");
		outputText("[pg]Breathless, she breaks the kiss, her [helspawneyes] eyes shining back at you. [say: Please, [Daddy].]");
		outputText("[pg]Any lingering doubts you might have had vanish at the sound of your daughter begging for you, wanting to feel the full extent of your [father]ly love. You're all too happy to provide, gripping her tighter as you thrust inside, pulling her against you and sinking further into her warmth. Her claws [if (isgoo) {tear into your slime|scrape against your back}] as she clings to you, your senses barely aware of anything beyond the soft, soothing heat that seems to envelop everything from your [cock] to your mind itself.");
		outputText("[pg]Now, hilted within her, truly joined with your daughter in a love that few [father]s have, she's as beautiful as ever, both inside and out. Her breathy whimpers fill your ears with every thrust, the primal sounds of her pleasure giving you the strength to hold her up, even as your arms burn. When you pull out--gently, teasingly, as if you could stop here and leave her desperate for more--her tail brushes your [skindesc], the painless flame [if (hours > 18) {bathing the two of you in a dim glow|flickering on the edge of your vision}].");
		outputText("[pg]Your daughter can't hold back her voice when you enter her again, her tail lashing across your [if (singleleg) {body|legs}] as you slide further into her silken depths, not stopping until " + (player.cocks[0].cockLength > 10 ? "you bottom out" : "her hips meet your own") + ". [say: [Daddy]...]");
		outputText("[pg]The aching in your muscles reminds [if (iselder) {you that you're not as young as you used to be|you that you can't last forever}], but you grit your teeth and ignore the burn, ignore the building pressure in your [if (hasballs) {[balls]|[cockplural]}], ignore everything but the sweet sound of your daughter's moans and the slickness of her walls as you start to move. With every thrust your rising pleasure jumps to the front of your mind, your body flushed and frantic at the thought of filling your little girl with your seed.");
		outputText("[pg]Just imagining it makes your [cockplural] twitch, and it's hard to hold yourself back when her legs wrap around you, pulling you " + (player.cocks[0].cockLength > 10 ? "as close as she can" : "closer than you've ever been") + ". Sweat trickles down her skin and gleams on her scales, her hold wavering as you shift inside her, hands squeezing tighter as her entire body clenches and grips around you, desperate for you to fill her up. Your [if (hasballs) {balls throb|[if (cocks > 1) { cocks throb|cock throbs}]}] as she milks you, the combination of her labored breaths and growing tightness enough to send you over the edge as your [cock] pulses inside your daughter.");
		outputText("[pg][say: Give me everything, [Daddy]!] she says, and you'd never be able to refuse your little girl, thrusting one last time before letting go and filling her with [if (cumhigh) {the first of}] your cum. [if (cocks > 1){Your other [if (cocks > 2){cocks follow|cock follows}] suit, [if (cumhigh){coating|spattering}] her skin with your seed.}] [say: Yes!] She smiles as she grinds her hips into your hands, seemingly intent on ensuring she coaxes out all she can.");
		outputText("[pg][if (cumhigh) {And you still have lots to give, your [if (hasballs) {overfilled [balls]|reserves}] not even close to running out. It's too much for even her to hold, her thighs desperately clinging to you as your prodigious orgasm drips out of her and splashes on the ground. }]Just when it feels like you've been drained completely dry, a shudder runs [if (isgoo) {through your body|down your spine}] as your [cock] releases another blast of cum into her depths. With that, your strength falters, your arms cramped and on fire as you reluctantly pull out of your daughter. [Helspawn]'s legs tremble [if (!singleleg) {almost as much as your own}] when you place her on the ground, her [helspawneyes] eyes glittering with adoration as she leans into you. [say: I love you, [Dad].]");
		outputText("[pg]A light kiss to her [if (tallness < 78) {cheek|forehead}], and she blushes, nestling [if (tallness < 72) {you into her chest|into your chest}]. [say: No one makes me happier.]");
		outputText("[pg][Helspawn] [if (!isnaked) {watches your every move as you dress yourself and}] pouts when you ruffle her hair, though that only manages to make her look more adorable when she wishes you [if (hours < 19) {goodbye|good night}].");
		player.orgasm('Dick');
		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnSlutsexResist():void {
		clearOutput();
		outputText("But she'll have to wait, even if she doesn't want to. Your little girl deserves everything, and it starts with your lips on her neck, feeling every vibration of her needy whimpers when you slide your [cockplural] away. Then slipping ever lower, pausing ever-so-slightly when her sounds shift to a groan as you suckle on her favorite spot. One hand tracing down her forearm, fingertips brushing from smooth scales to well-defined muscles to the sweet swell of your daughter's breasts, her nipples already hard under your touch. How long has she been thinking about her [father], you wonder, rolling the sensitive nub between your fingers until her breathy sighs fill your ears.");
		outputText("[pg]But you're not even close to being finished, especially when [helspawn] thrusts her hips into your hand as it slides slowly, purposefully down every ripple of her stomach. Even now, your daughter's arousal is palpable, thrumming in her pulse and leaking into the air. As if you needed proof of the extent of her love--no, the way she squirms when your lips ghost over her nipple and shudders as your fingers find her throbbing clit tells everything to know.");
		outputText("[pg]Still you go lower, sinking further down until your hands rest on her scaled thighs, already trembling as they spread apart. She gives no words and no sounds, nothing but her hands [if (hairlength > 0) {in your hair|on your head}] as you lean in and taste her, marveling at your daughter's flavor. [Helspawn] squirms as you trace along her folds, gently parting them with your tongue--and her composure finally breaks when you flutter over her clit, slipping it between your lips. Her claws [if (hairlength > 0) {curl in your hair|dig into your scalp}] as she pulls you closer, her breathing growing heavy the moment your finger brushes her entrance.");
		outputText("[pg]As aroused as she is, it's effortless to sink into her slick depths, her walls gripping and milking you as though it were your [cock] inside. Her body begs you to fill her up with seed that will never come, tail thrashing as you feel out her favorite spots until she tightens around you, clit throbbing in your mouth as you never let up, while your own [cockplural] [if (cocks > 1) {drip|drips}] helplessly with need at the sounds of her pleasure.");
		outputText("[pg]When she finally comes down, you glance up at your daughter, a serene smile gracing her lips before you rise and claim them.");
		outputText("[pg][say: You're the best, [Dad],] she says, her hand already gliding down your sensitive [skindesc], and you can only grit your teeth when it wraps around [if (cocks > 1) {one of}] your [cockplural]. [say: But don't ever think I'd forget about you.]");
		outputText("[pg]True to her word, she turns around and braces herself against the [if (builtcabin || builtwall) {wall|rock}], her body on full display. Your [cock] pulses against the heat of her folds, every movement coating it with her juices, and it only takes a moment before you easily slip inside. [if (cocks > 1) {Not to be left out in the cold, your [cock 2] sinks into her ass, her muscles yielding to your length as you fill both her holes.}] That salamander warmth washes over you, bathing your [cockplural] in a slick heat that knocks your breath away.");
		outputText("[pg]At your hesitation, she pushes back, taking you " + (player.cocks[0].cockLength > 10 ? "as deep as she can" : "all the way inside") + "--and this, this is the moment you've been craving since she [if (allowchild) {was a little girl|first started to mature}]. Now, with your hands on her hips and your hearts connected in a way others can only envy, she grips the [if (builtcabin || builtwall) {wood|stone}] tighter as your first thrust rocks through her. Even like this--sweaty, stained with her arousal, [if (cocks > 1) {completely filled with your cocks|ass in the air}], your little girl is still as beautiful as ever, her gasps sweet in your ear as you begin to pull back.");
		outputText("[pg]Her walls, silky and hot, grip you, trying their hardest to not let you go and showing just how much she needs you, needs to feel the seed churning [if (hasballs) {in your [balls]|inside you}]. She braces herself, her tail wrapping around your back so you can't leave, not that you ever would. [say: I want all of it, [Daddy].]");
		outputText("[pg]Your daughter's voice, flustered and panting as she begs for your cum, makes your [if (cocks > 1) {cocks|[cock]}] twitch, spurring you on as you pick up the pace. Her body ripples with each thrust as you sink yourself into her depths, giving yourself over to the fierce passion you have for your little girl. She's everything--gets everything--and the pressure in your gut blossoms into a bubbling heat as " + (player.cocks[0].cockLength > 10 ? "you bottom out" : "your hips meet her own") + ".");
		outputText("[pg]Her tail wraps tighter around you as she cries out, body trembling as her walls clench around you, the warm, wet grip making your [if (hasballs) {balls|[cockplural]}] ache as she desperately tries to draw out your cum. Your hands dig into her flesh as you thrust into her, burying yourself one last time before you explode inside your daughter. The first of your seed is met with a [say: Yes!] as she grinds back against you, trying to draw out as much as she can.");
		outputText("[pg][if (cumhigh) {It never seems to end, your body showing no signs of stopping even as your cum bubbles out of her [if (cocks > 1) {holes}] and drips to the ground.}] Finally [if (cumhigh) {even}] you reach your limit, your movements growing more shallow until you just rest inside her warmth, the two of you breathing hard and awash in the afterglow. She's the first to shift, turning until her [helspawneyes] eyes catch your own. [say: I love you, [Dad].]");
		outputText("[pg]A shiver runs through her body as you pull out and help her up, and she quickly takes the opportunity to steal a kiss, seemingly unconcerned about tasting herself. [say: And I'll be waiting for you [if (hours < 19) {tonight|tomorrow}], [Daddy].]");
		outputText("[pg][Helspawn] [if (!isnaked) {watches your every move as you dress yourself and}] pouts when you ruffle her hair, though that only manages to make her look more adorable when she wishes you [if (hours < 19) {goodbye|good night}].");
		player.orgasm('Dick');
		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnSlutsexYuri():void {
		clearOutput();
		outputText("Caught off-guard, you slip further under your daughter's spell, your body trapped between the sweetness of her lips and the playful touch of her tail. Her hands press on your [if (tallness < 78) {shoulders|sides}], keeping you steady at the [if (cor < 25) {flustering|heavenly}] sensation of her tongue finding your own, each kiss filled with all of your little girl's love. Clinging tighter to her, you savor the warmth of [if (hasplainskin) {your skin against her own|your [skindesc] against her skin}], letting her salamander heat caress your entire body with the softness of an afternoon breeze.");
		outputText("[pg]When she does pull back, her lips flutter across your cheek in a brief farewell before she looks [if (tallness < 78) {down|[if (tallness > 74) {straight|up}]}] at you, her eyes " + (flags[kFLAGS.HELSPAWN_DADDY] == 0 ? "shimmering like molten gold" : (flags[kFLAGS.HELSPAWN_DADDY] == 2 ? "filled with a verdant calmness that belies her ragged breaths" : "filled with an inner fire")) + ". They call out to you, your daughter already trembling beneath your fingertips as you trace up her sides, and she swallows hard when your hands finally come to rest atop her ribs. Even her tail stills, its presence ticklish against your [if (isnaga) {serpentine half|[if (isgoo) {slime|thighs}]}] as you move inward, following the gentle curve of her breasts. The faintest brush over her nipple leaves her squirming, and it's all too apparent that [helspawn] needs her [daddy]'s tender care.");
		outputText("[pg]So you oblige, glancing one last time into her eyes before leaning in, your daughter sighing in satisfaction as soon as your lips find her neck. A shiver runs through her [if (hasfangs) {at the gentle scrape of your fangs along her sensitive skin, before you take it|the moment you take her sensitive skin}] into your mouth, and each heated kiss makes her squeeze you even tighter, not stopping until her claws [if (isgoo) {sink into|sting against}] your back. Ever since [if (helspawnvirgin) {she [if (allowchild) {was a little girl|stepped into adulthood}]|the last time}], you've dreamed of this moment, and now, wrapped in her embrace, each of your senses filled entirely with her, it truly is as wondrous as you [if (helspawnvirgin) {imagined|remembered}].");
		outputText("[pg]Her hot breath washes over you as you slide away just enough to see her flushed face, [helspawn] so needy for her [daddy] that she's already leaning towards you, her lips brushing against your own. They're so soft, so close that it'd be effortless to take and enjoy them once more.");
		outputText("[pg]The slightest shift is all you need to feel her warmth again, and you gladly seize the opportunity. Being with your daughter just feels so right, [if (cor < 25) {no matter|and who cares}] what anyone else thinks. The two of you share a bond " + (flags[kFLAGS.HELSPAWN_DADDY] == 0 ? "that goes beyond" : "that might as well be") + " blood, the kind of connection that thrums in your veins as her lips instinctively part for you. This time there's nothing innocent, only the full passion of your little girl as she tastes you with a fervor you [if (helspawnvirgin) {can barely believe|could never forget}].");
		outputText("[pg]Yet her desire only seems to grow stronger, especially when she [if (biggesttitsize < 1) {places a hand on your chest, teasing one of your nipples between her fingers|cups one of your breasts, teasing the nipple between her fingers}] and your body shivers from her touch. [if (cor < 25) {It's a little embarrassing|You've no shame in showing her}] how much she affects you, how much even the lightest caress makes you want her to explore every inch of you until she knows you as well as she knows herself. Anticipation races through you when she breaks the kiss, trailing lower along your [skindesc] until she's level with your [chest], every exhale blissfully hot.");
		outputText("[pg]The first touch of her tongue makes your breath catch in your throat, her saliva tingling as it cools against your sensitive nipple. Barely a moment later you slip into the warmth of her mouth, your daughter gently suckling [if (islactating) {as your milk starts to flow[if (ischild) {, much to her surprise}]|despite you having nothing to give}]. [if (allowchild) {Like this, it's almost as though you're still holding your cute little salamander girl, running your fingers through her hair as she drinks her fill. }]A shift from [helspawn] [if (allowchild) {draws you back to the present|catches your attention}], and you can't help but notice how her motions grow more intense [if (islactating) {as she drinks the first drop|as though will alone could make it flow}].");
		outputText("[pg][if (islactating) {[say: Delicious.] }]She hums in approval as her fingers massage your other breast, wanting to share her love. [say: But there's [if (islactating) {more|still other parts}] of [Daddy] I want to taste.]");
		outputText("[pg]Her tail flits against your entrance again, and [helspawn]'s smile only grows wider as you shudder in response. [say: Please, [Daddy].]");
		doNext(helspawnSlutsexYuri2);
	}

	public function helspawnSlutsexYuri2():void {
		clearOutput();
		outputText("Your hands on her head are all the answer she needs, your daughter's fingertips gliding down your sides as she moves lower, not stopping until she kneels [if (singleleg) {before you|between your legs}]. Her lips tickle across your stomach and further down your [skinshort] before coming to a hesitant, teasing stop, her eyes " + (flags[kFLAGS.HELSPAWN_DADDY] == 0 ? "glimmering with mischief" : (flags[kFLAGS.HELSPAWN_DADDY] == 2 ? "full of life" : "blazing with passion")) + " as she glances up into your own.");
		outputText("[pg]But only for a second, before she ducks down and her breath washes over you, your fingers winding through her hair as hers run up your thighs. Your entire body aches for your daughter's touch, hot and flushed and positively throbbing by the time her lips brush over your [clit] and give it a gentle kiss. She holds [if (singleleg) {you|your legs}] tighter as her tongue traces around your lips, lapping up every drop of your [if (vaginalwetness > 2) {abundant}] arousal.");
		outputText("[pg][if (helspawnvirgin) {The realization that it's truly|The sight of}] your own daughter between your thighs seems like something out of a fever dream, but looking down at [if (cor > 66) {her slavish devotion fills you with a sense of [paternal] pride|her tender affection makes it hard to believe this is anything but right}].");
		outputText("[pg]Your grip grows a little firmer, and she immediately understands, your body trembling as she rises ever-so-slightly and draws you between her lips. The sultry heat of her mouth steals your breath away, and you almost miss her hands moving until your folds part around her fingertip, sinking [if (lust > 66) {eagerly|[if (vaginalwetness > 2) {effortlessly}]}] into your depths. And maybe it's a bit unbecoming of a [father] to fall apart so easily under [his] little girl's touch, but it's so hard to care about anything beyond the fullness inside you and the way her tongue flickers against your needy clit.");
		outputText("[pg]She brushes just the right spot, and you groan, clinging tighter to her even as it feels like the ground might fall away. She must sense that you're close, her thrusts growing faster and faster as she eases in a second--or is it the third?--finger. They fill you, and that's all that matters now as she pulls you over to the edge. Each touch and every lick make the world shrink farther into foggy bliss, and you can't stop--she doesn't stop--as it overwhelms you.");
		outputText("[pg]Your body shudders and shivers, a sweaty mess clenching around your daughter's hand and throbbing in your little girl's mouth, and you wouldn't change it for the world. Especially when she slows and each lazy suckle of your [clit] sends tingles [if (isgoo) {throughout you|up your spine}], her [helspawneyes] eyes absolutely radiant as she looks up at you. The love and adoration shining back at you [if (helspawnvirgin) {lifts a weight off your shoulders, knowing [helspawn] feels the same as you|is just as stunning as it was the first time you saw it and makes you feel [if (cor < 25) {grateful|proud}] to have such a wonderful daughter}].");
		outputText("[pg]After caressing you one last time, she slides her fingers out and gives your clit a final kiss before rising. Even though it's barely been a few seconds, you already [if (lib > 50) {crave|miss}] her touch.");
		outputText("[pg][say: I love you, [Dad].] Her voice is but a whisper, her lips close enough to taste.");
		player.orgasm('Vaginal');
		menu();
		addButton(0,"Kiss", helspawnSlutsexKiss).hint("Return her affection.");
		addButton(1,"More", helspawnSlutsexMore).hint("You could go another round [if (lib < 25) {for her}].");
		addButton(2,"Finish", helspawnSlutsexFinish).hint("That's enough.");
	}

	public function helspawnSlutsexKiss():void {
		clearOutput();
		outputText("You cross the distance effortlessly, her breaths quickening in the brief moment before your lips meet again. They're still as soft as ever, your daughter's familiar flavor now mixed with your own as proof of your love.");
		outputText("[pg][say: I could taste you all day,] she says, each word fluttering against your [skindesc] as your imagination runs wild. [say: If you'd let me.]");
		outputText("[pg][if (lib > 50) {You just might.|The hunger in her eyes makes you think you might not have much choice.}]");
		helspawnSlutsexFinish(false);
	}

	public function helspawnSlutsexMore():void {
		clearOutput();
		outputText("[if (lib > 50) {But you still need more, so you take her hands and pull her on top of you, uncaring of the ground digging at your back.|But she deserves more, so you take her hands and lead her to your [cabin], pulling her on top of you as you lie on the [bed].}]");
		outputText("[pg][if (lib > 50) {[say: All you had to do was ask, [Daddy],]|[say: You don't need to worry about me so much, [Daddy],]}] she says, idly rolling your nipple between her fingers. [say: [if (lib < 25) {But}] I'm always ready for you.]");
		outputText("[pg][if (lib > 50) {As are you, especially|It's hard not to be}] with your daughter this close, your [skindesc] slick with her sweat and the air tinged with her arousal. None of that is enough, though--right now, you ache for her taste, filled with the need to slip your tongue between her folds and drink in every inch.");
		outputText("[pg]Her content smile turns curious when you ask her to turn around, but she seems to catch on quickly when you grab her hips, sliding her up your body until you can feel her heat on your face. Already she glistens for you, your breath washing over her folds as she presses back, desperate for your lips. It only [if (cor < 25) {makes her more beautiful|turns you on more}] to see your little girl so worked up for her [daddy], and with barely a moment's hesitation, you reach in to claim them for yourself.");
		outputText("[pg][if (helspawnvirgin) {Your first taste of your daughter is incredible|Every time tastes better than the last}], and you soon find yourself teasing apart her lips, eagerly drawing out more of her flavor. [Helspawn] reacts instantly, her thighs squeezing down on you as your tongue slips inside, and just when you think she's forgotten about you, the warmth of her breath shudders across your [clit]. Then comes a gentle lick that makes you jerk up into her, and it's hard not to laugh yourself when her giggles flutter across your [skindesc].");
		outputText("[pg][say: Sorry, [Dad],] is what she finally manages to say, but you really hope she isn't. You don't think you could forgive her--no, you don't think you could even [i:[if (singleleg) {get up|stand}]]--if she were to stop now.");
		outputText("[pg]But she doesn't, and neither do you, [father] and daughter locked together in familial love, shuddering as your lip brushes her clit and her fingers trace your sensitive [skinshort]. A whimper escapes her, and you press in deeper, every shift of her body and clench of her muscles filling you with satisfaction. Your sweet little [helspawn] [if (cor < 25) {deserves|has earned}] every second of this, and the way you can feel her breath quicken when your tongue twirls around her clit sends shivers down your [if (isgoo) {back|spine}].");
		outputText("[pg]Her own motions grow more erratic, her hands gripping harder around [if (singleleg) {you|your thighs}] when you take her between your lips, until she can soon do little more than pant against you. She's hot and throbbing in your mouth as she trembles in your arms, and barely a moment later her body tightens as she screams out your name for " + (camp.getCampPopulation() == 2 ? "her " + player.mf("", "other ") + "mother" : "all of your camp") + " to hear.");
		outputText("[pg][if (cor < 25) {A flicker of embarrassment creeps|A prideful warmth swells}] through you for an instant, though it's quickly forgotten when your dutiful daughter turns her attention back to you. The heat of her ragged breath alone makes you tremble, and it takes all your restraint not to cry out into her depths when one of her fingers slips inside and finds your favorite spots with [if (helspawnvirgin) {well-remembered|familiar}] care. Still, you hold on, savoring her taste as you clean your daughter and loving the way she shivers when you brush her sensitive clit.");
		outputText("[pg]It seems like she's determined to give you your release, her legs holding you in place as she thrusts deeper into you, even as her own body wobbles with every caress of your tongue. Heat swirls through you, pooling in your gut while she shakily suckles on your [clit], but you grit your teeth and continue. Her shudders and muffled moans keep you going as you trace around her entrance before sinking inside, drinking up every bit of her. Yet the fire can be contained no longer, raging through you and setting every [if (isgoo) {inch of you|nerve}] alight as you clench down on your little girl's hand. [Helspawn] trembles against your lips before her legs give out, leaving the two of you trapped in a sweaty, flushed embrace as you go over the edge together.");
		outputText("[pg]You take a breath, not sure if you can manage anything else. Then again, you doubt you could find any better place than right here, your daughter lying atop you, her breathing gentle against your [skindesc]. She's content to just let you stroke her soft skin as the two of you quietly recover, her tail draped limply over your head.");
		outputText("[pg]Eventually she manages to roll--or flop, you suppose--beside you, cuddling into your back with her salamander warmth. [say: Thanks, [Daddy].]");
		outputText("[pg]As much as you'd like to stay here all [day], you still have [if (hours < 19) {things to do|to get some sleep}], so it's with great reluctance that you help her up and head back to your duties.");
		player.orgasm('Vaginal');
		helspawnSlutsexFinish(false);
	}

	public function helspawnSlutsexFinish(clear:Boolean = true):void {
		if (clear) clearOutput();
		else outputText("[pg]");
		outputText("[Helspawn] wraps you in her arms before you can [if (singleleg) {shift|step}] away.");
		outputText("[pg][say: " + (flags[kFLAGS.SLEEP_WITH] != "helspawn" && flags[kFLAGS.SLEEP_WITH] != "salamanders" ? "I hope " : "") + "I'll see you again [if (hours < 19) {tonight|tomorrow}], [Daddy].] Her lips brush against your cheek [if (isnaked) {as she whispers in your ear,|before she hands you your [armor].}] [say: I'll be waiting...]");
		outputText("[pg]With that thought to fill your mind, she drapes her chain bikini over her shoulder and heads off, leaving you to [if (!isnaked) {dress yourself and}] go about your [day].");
		flags[kFLAGS.HELSPAWN_HADSEX] = 1;
		doNext(camp.returnToCampUseOneHour);
	}

	public function helspawnSurprise():void {
//		saveContent.surprised = true;
//		registerTag("helspawnsleep", flags[kFLAGS.SLEEP_WITH] == "Helspawn");
		if (!flags[kFLAGS.HELSPAWN_INCEST] || player.isGenderless()) helspawnSFWSurprise();
		else if (player.hasCock()) player.hasVagina() && rand(2) == 0 ? helspawnFemaleSurprise() : helspawnMaleSurprise();
		else helspawnFemaleSurprise();
	}

	public function helspawnSFWSurprise():void {
		clearOutput();
		var badCookingTasted:Boolean = rand(2)==0; //dont want to add saveablestate now...
		outputText("The smell of something delicious draws you out of your sleep, and you open your eyes to some sort of tray, perched on a pair of [helspawnscales]-scaled hands. It wobbles ominously when [helspawn] first notices that you're awake, but she thankfully manages to get it under control before it winds up on your face.");
		outputText("[pg]Though if the scent is anything to go by, that might not be that terrible.");
		outputText("[pg][say: Good morning, [Dad],] she says, and it's hard not to notice the excitement in your daughter's eyes. Try as you might, you can't think of an occasion that would warrant this--not that you mind.");
		outputText("[pg][say: It's nothing special.] [Helspawn] turns a little red as she continues. [say: Just a surprise for " + player.mf("the world's best dad.", "one of the world's best moms.") + "]");
		outputText("[pg]You can't help but swell with pride at that, but your stomach has different ideas. It already grumbles in complaint, eager to taste what she brought, and she graciously obliges by setting the tray at the edge of your [bed]. Six vaguely heart-shaped pieces of meat await you, still steaming, and [helspawn] [if (!helspawnchaste) {blushes fiercely|smiles wider}] when she notices you looking.");
		outputText("[pg][if (!helspawnchaste) {[say: I... thought it might be cute,] she manages to mumble out, and you pull your flustered daughter into a hug.|[say: Enjoy, [Daddy]!] she says, already bounding over to give you a hug.}] Though you try to thank her for making you breakfast, she insists [if (!helspawnchaste) {that it isn't necessary, though she can't hide her growing smile|you have to try it first}]. [if (helspawnchaste) {Which isn't a problem, as you|You}] don't think you can resist temptation much longer[if (!helspawnchaste) {, and you aren't at all surprised to catch her sneaking a peek when you move to take one}].");
		outputText("[pg][say: " + (followerKiha() ? "I had to ask Aunt Kiha for help" : "I don't really know what I'm doing") + ",] she admits, and " + (badCookingTasted > 1 ? "you're immediately glad you took the time to tutor the dragoness" : (badCookingTasted ? "your guts immediately quiver, already dreading choking this down" : "you tell her if that it tastes as good as it looks, you doubt you would ever want to eat anything else")) + ".");
		outputText("[pg]You " + (badCookingTasted == 1 ? "anxiously" : "eagerly") + " bring a piece to your lips, " + (badCookingTasted == 1 ? "trying not to taste whatever she's created. Taking a deep breath, you swallow it whole, and much to your surprise, it's actually edible. No, [i:delicious], even. You eagerly take a second bite, smiling at [Helspawn] as she watches." : "savoring the taste of your little girl's gift. It's as delicious as you expected, and [helspawn] watches with excitement as you take another bite."));
		outputText("[pg][say: How is it?] It's the best thing you've ever eaten, you tell her" + (badCookingTasted == 1 ? ", trying to keep the surprise out of your voice" : "") + ", and she [if (!helspawnchaste) {looks away|giggles}] in response. [say: Thanks, [Daddy].]");
		outputText("[pg][if (!helspawnchaste) {Seeming thoroughly embarrassed by|Seemingly satisfied with}] your approval, [helspawn] wishes you a good [day] as she heads out of your [cabin], leaving you with your breakfast. [say: See you [if (helspawnsleep) {later|around}], [Dad].]");
		outputText("[pg]It doesn't take long to finish off the rest of them, leaving you full and delightfully warm as you start your day. [if (!helspawnchaste) {As you pick up the tray, you spot a flask of Helia's finest, tied up in a familiar pink ribbon. Maybe she wanted you to enjoy your meal, no matter how it tasted?}]");
		doNext(playerMenu);
	}

	//Tracks the most recent option take for scene transitions. 0 = no choice yet, 1 = oral, 2 = vaginal, 3 = anal, 4 = tail
	private var helspawnMaleSurpriseLastChoice:int = 0;
	public function helspawnMaleSurprise():void {
		clearOutput();
		outputText("Your daughter's in your dreams again, [if (helspawnsleep) {because even though she's right beside you, sleep can't shake your thoughts away from your little girl.|and it only makes your [bed] seem that much colder, knowing that you're actually alone.}] Still, her [if (!helspawnchaste) {seductive|most innocent}] smile, the one she only shows you when she [if (!helspawnchaste) {slides her hand around|shyly holds}] your [cock], fills the entirety of your mind, and right now that's more than enough. A slight squeeze from her [if (!helspawnchaste) {skilled|soft}] fingers has you hardening in her grip, your whole body relaxing as it sinks deeper into the fantasy.");
		outputText("[pg][Helspawn] glances up at you now, her [helspawneyes] eyes filled with [if (!helspawnchaste) {desire|curiosity}] as she glides along your length, watching your every twitch with a [if (!helspawnchaste) {knowing|worried}] smile. Once she finally makes it to her destination, a lonely fingertip traces around your head and brushes across the tip, wicking away the first bead of arousal. She tastes it, of course, [if (helspawnchaste) {hesitation briefly crossing her face as your flavor lingers on her tongue, before she's }]barely able to stop herself from leaning in and drinking from the source.");
		outputText("[pg]Her [if (!helspawnchaste) {laughter seems|nervous giggles seem}] to sit inside your ear, and you stir from your sleep, the warmth of the morning sun nothing compared to the heat running beneath your [skinshort]. With a sigh, you stretch and push back the blankets. It always ends before the best part, doesn't it?");
		outputText("[pg]A shiver runs through your body, and you're sure you didn't imagine the softness tracing along your thigh.");
		outputText("[pg][say: Good morning, [Daddy].]");
		outputText("[pg]Your eyes open at the sound of your daughter's voice, and to your surprise, she's [if (helspawnsleep) {not in your [bed], but|next to your [bed],}] [if (builtcabin) {standing|kneeling}] [if (!helspawnchaste) {not-so-}]innocently beside your half-erect [cock]. Your sleep-addled mind doesn't get much time to ponder this situation, however, before she crawls on top of you, already trailing hot kisses up your [chest]. As heavenly as her lips feel on your [skindesc], it's the gentle flick of her tail against your sensitive shaft that truly catches your attention. You can't even be sure it's intentional[if (!helspawnchaste) {--never mind, you definitely can--|, }]but the heat curling around your cock quickly has you [if (hasplainskin) {flushed|tingly}] and ready to go.");
		outputText("[pg][Helspawn] [if (!helspawnchaste) {smiles|gasps in mock surprise}] when she slides backwards and finds something delightfully hard. [say: [if (!helspawnchaste) {Are you that eager for me, [Daddy]?|It's so warm, [Daddy].}]]");
		outputText("[pg]And she's right, but you don't tell her that. Instead, you gently lift her chin and claim your daughter's lips, letting her familiar flavor wash over you. Her warmth fills you with her inner fire as she eagerly reciprocates, deepening the kiss and letting her tongue slip across your own. Her [if (!helspawnchaste) {passion|softness}] comes as no surprise, and you could easily lose yourself in her lips were it not for the subtle brush of skin-against-[skinshort] and the heavenly pressure of her thighs sliding around your [cock]. A little squeeze takes your breath away, your shaft already hot and throbbing against her silken grip. Every caress of her lips flies past in a flash, your mind too focused on the rhythmic pleasure [if (singleleg) {encompassing your groin|between your legs}].");
		outputText("[pg]You hardly even notice her pull away until her radiant [helspawneyes] eyes catch yours. [say: [if (!helspawnchaste) {Where should we start, [Dad]?|Let me know what you'd like, okay?}]]");
		//Future proofing for repeats
		helspawnMaleSurpriseLastChoice = 0;
		menu();
		addButton(0,"Oral", helspawnMaleSurpriseOral);
		addButton(1,"Vaginal", helspawnMaleSurpriseVaginal);
		addButton(2,"Anal", helspawnMaleSurpriseAnal);
		addButton(3,"Tail", helspawnMaleSurpriseTail);
		addButton(4,"Cum", helspawnMaleSurpriseCum);//.disableIf(!silly());
	}
	//Handles transitions between scenes
	public function helspawnMaleSurpriseTransitions(prev:int, curr:int):void {
		var variations:Array = [];
		switch(prev) {
				//First time intros
			case 0:
				variations = ["[say: [if (!helspawnchaste) {I've been waiting all morning to taste you.|I think I can manage that.}]] Her slick folds brush tantalizingly against you as she crawls down your body, coming to rest [if (isnaga) {atop your tail|[if (isgoo) {in your slimy base|between your legs}]}].",
					"[say: [if (!helspawnchaste) {Now that's what I want to hear.|Ah...}]] [if (!helspawnchaste) {She wastes no time bounding up and positioning herself above you, eager to get started.|Despite her unsure response, she's clearly just as excited as you, the arousal glittering on her [helspawnscales] scales proof enough of that.}]",
					"[if (!helspawnchaste) {[say: I'd love to try that.] With that, she rises, giving the object of your desires a little wiggle before sitting down atop your [cock]. [say: Don't keep me waiting, [Daddy].]|Your daughter's eyes widen in surprise when you tell her what you'd like, but she doesn't seem against it. The gentle sway of her hips while she walks down your body seems proof enough of that--and she can't deny the arousal smeared across your [skindesc] when she lowers herself beside your [cock]. [say: Be gentle, okay?]}]",
					"[if (!helspawnchaste) {[say: I didn't know you were into that, [Daddy].] The ominous whip-crack of her tail against your [bed] makes you quickly clarify just [i:what] exactly you meant. [say: Aww...]|[say: M-my tail?] [Helspawn] seems a bit confused at first, but as you slide her fiery tail against your [cock], she quickly understands. [say: I'll make you feel good, [Daddy].]}]",];
				outputText(variations[curr - 1]);
				break;
				//Transition from oral
			case 1:
				outputText("Not wanting this to end quite yet, you stroke her cheek to catch her attention. [Helspawn] glances up, [if (!helspawnchaste) {her half-lidded eyes clearly still dreaming about your [cock]|in evident confusion}]. [say: [if (!helspawnchaste) {Mmm... what is it?|Is something wrong, [Dad]?}]]");
				outputText("[pg]You tell her your desires and she [if (!helspawnchaste) {smiles|nods}]. [if (!helspawnchaste) {[say: Well, what are we waiting for?]|[say: I'll do my best.]}]");
				outputText("[pg]It's hard to contain your excitement as she gets up and " + (curr == 4 ? "sits on your chest" : "lowers herself above your cock") + ".");
				break;
				//Transition from vaginal
			case 2:
				variations = ["and guide her downwards until her lips rest on your cock, [helspawn] apparently more than eager to taste herself.", "", "and line it up with her other entrance, [helspawn] already shivering with anticipation.", "and pull her upright, letting her fiery tail drape around your cock. [if (!helspawnchaste) {[say: Oh?] She wiggles her hips, brushing it against you with all the false innocence she can muster, and you're sure she knows exactly what you want.|She seems a bit unsure but nods when you tell her exactly what you'd like her to do.}]"];
				outputText("Your daughter whimpers in your ear as you slide your shaft out from her silken folds ");
				outputText(variations[curr - 1]);
				//Transition from anal
			case 3:
				variations = ["help her down until her lips brush across your twitching [cock].", "line yourself up with her glistening lips.", "", "let her tail flop against your [cock]. [if (!helspawnchaste) {[say: Oh?] She wiggles her hips, letting it brush against you, and you're sure she knows exactly what you want.|She seems a bit unsure but nods when you tell her exactly what you'd like her to do.}]"];
				outputText("Your daughter releases a shaky breath as you slowly ease your way out of her depths and ");
				outputText(variations[curr - 1]);
				break;
				//Transition from tail
			case 4:
				outputText("There's still more you'd like to do, so you catch your daughter's attention, trying to calm yourself down as her tail slowly unwinds from around you. Not a second later she stands and " + (curr == 1 ? "settles between your thighs" : "lowers herself above your cock") + "[if (!helspawnchaste) {. [say: I hope you're ready for this, [Dad].]|, shivering with barely contained excitement.}]");
				break;
		}
		//Tracking for the next scene
		helspawnMaleSurpriseLastChoice = curr;
		//Enable Cum after at least one option has been selected
//		button(4).enable();
	}
	public function helspawnMaleSurpriseOral():void {
		clearOutput();
		helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice, 1);
		outputText("[pg]The unsteady breath fluttering up your thighs gives a hint of just how eager she is, but you're still not quite prepared for [if (hasballs) {the warm, wet heat of her mouth enveloping your [balls]|the first long lick that swirls around the base of your [cock].}] Beneath every gentle stroke there's a hunger [if (!helspawnchaste) {you can't imagine|you've never seen before}], and as she pulls away from your sensitive [skinshort] with a sloppy, loving kiss, you've no doubt she's [if (!helspawnchaste) {[if (libido > 50) {your|Hel's}] little girl after all|been waiting for this moment for a long time}]. Her lips trace up the underside of your shaft before you even have time to recover, but it's the first touch of her tongue to your head that leaves you squirming for more.");
		outputText("[pg][if (!helspawnchaste) {You're sure she notices, but|If she notices,}] she doesn't care, content to twirl around the tip until you're glistening with her saliva. Only the first drop of your arousal manages to get her to stop, your daughter eagerly [if (!helspawnchaste) {slurping it up|tasting it}] before working her way back down to the base. Once there, [helspawn] glances up at you, [if (!helspawnchaste) {making sure that you're watching|silently asking for praise}] as she rises up until her tongue flutters across your slit.");
		outputText("[pg]The anticipation is almost too much to bear, but your daughter thankfully [if (!helspawnchaste) {isn't one to hold back either, eagerly|relents,}] parting her lips just enough to wrap around the head of your [cock]. A hand wraps around your base, steadying your [if (cocklength > 10) {impressive size|twitching shaft}], and surrounded as you are by her heavenly warmth, you're quickly reduced to little more than a [if (isgoo) {sticky|sweaty}], shivering mess. Your [if (isgoo) {whole body throbs|blood pounds in your ears}] as her tongue massages your most sensitive spots, slowly inching lower until the entirety of your length disappears between her lips. [if (cocklength > 10) {You're not sure how she managed that, but then again you don't really care when her throat tickles against the head.}]");
		outputText("[pg]Her tongue curls around you, the wet, insistent pressure threatening to break your resolve. Buried in her mouth like this, you feel yourself twitching, your body instinctively wanting to go deeper and fill her--but [helspawn] caves first, pulling away from you and gasping for air. The cold kiss of the morning air on your slick cock makes you shiver, but your attentive daughter quickly takes notice, her breath hot against you as she slathers you with warmth.");
		outputText("[pg]Her mouth parts again, though you're not sure how much longer you can hold out...");
		dynStats("lus", 20);
		addButtonDisabled(0, "Oral", "You've already done this.");
	}
	public function helspawnMaleSurpriseVaginal():void {
		clearOutput();
		helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice, 2);
		outputText("[pg]You're not sure you can think of many things better than the sight of your own daughter slowly sinking down until her lips brush against the head of your [cock], but the hot, wet heat washing over you as her juices trickle down your shaft might well be one. Her folds gently part as she slips lower, kissing you repeatedly as she [if (!helspawnchaste) {smiles at you, clearly loving how you squirm with every contact. Just when you're about to pull her down yourself, your breath dies in your chest as she slams herself down on your length.|prepares herself, evidently a bit unsure about [if (cocklength > 10) {your size|herself}]. When she finally works up the nerve, she eases you inside, unable to hold back her moans as you fill her completely.}]");
		outputText("[pg]Once you're buried inside her, both of you take a moment to catch your breath. [Helspawn] glistens with sweat, her palms slick atop your [chest] as she braces against you, and you don't miss the opportunity to claim her mouth again. The first brush of your tongue against hers makes her shudder, but it doesn't take long before she's [if (!helspawnchaste) {setting the pace|able to keep up}]. Each kiss is firm and needy, and as your daughter drinks deeply of your lips, something seems to [if (!helspawnchaste) {snap|awaken}] inside of her when she settles on your [cock].");
		outputText("[pg]And this new [helspawn], thrusting wildly down on you with enough force to [if (builtcabin) {make the bed creak|wake your camp}], quickly has you panting in delight. Every motion sends shivers through you, her silky walls rubbing and gripping your [cock] incessantly while she rides you like [if (!helspawnchaste) {a berserker possessed|she's been waiting years for this}]. Her own cries--little whimpering whines, gasping breaths, and the throaty moan of a salamander who hit just the right spot--echo through your [cabin], sweet in your ear.");
		outputText("[pg]But you couldn't be any quieter if you wanted, with the way her tail lashes your [if (singleleg) {[skindesc]|legs}] as she spears herself on your [cock] again. Her inner walls clench down on you, trying their hardest to claim your seed, right before her body gives out and she slumps onto your chest, breathing heavily. Her arousal hangs in the air and drips onto your [bed] as you take up the reins, grabbing her hips and pulling her down on your length. Still her trembling folds milk you, squeezing you with a slick embrace that threatens to suck the cum right of [if (hasballs) {your [balls]|you}].");
		outputText("[pg]There's still a chance to pull out, but you're not sure how much longer you have...");
		dynStats("lus", 20);
		addButtonDisabled(1, "Vaginal", "You've already done this.");
	}
	public function helspawnMaleSurpriseAnal():void {
		clearOutput();
		helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice, 3);
		outputText("[pg]Trying to take it slow, you settle for only pressing the tip against her, [if (!helspawnchaste) {teasing her with the hint of penetration|making sure she's relaxed before you continue.}] A bit farther and you meet resistance, so you stroke [helspawn]'s thighs and whisper reassurances to your little girl, sliding in just enough so she can grow accustomed to your cock inside her. Though she's still a bit [if (!helspawnchaste) {too eager to get started|nervous}], your words help calm her down enough for you to carefully ease into her depths.");
		outputText("[pg]As your [cock] slowly disappears inside her, she [if (!helspawnchaste) {throws her head back|shivers}] in delight. The hot grip of her walls squeezes around you, and it takes everything you have not to start thrusting in earnest, but you content yourself with the sensation of your shaft being massaged with her soothing salamander heat. As incredible as she feels around you, you still have to pace yourself, so you take the opportunity to check up on your daughter.");
		outputText("[pg][if (!helspawnchaste) {Which proves to be unnecessary, as the question barely leaves your mouth before she grinds against you and steals your breath away.|[say: I... like it,] she finally manages to get out between little gasps of pleasure.}] Taking that as encouragement, you [if (cocklength > 10) {bury yourself as deep as you can|hilt yourself inside her}], your daughter's [if (!helspawnchaste) {moans|sweet sounds}] filling the air when her fingers find her clit. Her wetness splashes down on your [skindesc] as your hands find her hips, helping her gently ride you, and your slow, shuddering motions quickly turn to full-on thrusts.");
		outputText("[pg]As tight as she is, every bounce feels like she's milking you, your [if (hasballs) {[balls]|cock}] already pulsing with pent-up seed. [Helspawn] also seems to be close, [if (!helspawnchaste) {vigorously fucking herself|furiously rubbing her clit}] as you pound into her, drowning out her cries with the sloppy sound of [if (hasplainskin) {flesh|[skindesc]}]-on-flesh. You fear she might [if (builtcabin) {break the bed|hurt herself}] as she slams down on your [cock] [if (cocklength > 10) {until she's completely filled|to the base}], but your worries are quickly forgotten as her walls clench around you, their slick heat almost too much to bear.");
		outputText("[pg][Helspawn] doesn't let up, still grinding against you, even as her body trembles around your length. Your sight grows hazy, and you're not sure how much longer you can last...");
		dynStats("lus", 20);
		addButtonDisabled(2, "Anal", "You've already done this.");
	}
	public function helspawnMaleSurpriseTail():void {
		clearOutput();
		helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice, 4);
		outputText("[pg]Blissful heat washes over you as her tail grows warmer and warmer, and though the sight of flames creeping ever closer to your [cock] is a bit frightening at first, you know your daughter would never hurt you[if (!helspawnchaste) {--unless you asked}].");
		outputText("[pg][say: [if (!helspawnchaste) {What do you think?|How is it?}]]");
		outputText("[pg]You try to respond, but the tip of her tail brushing across your [if (hasballs) {[balls]|head}] soon has you groaning in satisfaction. Seemingly pleased with your answer, [helspawn] wraps it around the base of your [cock], gently squeezing down on you with a breathtaking heat. [if (hastail) {As you're well aware|Somewhat surprisingly}], it's almost as dexterous as her hand, tickling the underside of your shaft just enough to make you squirm.");
		outputText("[pg]And her actual hands are already [if (isflat) {roaming up your chest|cupping your breasts}] as your daughter leans in, her [helspawneyes] eyes watching your every shudder. You're sure she notices your breath quicken as her tail coils around your length, a faint smile crossing her face before she starts to move it in earnest, and each stroke caresses you with the same gentleness as her own fingers. It's slow and light, almost teasingly so, and you want nothing more than to take matters into your own hands and thrust your hips against her.");
		outputText("[pg]You relent, though, letting [helspawn] do as she pleases and lazily trace her tail along your [cock]. A little squeeze around the head gets your attention as she cleans away your arousal before dipping back down to the base and surrounding you with her fiery warmth. Whenever you think you've figured out her technique, she mixes it up, gripping you harder, or hotter, or faster, but your daughter always comes back to the ones that make you tremble the most.");
		outputText("[pg]It's a little embarrassing how intently she's studying you, but you're more than willing to put that aside for how quickly she's learning just what your [cock] needs. Despite her barely touching you, your [skinshort] already tingles with arousal, and with every passing second the pressure in your [if (hasballs) {balls|cock}] seems to grow, your body eager for release. [if (hasballs) {They throb|It throbs}] when she tightens around you, fire filling your [if (isgoo) {core|veins}] as the strokes of her coiled tail milk you with all the heat and hunger of her inner walls.");
		outputText("[pg]If you don't stop her now, you're not sure how much more you can take...");
		dynStats("lus", 20);
		addButtonDisabled(3, "Tail", "You've already done this.");
	}
	public function helspawnMaleSurpriseCum():void {
		clearOutput();
		switch (helspawnMaleSurpriseLastChoice) {
			case 0:
				outputText("Before you can decide, her thighs tighten around you and begin sliding up and down your length. Her softness combined with that salamander heat feels wonderful on your [skinshort], and you quickly realize just [i:how] wonderful when you twitch in her grip, already close enough to the edge that you can't go back. This--your daughter--is too much, your head falling against the pillow as the rush of release crashes over you. All you can do is hold on to your little girl as your [if (balls) {[balls] shudder|[cock] shudders}] one last time, spraying your seed all over her legs[if (cumhighleast) {and the [bed]}].");
				outputText("[pg][Helspawn] glances back in confusion, though her expression quickly turns [if (!helspawnchaste) {amused|sympathetic}] when she discovers what just happened. [say: [if (!helspawnchaste) {I didn't know you liked me that much, [Daddy].|It's okay, [Dad].}]]");
				outputText("[pg]Flushed from your release--and quite a bit of shame--you turn away from your daughter's gaze, [if (!helspawnchaste) {though you can still see her grin in your mind|despite her attempts to comfort you}]. [if (!helspawnchaste) {Apparently content that she's teased you enough|Taking the hint}], she picks herself up, [if (!helspawnchaste) {slips on her bikini|gathers her clothes}], and leaves you alone to wallow in your embarrassment.");
				if (flags[kFLAGS.SLEEP_WITH] == "Helspawn") outputText("[pg]Tonight is going to be awkward.");
				break;
			case 1:
				outputText("...But there's nowhere you'd rather be, already sighing in bliss as she slips your cock between the softness of her lips. You thrust your hips, sinking further into her, but she doesn't seem to mind. Instead, she gently [if (hasballs) {caresses your [balls]|strokes you}], her hands working their hardest to make you give up your seed. Your vision trembles with every touch of her fingertips, and gripping the [bed] is all you can do as she slowly descends, enveloping your entire being with her soothing heat.");
				outputText("[pg]You can see the end approaching and don't hold back, reaching over to pull her down to the base of your [cock]. [if (!helspawnchaste) {Her tail thrashes in excitement|She squeaks in surprise, but doesn't resist}] as you bottom out inside, your throbbing shaft her only warning of what's to come. It doesn't take long before you succumb to your lust and send your first shot splattering down her throat, but your daughter [if (!helspawnchaste) {doesn't budge|manages to hang on}] as you fire more and more into her waiting mouth. By the time you're done, it's [if (cumhighleast) {pooling on top of|leaking out of her and onto}] you, and you collapse back into the pillows, trembling from exhaustion.");
				outputText("[pg]Not [if (!helspawnchaste) {one to let it go to waste|wanting her [Daddy] to be dirty}], [helspawn] slips away from your still-twitching cock, [if (!helspawnchaste) {eagerly|dutifully}] lapping up all your spilled seed.");
				outputText("[pg][if (!helspawnchaste) {[say: Nothing beats [Dad]'s cum for breakfast.]|[say: Was it what you wanted, [Daddy]?]}] Your daughter kisses the head one last time before you pull her on top of you, relaxing in her comforting warmth.");
				break;
			case 2:
				outputText("...Not that you care. This is where you belong, buried in your daughter's depths as you throb with need, unwilling and unable to hold back. She shudders in your grip as you use her body like a toy, slamming her against your [skindesc] as you burn with pleasure. You're lost in the heavenly heat of your little girl, thrusting as deep as you can before you finally explode inside her. Your head rolls back as your seed splatters against her walls, and it feels like the [if (builtcabin) {bed|floor}] falls away as your orgasm continues, your [if (hasballs) {balls|[cock]}] continuing to empty [if (hasballs) {themselves|itself}] into her until your entire body aches. The two of you cry out in harmony, and you lean back, exhausted.");
				outputText("[pg]Without your support, [helspawn] collapses forward, landing gracelessly on your [chest] and still shaking against your sensitive [skinshort]. For a moment, she looks up at you in a daze, but a [if (!helspawnchaste) {huge|shy}] smile creeps across her face as you stroke her hair.");
				outputText("[pg][if (!helspawnchaste) {[say: Fuck, [Dad]. We're definitely doing that again.] Not right now, you hope--but she only|Your daughter turns " + (helspawnScales() == "red" ? "as red as her scales" : "bright red") + " when she meets your eyes, but silently}] nuzzles into your chest, wrapping her arms around you as the two of you bask in the afterglow.");
				break;
			case 3:
				outputText("...But why would you stop? Your daughter's ass grips you like a velvet glove, every thrust into her depths making you lose yourself more and more to the blissful heat of her inner walls. They caress the head of your [cock] as she sinks down again, and you're already throbbing with need as you pull her hips [if (cocklength > 10) {as far as they'll go|to your own}], no longer able to hold back. The two of you tremble against one another as you fire your first spurt deep inside her guts, letting your love for your daughter overwhelm you. [Helspawn]'s every twitch seems to draw more and more out of you, until she's [if (cumveryhigh) {unable to hold your entire load inside.|[if (cumhigh) {stuffed|filled}] with your seed}].");
				outputText("[pg]Your last shot comes as barely a dribble by the time your orgasm winds down, your entire body tingly and warm as your daughter slumps forward onto your [chest]. You can't help but feel proud of your little girl, wrapping her in your embrace as she takes a well-deserved rest.");
				break;
			case 4:
				outputText("Eager to experience this unusual sensation, you remain silent and give yourself over to the mercy of your daughter's tail. As if reading your desires, it instantly winds around your entire length, warm and slick with your own arousal. The anticipation hangs over you like a hot, heavy cloud, and it's hard to hold yourself back as [helspawn] looks deep into your eyes.");
				outputText("[pg][say: Let me see you cum, [Daddy].]");
				outputText("[pg]You don't have any choice in the matter, unable to do anything beyond pulsing helplessly in her grip as her tail slowly starts to move. Merely faster at first, but your daughter soon envelops you with a heavenly heat that makes [if (singleleg) {you shiver|your legs weak}], speeding up more and more until her strokes rise to a furious pace that leaves you panting, desperately close to the edge. [Helspawn] doesn't blink as your [cock] twitches within her tail, and then with one last squeeze, you let go.");
				outputText("[pg]Your hips tremble and thrust into her grip, spraying your seed all over her scales while your daughter continues to coax out as much as she can. She deserves everything, so you give it to her, emptying [if (hasballs) {your [balls]|yourself}] across her sticky tail, until you lie back exhausted. Yet still she strokes you, milking your sensitive shaft until another shock runs through you, your last spurt of cum splattering against her before you collapse against the pillow, completely spent.");
				outputText("[pg][Helspawn] takes a moment to [if (!helspawnchaste) {lick herself clean|clean herself off}] before leaning into your [chest] and wrapping her arms around you.");
				break;
		}
		if (helspawnMaleSurpriseLastChoice > 0) helspawnSurpriseEnd(2);
		cheatTime(2);
		doNext(playerMenu);
	}

	public function helspawnFemaleSurprise():void {
		clearOutput();
		outputText("You wake up, glancing around your [if (builtcabin) {bedroom|tent}] in the muffled morning light. Despite the ever-present sun, today seems darker than usual, and it's a struggle to even make out the [if (builtcabin) {far|tent}] wall from your [bed]. You can't be that tired, can you?");
		outputText("[pg]A quick rub of your eyes--or an attempt to, at least--confirms that's not the case. A soft, pinkish cloth covers your vision, but before you can consider that any further, [helspawn]'s voice flutters against your ear in a low, [if (!helspawnchaste) {sultry|flustered}] tone, the kind that can only mean you'll enjoy whatever she has planned.");
		outputText("[pg][say: Good morning, [Daddy].]");
		outputText("[pg]And how could it not be, when but a second later your daughter's lips, soft and warm, press lightly against your neck. They trail lower, whispered promises brushing across your sensitive [skinshort] every time they touch, and you can only tilt your head back, silently begging for more as she traces out your collarbone. The warmth of your daughter's love fills every kiss, and each slow, deliberate breath full of the affection she doesn't waste words to show. It's as if she's only a stray touch, only the merest brush of your lips against hers from throwing aside the blankets and sating both your desires with that salamander [if (!helspawnchaste) {ferocity|passion}] you've come to love.");
		outputText("[pg]Not that you would mind, [if (!helspawnchaste) {and you [i:know] she knows it, but|but she's never been quite like this before, and}] this uncharacteristic, [if (!helspawnchaste) {tender|unstoppable}] desire only makes you want her more.");
		outputText("[pg][say: [Dad],] she finally gets out, and the breathy exhale that follows tells you more than any word could express. As does the faint rustle from her hand gliding down your body, the silky-softness of your bedsheets slowly replaced with cool air until your [skinshort] tingles from the heat of her palm seeping into your bare chest. Once there she simply pauses, silently [if (isflat) {[if (ischild && femininity > 50) {tracing out the barely visible swell of your developing body|drinking in the way she can surely feel every beat of your pounding heart beneath her fingers}]|running a finger along the [if (biggesttitsize > 8) {generous|gentle}] curve of your breasts}].");
		outputText("[pg]Still, she's kind enough to not leave you with nothing to touch, wrapping her hand around your own as she guides you up to her chest, her nipple hard between your fingers as you gently squeeze your daughter's [if (!helspawnchaste) {soft|naked}] flesh. [if (helspawnchaste) {Her bare skin comes as a surprise, and the|The}] little moan that slips out of her is mesmerizing, a sweet sound that lingers in your ears until her body shifts and the heat of her breath traces across your [skinshort], finally settling on your lips. The sudden contact makes you tremble, every part of you desperate to taste her, but the slightest flex of your muscles is met with a hand against your chest.");
		outputText("[pg][say: Not yet.] Both words brush against your lips, fleeting promises of the kiss that never comes. [say: [if (!helspawnchaste) {Just let me take care of you, [Daddy].|Today is all for you, [Daddy].}]]");
		outputText("[pg]Just the thought of her implications makes you grip the sheet a little tighter, and it takes all your willpower to remain still as she draws closer, stopping barely inches away. You can feel each breath washing over you, hot with her desire, and even imagining that warmth playing across your [skindesc] as she showers you with affection causes you to shiver. Maybe you've fallen too hard for her, you can only wonder, but as she [if (hashair) {brushes aside your hair|runs a finger down your cheek}] any doubt leaves your mind. Who else could ever love you like your own daughter?");
		outputText("[pg]The air shifts, and that alone is enough to send your stomach fluttering with anticipation of those soft, [if (!helspawnchaste) {fiery|passionate}] lips sinking lazily towards yours and claiming you with her forbidden desires. What would the people of Ingnam think if they could see you now, [if (ischild) {a child beneath [his] own child|under your own daughter}], sweat trickling down your body at the mere thought of tasting the full extent of her devotion? The brush of a thumb against your nipple makes it impossible to care, and you can actually feel her shudder as she draws closer, the remaining distance still seemingly an eternity away.");
		outputText("[pg]Her palm presses harder into your chest, and you barely keep your composure when [helspawn]'s lips finally flicker across yours. Their sweet gentleness quickly gives way to the frenzied pace of someone who's been holding back for ages, her hair tickling across your cheek as her tongue effortlessly slips inside and seeks out your own. She doesn't stop you this time when you shift, your arms mapping out the definition in her back as you pull her closer. This is where you belong, after all--tangled together with your daughter in a love that has no bounds.");
		outputText("[pg]She knows it too, tasting you deeper with a hunger that fuels your own in every kiss. Atop you she's truly alive, eagerly matching your enthusiasm as she traces out your tongue's every contour. Even when she breaks away for a second, your lips still tingling in absence of hers, you don't need to see her to picture that warm, content smile, still shining with love.");
		outputText("[pg]Another pause, and the sheets rustle again. This time they slide faster, care and caution lost to the need to feel you as her hands roam down your body. She seems to [if (hasscales || hasfeathers) {worship your every [if (hasscales) {scale|feather}]|caress every inch of your [skindesc]}] as her fingers wind their way across your body, her touch finally settling at your thighs just before [if (builtcabin) {the bed shifts and }]her weight presses down on you, your daughter now resting slick and wet atop your stomach. [Helspawn]'s breath catches when she slides forward, and her hands [if (isflat) {brace against your chest|cup your [breasts]}] as she finds your neck again.");
		outputText("[pg][say: [Daddy]...] She's scarcely able to get even that out between kisses, trailing them ever higher until a not-at-all innocent brush of her lips lingers on your cheek. [say: I love you.]");
		outputText("[pg]It's instantaneous, the way your body reacts to those words. From the flutter in your stomach, to the echo in your head, and all the way down to the heat pooling between your thighs, it feels like you've been wrapped up in a cloud of silky sweetness, lying warm and content beneath your daughter's touch. You almost wish you could stay here all day, but it seems [helspawn] has other plans, already [if (!helspawnchaste) {grinding|gliding}] her way down your to your hips. The tip of her tail [if (isgoo) {dips into your slime|tickles against your [if (isnaga) {sensitive underbelly|legs}]}] as she shuffles on top of you, but that brief warning does nothing to prepare you for its first [if (helspawnchaste) {hesitant}] brush against your [if (vaginalwetness > 2) {dripping|hot}] folds.");
		outputText("[pg]Nothing else comes. Only the breathless anticipation of her next touch remains to fill you, leaving you wanting for anything that might sate your desires. Not even her fingers faintly flickering across your thigh nor her sweet praises in your ear are enough to comfort you, and all you can do is reach out to her as you try to draw her back.");
		outputText("[pg]You almost miss the sound of her [if (builtcabin) {feet on|knees against}] the [if (builtcabin) {floor|ground}], but you could never miss the softness of her hands, gentle yet insistent on your [skinshort] as she [if (builtcabin) {slides you to the edge of the bed, letting your [if (isnaga) {tail|[if (isgoo) {slimy mass|legs}]}] dangle free|[if (isnaga) {slides up your tail until her breath flutters|settles [if (isgoo) {into your slimy embrace|between your legs}], her breath fluttering}] across your entrance}].");
		outputText("[pg][say: [if (!helspawnchaste) {Tell me how you want it, [Dad].|Let me know what you'd like, okay?}]]");
		menu();
		addButton(0,"Tribadism", helspawnFemaleSurprise2, 0);
		addButton(1,"Cunnilingus", helspawnFemaleSurprise2, 1);
		addButton(2,"Doesn't Matter", helspawnFemaleSurprise2, 2).hint("Let her do whatever she wants.");
	}
	public function helspawnFemaleSurprise2(choice:int):void {
		clearOutput();
		if (choice == 2) outputText("[say: Are you sure?] [if (!helspawnchaste) {Her mouth traces down your thigh, hot and wet, and for a second you fear she'll leave you like this.|She seems a bit uncertain herself.}] [say: In that case...]");
		else outputText("[say: [if (!helspawnchaste) {That's my favorite|I'll do my best for you}], [Daddy].]");
		outputText("[pg]Seemingly satisfied with " + (choice == 2 ? "her decision" : "your answer") + ", she inches closer and grips your thigh as she takes your lips between her own, letting every one of your shivers guide her pace. [if (wetness > 2) {Your [if (issquirter) {ever-flowing|copious}] arousal doesn't seem to faze [helspawn], your daughter already drinking up as much as she can before slipping her tongue inside for more.|Ever the attentive daughter, [helspawn] tends to your body's needs, slathering you with her saliva before slipping her tongue inside.}] Each gentle caress of your inner walls makes your stomach tighten, and you quickly realize that [if (helspawnchaste) {despite her apparent innocence,}] she already knows just what you like.");
		outputText("[pg]Not that it stops her from discovering more as she slowly, meticulously explores you, your daughter lavishing you with the attention she never fails to give. She lingers at the slightest shudder or the shallowest breath, as if memorizing everything you need all the way down to the gentle pressure of her thumb on your [clit]. A little needy moan slips out of you, and then comes a pause, all her motions stopping even as your [if (singleleg) {body|legs}] instinctively clench[if (singleleg) {es}] tighter to keep her inside.");
		outputText("[pg]Hot, unfulfilled, and desperate, you can do nothing but writhe for your daughter, wanting more than just the unsteady touch of her breath. You suppose " + (choice == 2 ? "this is what you asked for with your indecision" : "she never made any promises as to [i:when]") + ", after all, but you don't have much time to wonder about that before her tongue twirls around your aching clit, the wet, enveloping heat setting your body alight. Not content with just that reaction, though, [helspawn] wraps her hands around your thighs, [if (builtcabin) {pinning you beneath|holding you against}] her and ensuring you can't escape the softness of her lips. Every lick seems to pulse across your body, even though she never leaves your flushed folds.");
		outputText("[pg]They vanish just when you need them the most, leaving you with little more than a kiss tingling on your [skinshort], and you " + (choice == 2 ? "resign yourself to your fate of endless teasing, no relief in sight" : "try to stay calm, to little avail") + ". The sound of her shuffling as she [if (builtcabin) {guides you into the middle of the [bed], leaving you alone and untouched,|[if (isnaga) {works her way out of your coils|moves back}] and denies you her warmth}] sends a desperate shudder down your spine. She isn't actually going to leave you like this, is she?");
		if (choice == 0 || (choice == 2 && rand(2)==0)) {
			outputText("[pg]Thankfully, she's merciful enough to return, slipping her leg under[if (singleleg) {[if (isnaga) { your tail|neath you}]| your own}] and sliding closer until a steamy heat presses against your [skinshort], and the realization " + (choice == 2 ? "of what" : "that") + " [if (helspawnchaste) {your sweet little [helspawn] is|she's}] about to do " + (choice < 2 ? "what you asked " : "") + "makes it hard to even breathe. Her first shift doesn't take her far before her hands clasp around your own, her body already quivering on top of you, and that's one of those moments that reminds you she's still your little girl, all enthusiasm and inexperience.");
			outputText("[pg]She makes no effort to move, so you try to do the same, not wanting to rush her. Once she's ready, even the first tentative thrust of her hips fills the air with a cute little gasp, and as she glides against you, hot and slick on your [skindesc], you can hardly believe she's doing this all for you. And she definitely [i:is] doing this, her initial awkwardness [if (!helspawnchaste) {quickly|eventually}] fading as she grows more comfortable. The next time she moves you barely have a chance to catch your breath before your daughter [if (!helspawnchaste) {slides down your thigh, panting heavily before she|laughs nervously and}] pulls you into her.");
			outputText("[pg]The whole world seems to tighten, coiling inside your gut as [helspawn]'s fiery, wet heat rests firmly on your own. Not grinding against you, not yet. Not even relenting and shifting just enough to envelop your throbbing [clit] in the warmth of her folds. Instead she merely sits, perched on you like she belongs there--you'd not have her any other way--and the anticipation alone knocks the air out of your chest.");
			outputText("[pg]A single fingertip trails down your stomach, dipping lower for but a second, and that's all it takes for your hips to buck impatiently, smearing your arousal all along her skin. A flash of embarrassment surges through you at reacting to your daughter so desperately, but she seems to not mind, [if (!helspawnchaste) {immediately|cautiously}] picking up the pace, every roll of her hips filling [if (builtcabin) {the room|your tent}] with [helspawn]'s wavering cries. They alone give you something to ground yourself on as the warmth inside you burns higher with each brush of your [clit].");
			outputText("[pg]She's so lost in pleasure that she barely even notices when you wrap your arms around her, her sweat slick under your fingers and thick in the air. But you need to feel her all the same, so you pull her trembling body tighter and let her shivers ripple through you with each thrust. As soon as you do, she presses down even harder, whimpering into you as she hits a spot that reminds you just how close you are.");
			outputText("[pg]To your relief, she doesn't stop, her tail thrashing against [if (isnaga) {yours|[if (isgoo) {you|your legs}]}] as her hand creeps down to your clit. [Helspawn]'s dizzying scent tickles against your nose as the pressure of her fingers and her body seems to wrap you up into a tight ball, your daughter with you every step of the way. It feels like the [if (builtcabin) {bed|ground}] fades into the distance as your muscles tense up beneath her, and all you can do is cling to [helspawn] and tremble into her as everything blurs into little more than her cries in your ear, her breath on your [skindesc], and the gentle heat that crashes over every inch of you. Each shiver echoes between the two of you until you finally settle on just holding her, unable to muster up the energy to do anything else. Even now you can barely believe that you were able to share this moment with your little girl, and you can only sigh and stroke her back when her claws dig into your [skinshort] to remind you she's still there.");
			outputText("[pg]Eventually your breathing slows, and she relaxes in your arms, cuddling into your chest when you finally let her go. You'd be content to lie here with her for as long as she likes, but then there's a shift, her lips sweet on your own as she pulls the veil off your eyes and slips back.");
			outputText("[pg]There's not a sight in the world you'd rather see than your daughter draped across you, flushed and smiling as you steal another kiss.");
		}
		else {
			var hole:String = (player.hasVirginVagina() != player.ass.virgin ? (player.hasVirginVagina() ? "[asshole]" : "[vagina]") : randomChoice("[asshole]", "[vagina]"))
			outputText("[pg]Instead, her lips tickle against your stomach, and you let out a sigh of relief as they slowly work their way up to your [chest]. She doesn't seem to mind when you reach out, letting your fingers trace across her ribs as you pull her closer. Her warmth settles on top of you, a constant, comforting pressure as she draws your nipple into her mouth and gently rolls it around her tongue. Further down, the blanket rustles, and you scarcely have time to run your hands through her messy hair before her smooth scales press against your entrance and send shivers down your spine. No matter how much you try to hide it, though, she knows you too well for that, and as she grinds her thigh against you, you give up all pretense of restraint and hold her to you while she lazily covers every inch of your [if (isflat) {[if (ischild && femininity > 50) {budding breasts|chest}]|breasts}] with hot, wet kisses[if (isflat && ischild && femininity > 50) {, uncaring of how sensitive they are}].");
			outputText("[pg]Beneath her seemingly endless affection and the rhythmic circling of her scales on your [clit], it's hard to concentrate on anything but the hazy waves of pleasure rolling across your [skinshort] with her every touch. Desperate for more, you pull her tighter, squeezing your daughter into a not-at-all [father]ly embrace and searching for the release that never comes.");
			outputText("[pg][say: Let me,] she says, and this time when she finds your lips, you can sense the hunger beneath the kiss and feel it in the way she crawls back down your body, stroking your [skindesc] with her fingertips before [if (singleleg) {[if (isnaga) {something warm and slick settles on your tail|she settles in your slime}]|spreading your legs apart}].");
			outputText("[pg]The girl [if (singleleg) {straddling you|between your thighs}] is [if (helspawnchaste) {your innocent little [helspawn]|your own daughter}], and [i:that] thought makes your pulse quicken almost as much as the heat of her breath on your throbbing clit, her tongue tracing closer and closer to what you need most. Knowing she wants you just as much as you want her has your [skinshort] tingling, and it feels like you're completely coated in [if (wetness > 2) {your own juices|her saliva}] by the time she finally, [i:finally] relents and takes you between her lips, letting her salamander warmth wash over you.");
			outputText("[pg]The soothing heat seems to take your strength away, your head falling back in pleasure as she leisurely rolls her tongue around your [clit]. She's not content with just that response, though, and you soon feel something soft pressing against your " + hole + ", gently teasing you open as she eases her way inside.");
			hole == "[asshole]" ? player.buttChange(3, true) : player.cuntChange(3, true, true);
			outputText("Every caress of your walls makes you tremble in her mouth, your daughter doing her best to keep you calm until her finger sinks completely into your depths. Your body clenches around the sudden fullness, trying its hardest to pull her deeper and feel even more of her, but to no avail.");
			outputText("[pg]Instead she helps you, slowly sliding out until her fingertip just brushes your entrance before slipping back inside. Her tongue twirls across your clit as she thrusts, and being so thoroughly cared for by [helspawn] quickly has you flushed and aching, your hands gripping the blankets as your [if (isnaga) {tail curls around her waist|[if (isgoo) {gooey body feels like it's falling apart|legs wrap around her}]}]. She doesn't seem to react, too focused on bringing you to the brink as she explores your " + hole + " with her careful touch, eagerly searching for the spots that leave you quivering underneath her.");
			outputText("[pg]When she finds one, the darkness before you bursting to white, she never lets up, hurling you over the edge as she suckles on your [clit] and massages your inner walls. She doesn't stop even as you clench down on her, throbbing in her mouth and around her finger when the pressure breaks and a hazy heat washes over you. Even while you spasm helplessly beneath your daughter, her lips only leave you for the briefest moment before they dip lower, tracing all along your folds and lapping up every drop of your arousal. As sensitive as you are, each lick only makes you shudder again, but [helspawn] shows you no mercy, her lavish attention fading to slow, gentle kisses once she deems you fully cleaned. You grip the [bed] harder as she works her finger out of your " + hole + ", the comfortable fullness fading to a tingling void when she pulls away at last.");
			outputText("[pg]Eventually your breathing slows, and she crawls on top of you, collapsing [if (isflat) {onto your chest|into your [breasts]}], your heart surely pounding in her ears. You'd be content to lie here with her for as long as she likes, but then there's a shift, her lips sweet on your own as she pulls the veil off your eyes and slips back.");
			outputText("[pg]There's not a sight in the world you'd rather see than your daughter draped across you, flushed and smiling as you steal another kiss.");
		}
		helspawnSurpriseEnd(choice == 2 ? 1 : 0);
		doNext(playerMenu);
	}

	//To avoid repeated text. 0 = female, cared; 1 = female, didn't care; 2 = male
	public function helspawnSurpriseEnd(version:int):void {
		outputText("[pg][say: I love you, [Daddy].] A content sigh slips out of her as you run your fingers through her sweaty, messy hair, her [helspawneyes] eyes shining brilliantly as she glances into yours. [say: How was it?] she finally stumbles out[if (!helspawnchaste) {, and that's about the last thing you ever thought you'd hear from her}].");
		outputText("[pg]" + (version == 0 ? "You did ask for that, after all, and it was everything you wanted" : (version == 1 ? "[if (!helspawnchaste) {You'd expect nothing less from your little girl|You never expected her to do that, but it was definitely worth it}]" : "It was everything you asked for")) + ", you tell her, and her smile grows even wider. You almost think she's about to say something in reply, but instead she wraps her arms tighter and snuggles against your chest, content to share her warmth with you. But you still have to start your day, so after resting with her awhile, you softly stroke her cheek until she awakes.");
		outputText("[pg][say: [if (!helspawnchaste) {Hm? Well, try not to think about me [i:too] much today|Sorry for keeping you so long}].] [Helspawn] reluctantly rises, her tail tickling your [skinshort] as you stand beside her. [if (isnaked) {[if (!helspawnchaste) {The two of you glance at each other for a second before she shrugs and|You wait for your daughter to get dressed before she}]|The two of you quickly dress yourselves before she}] takes your hand, walking out of your [cabin] alongside her [father].");
		outputText("[pg][say: [if (helspawnsleep) {I'll see you tonight|Don't keep me waiting}], [Daddy].]");
	}

	public function helspawnDrinkKidAJuice():void {
		clearOutput();
		outputText("While strolling through camp, you notice [helspawn] hunching over a water barrel, " + (!helspawnChastity() ? "sipping from it" : "dipping a cup inside") + ". Though at first you think little of the sight, a surprised yelp reminds you just what purpose that particular barrel now serves. [Helspawn] stumbles over backward, splashing some water over herself as she hits the ground.");
		outputText("[pg]Kid A peeks her head up out of the water, looking slightly shaken herself. You start [walking] over, listening to their exchange as you approach. [say: S-sorry! I didn't know you lived there,] [helspawn] stammers. Kid A simply mutters a bit, perhaps embarrassed at being caught unawares.");
		outputText("[pg]At your arrival, [helspawn] shifts her attention. [say: Oh, hey [dad]!] she says, reaching out to your [hand] for help up. [say: I think I picked the wrong barrel for a drink...]");
		outputText("[pg]The little anemone, now emboldened by your presence, speaks up, [say: It's okay.] Kid A pulls herself up and out of the barrel, standing close to you as she confronts the towering " + helspawnScales() + " salamander. Seldom get more than a single word from her at a time, how remarkable.");
		outputText("[pg][Helspawn] kneels down, setting a hand on the anemone's tentacle-draped head. [say: Sorry for surprising you like that, I'm glad you're so friendly about it,] she says, before pulling her twitching fingers up from the tendrils. You briefly explain to her that anemones have stingers that immobilize prey, though Kid A likely didn't mean to do that. [Helspawn] chuckles awkwardly. [say: N-no harm done, right? That wears off quickly?]");
		outputText("[pg]Kid A anxiously shakes her head up and down, assuring the salamander that it won't last long. Though the interaction has been a little less than stellar, they seem to understand each other at least. [Helspawn] wanders off to make sure she washes all the toxin off her hand, and Kid A grabs you for some reassurance she didn't mess up here. Of course, you assuage her worries and let her go back to relaxing in her barrel.");
		doNext(playerMenu);
	}

	public function sleepWithHelspawn():void {
		clearOutput();
		if (flags[kFLAGS.SLEEP_WITH] == "Helia") {
			outputText("While you already share your [bed] with Helia at night, it might be nice for all three of you to sleep together. You are a family, after all. You suggest to [helspawn] that it could be enjoyable for all three of you to stay in your [cabin] and she [if (!helspawnchaste) {grins approvingly.|smiles happily.}]");
			outputText("[pg][say: [if (!helspawnchaste) {Really, [Dad]? You want us all to sleep together? Well... alright then, that could be nice.[if (helspawnincest) { Especially if things get a bit steamy.}]|Sleep with both of you? That sounds like it would be a really good time. I enjoy the time we spend together as a family very much. I'd love to, [Daddy].}]] [if (!helspawnchaste) {[if (helspawnincest) {She uses her fiery tail to deliver a quick slap to your rear and moves in to kiss you. [say: I'll be there tonight, [Dad],] she says with a wink.|She gives you a brief hug and flashes you a smile. [say: Looking forward to it, [Dad].]}]|[if (helspawnincest) {She hugs you tightly and kisses you firmly on the lips. [say: Looking forward to tonight, [Dad].]|She hugs you tightly and smiles. [say: I can't wait, [Daddy].]}]}]");
			outputText("[pg]Looks like from now on your [cabin]'s going to be filled with double the salamanders. It'll certainly be a good way to keep warm at night. [if (helspawnincest) {Especially knowing how these two can be.}]");
			flags[kFLAGS.SLEEP_WITH] = "salamanders";
		}
		else if (flags[kFLAGS.SLEEP_WITH] == "Helspawn" || flags[kFLAGS.SLEEP_WITH] == "salamanders") {
			outputText("You tell [helspawn] that you'd prefer to sleep seperately for now. [if (helspawnchaste) {She looks at you with sad eyes before averting her gaze. [say: Alright then. I hope it's not because I did anything wrong. If you want me back anytime just let me know, okay?] She looks at you again and you lovingly hug her. She returns the embrace tightly before the two of you seperate once more.|She looks at you with a bit of a confused expression. [Really? Shame, I sleep better when it's with you, [Dad]. Ah well, just let me know if you want me back in your [bed] any time.]}]");
			flags[kFLAGS.SLEEP_WITH] = flags[kFLAGS.SLEEP_WITH] == "salamanders" ? "Helia" : "";
		}
		else {
			outputText("You ask [helspawn] if she would like to start sleeping in your [cabin] with you at night. [if (helspawnchaste) {She perks up and looks at you with a smile. [say: Really, [Dad]? Of course, I'd love to.]|She cocks an eyebrow and gives you a slight smirk. [say: Sure, [Dad]. That sounds like it might be a nicer way to spend the night.]}]");
			outputText("[pg][if (helspawnchaste) {Your daughter grins and hugs you tightly, visibly happy that you want to spend your nights with her instead of anyone else. Returning the embrace, you simply remind her of your love for her. [say: I love you too, [Dad].] She seperates from you with a wide smile, waiting for what you have to say next.|Your daughter steps close to you and places her hands on your hips while wearing a mischievous look on her face. [say: Just try not to mind if I ever feel like more than just sleeping with you.] You tell her that you wouldn't expect her to be so boring as to only fall asleep, you helped raise her after all. [helspawn] simply chuckles and seperates from you, waiting to hear what else you have to say.}]");
			flags[kFLAGS.SLEEP_WITH] = "Helspawn";
		}
		doNext(helspawnsMainMenu);
	}

	public function helspawnSleep():void {
		switch (rand(4)) {
			case 0:
				outputText("You enter your [cabin] and see that [helspawn]'s got to bed before you. [if (helspawnchaste) {She's laying on her back, seemingly waiting for you to come to bed. Smiling when she sees you, she relaxes a bit as you get ready. You crawl [if (builtcabin) {into|onto the}] [bed] and snuggle in close to her, giving her a kiss on the nose as she wraps an arm around you. The two of you remain closely cuddled up until you finally drift off to sleep, the comfort of her body against yours making it all too easy.|She's laying on her side and eyeing the entrance, seemingly waiting for you to come to bed. Smiling when she sees you, she motions for you to lie down next to her. After briefly getting ready, you do exactly that. Once you're [if (builtcabin) {in|on the}] [bed], she immediately presses her naked body against you, kissing you on the lips before wrapping an arm around you. It doesn't take long at all for her to fall asleep, arm still loosely draped over your body. It's comfortable, at least. And it's not long at all before you find yourself drifting off as well.}]");
				break
			case 1:
				outputText("You enter your [cabin] just after [helspawn], both of you crawling [if (builtcabin) {into|onto the}] [bed] at the same time. She faces away from you, and you gently curl up against her. [if (helspawnchaste) {[say: Goodnight, [Dad]. Love you.] After replying with the same sentiment, you lean forward to kiss her neck. You snuggle in extra close to her, and it's not long before the both of you nod off.|[say: Love you, [Dad]. Sleep well.] You reply with the same sentiment, and she [if (haslegs) {moves her tail to rest in between your legs. It's almost like having a pillow between them.|drapes her tail over your lower body.}] You wrap an arm around her and place a [hand] directly on her bare breast as you snuggle in closer. She giggles and gives you a teasing smack to your rear with the tip of her tail before the two of you relax, soon nodding off together.}]");
				break
			case 2:
				outputText("You enter your [cabin] to see that [helspawn] is [if (builtcabin) {in|on the}] [bed] [if (helspawnchaste) {and reading under a dim light. You get ready and lie down next to her, looking to her book to see what she's reading. It doesn't seem like anything particularly special, but you're glad she's enjoying a good hobby like this. You snuggle up to her bare body as she continues reading, your eyes soon getting heavy before you drift off to sleep.|and masturbating wildly. Before you get the chance to do anything at this sight, you hear her quietly moan as her toes curl and her body trembles. Seems like you got here just in time to catch her in the act. You get ready for bed and she looks at you with wide eyes and red cheeks. [say: You could have warned me before you came in! I mean, I know it's you, but it's still embarrassing to be walked in on!] You lie down next to her and ruffle her hair, simply telling her that you enjoyed the show. She blushes even harder and rolls to the side. Amused at the sight, you wrap an arm around her and soon fall asleep.}]");
				break
			case 3:
				outputText("You enter your empty [cabin] and take your time getting ready for bed, waiting a few minutes for your daughter before deciding to just lie down on your [bed] alone. After a short bit, you feel your eyelids begin to feel heavy. However, just before you drift off you hear someone enter your [cabin]. You hear a bit of quiet rustling from them, and soon they join you on the [bed]. Just as one might expect, you feel [helspawn] press her body up against yours and wrap one of her scaled arms around you, squeezing you tight. [say: [if (helspawnchaste) {Goodnight, love you.|Night, [Daddy]. Seeya tomorrow.}]] She kisses your neck and nuzzles her head against you, only for you to fall asleep very soon after.");
				break
			default:
		}
		outputText("[pg]");
	}

	public function helspawnWakeUp():void {
		clearOutput();
		switch (rand(3)) {
			case 0:
				outputText("As the morning sun shines into your [cabin], your eyes open, and you notice something of an earthy scent in the air. As you begin to stir, an already awake [helspawn] rushes over to you with two cups full of something that seems to be the source of the aroma. She sits down next to you and hands you one of the cups.");
				outputText("[pg][say: [if (helspawnchaste) {Good morning! Here you go, I made some herbal tea for us. I've been gathering herbs here and there lately, the kind that I hear people use in drinks a lot. I think I've got something here that tastes pretty alright, too.|Hey there, good to see you're awake. I made a bit of herbal tea for us. I was looking into herbs that people use for drinks, and gathered some that I thought we'd like. It's not really my thing, but I put a little something extra in it to wake us up.}]] Might as well try it. You take a sip, and [if (helspawnchaste) {it tastes earthy. Very earthy. But pretty flavorful even so. Whatever she put in this works well enough for a morning drink. You compliment her on the tea and she smiles happily as she takes a sip of her own.|can immediately tell that she spiked this with a bit of her alcohol. But even so, the herbs she used in it definitely aren't bad at all. In fact, it's a fairly tasty drink. And you can tell there's definitely not enough alcohol in this to affect you at all. Overall, not a bad little beverage. You compliment her on the tea, and she just gives you a knowing smirk as she starts to down her own cup.}]");
				outputText("[pg]You finish your drink and then give [helspawn] a small pat on the head before getting up to get ready and head out for the day.");
				break
			case 1:
				outputText("The morning sun shines into your [cabin] and prompts you to slowly open your heavy eyelids. The first thing you see is [helspawn] looking at you with sleepy, yet adoring eyes.");
				outputText("[pg][say: [if (helspawnchaste) {Hey there. I haven't been awake long, myself. You just look so dreamy sleeping there, I couldn't help but stay here a bit. I love you lots, after all.|Heya, [Dad]. Nice to see you finally awake. There's just something about that sleeping face of yours that's simply hypnotizing, you know?}]] [Helspawn] gives you a [if (helspawnchaste) {slow and loving|quick but intense}] kiss, and starts to get up. It is morning now, after all. You get up as well and [if (isnaked) {get ready for your day|get dressed and ready for your day}], telling your daughter how you feel about sleeping with her as you do so. Once finished, you feel [helspawn] approach and hug you tightly from behind. The two of you stand with each other for a few moments, before she silently releases you to start your day.");
				break
			case 2:
				outputText("As the light from the sun wakes you, you notice something a bit strange. Somehow during your sleep, [Helspawn] managed to wrap her arms fully around your torso and her legs tightly around your [if (haslegs) {legs|lower body}]. Nothing wrong with being the little spoon, but you certainly don't remember going to sleep in a grip like this. It really is comfortable though. The soft skin of her body pressed up hard against your back, her smooth scaled arms and legs wrapped tightly around you, and the warmth of her body being so freely shared. It would be all too easy to just lay here like this all day. But you can't, you have things to do. Carefully as you can, you manipulate your daughter's scaly limbs so that they're no longer wrapped around you, and slowly get up.");
				outputText("[pg]Successful in escaping your daughter's loving embrace, you get up and start getting [if (!isnaked) {dressed and}] ready for your day, watching [helspawn] sleep soundly as you do. She could use a bit more rest, and she just looks so cute and comfortable in your [bed] like that. And so as quietly as you can, you exit your [cabin] to start your day.");
				break
			default:
		}
//		saveContent.wakeUp = false;
		doNext(playerMenu);
	}

	public function helspawnHeadpats():void {
		clearOutput();
		outputText("You tell [helspawn] that you'd like to show her some affection, and she immediately perks up[if (helspawnchaste) {, though a blush quickly rises to her face|, and she [if (helspawnincest) {eagerly begins pulling at the strap of her bra|gives you an amused but slightly raunchy look}]}]. You hastily clarify that that wasn't quite what you meant and receive a look of mild confusion in return, but your daughter still comes when you beckon her closer.");
		outputText("[pg]Understanding dawns on her face as your [hand] stretches out, and she falls silent as you make first contact. Her hair is silky [if (helspawnchaste) {and neat|but a bit messy}], and her body heat is noticeable even through her scalp. The pleasant warmth soothes you as you shift your fingers slightly to the right, and your daughter seems to relax just as much, letting out a light sigh as you get started.");
		outputText("[pg][if (tallness < 78) {It's a bit difficult with how tall she is, but your daughter bends her knees slightly to better accommodate your patting|Your impressive height makes reaching her head not a problem}]. You quickly settle into a steady pace, slowly stroking the salamander's hair and occasionally dropping down to caress her cheek. A brief brush against her " + (flags[kFLAGS.HELSPAWN_DADDY] == 2 ? "puppy-dog" : "fin-like") + " ear causes a low murmur to sound in her throat, so you go for a full-on touch and are rewarded with something that approaches a moan.");
		outputText("[pg]Your daughter's eyes close as she starts to really get into it, her cute little reactions a perfect metric for where best to touch. You briefly lose yourself in patting, both you and your daughter lulled into a state of pure serenity as you enjoy this moment together. Finally, you draw your hand back, satisfied that you've done a good job.");
		if (helspawnChastity()) {
			outputText("[pg]Her breathing hitches, and her eyes open a crack. [say:A-Are you done...?]");
			outputText("[pg]You are. She seems to overreact to this a bit, avoiding your gaze and shuffling her feet, so you ask her if she didn't like it, whereupon her eyes shoot up.");
			outputText("[pg][say:No, [Dad], I liked it! Sorry, I just... It was just a bit weird to be touched like that, that's all.]");
			outputText("[pg]Your daughter extends her arms somewhat awkwardly, but you gladly cross the distance, pulling her into a brief embrace. The salamander quickly loses her timidity, hugging you back at full force.");
		}
		else {
			outputText("[pg][Helspawn]'s eyes open drowsily. She blinks once. [say:Wait, was that it? Just pats?]");
			outputText("[pg]Just pats.");
			outputText("[pg][say:A-Are you sure? I'd kinda thought...]");
			outputText("[pg]You ask her if she didn't like it.");
			outputText("[pg][say:No, I did, but... Nah, never mind, I love you, [Daddy].]");
			outputText("[pg]She rushes forward and sweeps you up into a hug, nuzzling you a bit. [if (helspawnincest) {Her hands almost seem like they're about to start roaming, but she apparently manages to restrain herself in time|Her arms grip you tight enough that you briefly fear being crushed, but she quickly lets off enough that you can breathe}].");
		}
		outputText("[pg]Well, you're glad that's settled. You hold your daughter tight for a few moments before releasing her. She gives you a warm smile, waving at you as you depart from her presence.");
		doNext(camp.returnToCampUseOneHour);
	}
}
}