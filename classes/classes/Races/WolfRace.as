package classes.Races {
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.PerkLib;
import classes.Race;

/**
 * Tier 1: wolf
 * Tier 2: winter wolf
 * Tier 3: Fenrir
 */
public class WolfRace extends Race {
	public function WolfRace(id:int) {
		super("Wolf", id);
	}
	
	public override function setup():void {
		
		addScores()
				.faceType(ANY(Face.WOLF, Face.ANIMAL_TOOTHS), +1)
				.eyeType(Eyes.FENRIR, +3)
				.eyeType(NOT(Eyes.FERAL),0, -11)
				.eyeColor("glacial blue", +2)
				.earType(Ears.WOLF, +1)
				.armType(Arms.WOLF, +1)
				.legType(LowerBody.WOLF, +1)
				.tailType(Tail.WOLF, +1)
				.skinCoatType(Skin.FUR, +2)
				.furColor("glacial white", +1)
				.hairColor("glacial white", +1)
				.wingType(Wings.NONE, +1)
				.rearType(RearBody.FENRIR_ICE_SPIKES, +6)
				.hasPerk(PerkLib.FreezingBreath, +3)
				.hasCockOfType(CockTypesEnum.WOLF, +1);
		buildTier(8, "wolf")
				.namesMaleFemaleTaur("wolf-boy", "wolf-girl", "wolf-taur")
				.buffs({
					"str.mult": +0.50,
					"tou.mult": +0.30,
					"spe.mult": +0.50,
					"int.mult": -0.10
				})
				.end();
		buildTier(10, "winter wolf")
				.namesMaleFemaleTaur("winter wolf", "winter wolf", "winter wolf-taur")
				.requireSkinCoatType(Skin.FUR)
				.requireFurColor("glacial white")
				.buffs({
					"str.mult": +0.65,
					"tou.mult": +0.40,
					"spe.mult": +0.55,
					"int.mult": -0.10
				})
				.end();
		buildTier(21, "Fenrir")
				.buffs({
					"str.mult": +1.45,
					"tou.mult": +0.70,
					"spe.mult": +1.00,
					"int.mult": -0.10
				})
				.end();
	}
}
}
