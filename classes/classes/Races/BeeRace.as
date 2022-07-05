package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.Transformations.GradualTransformation;

public class BeeRace extends Race {
	public static const BeeHairColors:/*String*/Array = ["shiny black", "brown", "yellow"];
	
	public const TfList:/*PossibleEffect*/Array = [
		game.transformations.HairChangeColor(BeeHairColors),
		game.transformations.BreastRowsRemoveToOne,
		game.transformations.AntennaeBee,
		game.transformations.EyesSandTrap,
		game.transformations.HornsNone,
		game.transformations.SkinPatternBeeStripes,
		game.transformations.LowerBodyBee,
		game.transformations.ArmsBee,
		game.transformations.NipplesPerBreastOne,
		game.transformations.OvipositorBee,
		game.transformations.TailBee,
		new GradualTransformation("BeeWings", [
				game.transformations.WingsNone,
				game.transformations.WingsBeeSmall,
				game.transformations.WingsBeeLarge
		]),
		game.transformations.GillsNone,
		game.transformations.CockChangeType(CockTypesEnum.BEE, false),
		game.transformations.RearBodyNone
	];
	
	public function BeeRace(id:int) {
		super("Bee", id);
	}
	
	public override function setup():void {
		addScores()
				.chitinColor(ANY("yellow and black","yellow and ebony"), +1)
				.eyeType(Eyes.BLACK_EYES_SAND_TRAP, +2) //po dodaniu bee tongue wróci do +1
				.antennaeType(Antennae.BEE, +1)
				.faceType(Face.HUMAN, +1) //ptem zamienić na specificzną dla pszczół wariant twarzy
				.noHorns(+1)
				.armType(Arms.BEE, +1)
				.legType(LowerBody.BEE, +1)
				.tailType(Tail.BEE_ABDOMEN, +1)
				.wingType(Wings.BEE_SMALL, +1)
				.wingType(Wings.BEE_LARGE, +4)
				.noRearBody(+1)
				.skinCoatPattern(Skin.PATTERN_BEE_STRIPES, +1)
				.hasPerk(PerkLib.BeeOvipositor, +1)
				.customRequirement("","vagina or bee cock",
						function (body:BodyData):Boolean {
							return body.hasVagina || body.player.beeCocks() > 0
						}, +1);
		
		addMutation(IMutationsLib.TrachealSystemIM);
		
		buildTier(8, "bee-morph")
				.buffs({
					"tou.mult": +0.40,
					"spe.mult": +0.40,
					"int.mult": +0.20,
					"lib.mult": +0.20
				})
				.withExtraBonuses("Min Lib +5")
				.end();
		
		buildTier(16, "elder bee-morph")
				.buffs({
					"tou.mult": +0.70,
					"spe.mult": +0.70,
					"int.mult": +0.50,
					"lib.mult": +0.50
				})
				.withExtraBonuses("Min Lib +10")
				.end();
	}
}
}
