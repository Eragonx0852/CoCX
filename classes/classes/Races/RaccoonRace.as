package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

/**
 * Tier 1: raccoon-morph
 * Tier 2: tanuki
 * Tier 3: greater Tanuki
 */
public class RaccoonRace extends Race {
	public static const RaccoonFurColors:/*String*/Array = ["chocolate","brown","tan", "caramel"];
	public static const RaccoonHairColors:/*String*/Array = ["chocolate","brown","tan", "caramel"];
	
	public function RaccoonRace(id:int) {
		super("Raccoon", id);
	}
	
	public override function setup():void {
		addScores()
				.faceType(ANY(Face.RACCOON, Face.RACCOON_MASK), +2)
				.earType(Ears.RACCOON, +2)
				.eyeColor("golden", +1)
				.armType(Arms.RACCOON, +1)
				.tailType(Tail.RACCOON, +1, -1000)
				.legType(LowerBody.RACCOON, +1)
				.noWings(+2)
				.hasCock(+1)
				.furColor(ANY(RaccoonFurColors), +1)
				.hairColor(ANY(RaccoonHairColors), +1)
		addScoresAfter(1)
				.hasBalls(+1)
				.skinCoatType(Skin.FUR, +1);
		
		addMutation(IMutationsLib.NukiNutsIM);
		
		buildTier(8, "raccoon-morph")
				.buffs({
					"spe.mult": +0.90,
					"int.mult": +0.30
				})
				.end();
		
		buildTier(14, "tanuki")
				.require("big balls", function (body:BodyData):Boolean {
					return body.ballSize > 5
				})
				.buffs({
					"spe.mult": +0.90,
					"int.mult": +1.20
				})
				.end();
		
		buildTier(17, "greater tanuki")
				.requirePreviousTier()
				.buffs({
					"spe.mult": +1.05,
					"int.mult": +1.50
				})
				.end();
	}
}
}
