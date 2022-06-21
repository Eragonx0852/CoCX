package classes.Races {
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.Race;

public class RatatoskrRace extends Race{
	public static const RatatoskrHairColors:/*String*/Array = ["brown", "light brown", "caramel", "chocolate", "russet"];
	
	public function RatatoskrRace(id:int) {
		super("Ratatoskr", id);
	}
	
	public override function setup():void {
		
		addScores()
				.earType(Ears.SQUIRREL, +1)
				.eyeType(Eyes.RATATOSKR, +1)
				.eyeColor(ANY("green","light green","emerald"), +1)
				.faceType(ANY(Face.SMUG, Face.SQUIRREL), +1)
				.armType(Arms.SQUIRREL, +1)
				.tongueType(Tongue.RATATOSKR, +1)
				.legType(LowerBody.SQUIRREL, +1)
				.tailType(Tail.SQUIRREL, +1)
				.noWings(+1)
				.noRearBody(+1)
				.hairType(Hair.RATATOSKR, +1)
				.hairColor(ANY(RatatoskrHairColors), +1)
				.skinCoatType(Skin.FUR, +1)
				.furColor(ANY(RatatoskrHairColors), +1)
				.height(LESS_THAN(48), +1);
		//if (hasPerk(PerkLib.RatatoskrsDescendant) || hasPerk(PerkLib.BloodlineRatatoskr))
		//	ratatoskrCounter += increaseFromBloodlinePerks();
		
		addMutation(IMutationsLib.RatatoskrSmartsIM);
		
		buildTier(12, "squirrel")
				.namesTauric("squirrel-morph", "squirrel-taur")
				.buffs({
					"str.mult": -0.20,
					"spe.mult": +0.95,
					"int.mult": +1.05
				})
				.end();
		
		buildTier(18, "ratatoskr")
				.namesTauric("ratatoskr", "ratatoskr-taur")
				.buffs({
					"str.mult": -0.25,
					"spe.mult": +1.40,
					"int.mult": +1.55
				})
				.end();
	}
}
}
