package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.PerkLib;
import classes.Race;
import classes.StatusEffects;

public class MagmaSlimeRace extends Race {
	public static const MagmaSlimeSkinColors:/*String*/Array = ["red", "orange", "reddish orange"];
	
	public function MagmaSlimeRace(id:int) {
		super("Magma Slime", id);
	}
	
	public override function setup():void {
		
		addScores()
				.skinColor(ANY(MagmaSlimeSkinColors), +1, -1000)
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
				.hasPerk(PerkLib.MagmaSlimeCore, +1);
		
		addConditionedScores(function (body:BodyData):Boolean {
			return body.player.isGooSkin() && body.skinBaseAdj == "slimy"
		}, "slimy goo skin;")
				.faceType(Face.HUMAN, +1)
				.eyeType(ANY(Eyes.HUMAN), +1)
				.earType(ANY(Ears.HUMAN, Ears.ELFIN), +1)
				.height(GREATER_THAN(107), +1)
				.hasVagina(+1)
				.noAntennae(+1)
				.noWings(+1)
				.noGills(+1);
		
		buildTier(13, "magma slime")
				.namesMaleFemale("magma slime boi", "magma slime girl")
				.buffs({
					"str.mult": +0.35,
					"tou.mult": +1.00,
					"spe.mult": -0.40,
					"lib.mult": +1.00
				})
				.end();
		
		buildTier(17, "magma slime queen")
				.buffs({
					"str.mult": +0.45,
					"tou.mult": +1.15,
					"spe.mult": -0.50,
					"lib.mult": +1.45
				})
				.end();
	}
}
}
