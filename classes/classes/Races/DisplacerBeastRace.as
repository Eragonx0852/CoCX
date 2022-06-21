package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

public class DisplacerBeastRace extends Race {
	public static const DisplacerFurColors:/*String*/Array = ["black", "midnight black", "midnight"];
	
	public function DisplacerBeastRace(id:int) {
		super("Displacer beast", id);
	}
	
	public override function setup():void {
		
		addScores()
				.faceType(ANY(Face.CAT,Face.CAT_CANINES), +1)
				.eyeTypeAndColor(Eyes.DISPLACER, "yellow", +1)
				.tongueType(Tongue.CAT, +1)
				.earType(Ears.DISPLACER, +1)
				.tailType(Tail.CAT, +1)
				.legType(LowerBody.LION, +1)
				.armType(Arms.DISPLACER, +3, -1000)
				.rearType(RearBody.DISPLACER_TENTACLES, +2, -1000)
				.skinCoatType(Skin.FUR, +1)
				.furColor(ANY(DisplacerFurColors), +1)
				.skinColor("dark gray", +1)
				.hasPerk(PerkLib.Flexibility, +1)
				.customRequirement("","not other magical feline race",
						function (body:BodyData):Boolean {
							return !(CatRace.isSphinxLike(body)
									|| body.tailType == Tail.MANTICORE_PUSSYTAIL
									|| CatRace.isNekomataLike(body)
									|| body.rearType == RearBody.LION_MANE
									|| CatRace.isCheshireLike(body)
									|| CatRace.isHellcatLike(body));
						},0,-1000
				);
		
		addMutation(IMutationsLib.CatLikeNimblenessIM);
		addMutation(IMutationsLib.DisplacerMetabolismIM);
		
		buildTier(14, "displacer beast")
				.buffs({
					"str.mult": +0.95,
					"spe.mult": +1.00,
					"int.mult": -0.25,
					"wis.mult": -0.20,
					"lib.mult": +0.80
				})
				.end()
		
		buildTier(20, "elder displacer beast")
				.buffs({
					"str.mult": +1.40,
					"spe.mult": +1.40,
					"int.mult": -0.30,
					"wis.mult": -0.30,
					"lib.mult": +0.80
				})
				.end()
	}
}
}
