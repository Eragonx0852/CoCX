package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.PerkLib;
import classes.Race;
import classes.StatusEffects;

public class SlimeRace extends Race {
	public static const SlimeSkinColors:/*String*/Array = ["green", "magenta", "blue", "cerulean", "emerald", "pink", "milky white"];
	
	public function SlimeRace(id:int) {
		super("Slime", id);
	}
	
	public override function setup():void {
		
		addScores()
				.skinColor(ANY(SlimeSkinColors), +1)
				.hairType(Hair.GOO, +1)
				.armType(Arms.GOO, +1)
				.legType(LowerBody.GOO, +3)
				.rearType(RearBody.METAMORPHIC_GOO, +2)
				.customRequirement("skin", "slimy goo skin", function (body:BodyData):Boolean {
					return body.player.isGooSkin() && body.skinBaseAdj == "slimy"
				}, +1)
				.customRequirement("vagina", "Vag of Holding",
						function (body:BodyData):Boolean {
							return body.player.vaginalCapacity() >= 9000;
						},
						+1)
				.hasStatusEffect(StatusEffects.SlimeCraving, "Slime Craving", +1)
				.hasPerk(PerkLib.SlimeCore, +1);
		
		addConditionedScores(function (body:BodyData):Boolean {
			return body.player.isGooSkin() && body.skinBaseAdj == "slimy"
		}, "slimy goo skin;")
				.faceType(Face.HUMAN, +1)
				.eyeType(Eyes.HUMAN, +1)
				.earType(ANY(Ears.HUMAN, Ears.ELFIN), +1)
				.height(GREATER_THAN(107), +1)
				.hasVagina(+1)
				.noAntennae(+1)
				.noWings(+1)
				.noGills(+1);
		
		buildTier(11, "slime")
				.namesMaleFemale("slime boi", "slime girl")
				.buffs({
					"tou.mult": +1.00,
					"spe.mult": -0.40,
					"lib.mult": +1.05
				})
				.end();
		
		buildTier(15, "slime queen")
				.buffs({
					"tou.mult": +1.15,
					"spe.mult": -0.50,
					"lib.mult": +1.60
				})
				.end();
	}
}
}
