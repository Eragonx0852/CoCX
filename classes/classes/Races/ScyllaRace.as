package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.VaginaClass;

public class ScyllaRace extends Race {
	public static const ScyllaEyeColors:/*String*/Array = ["bright pink", "light purple", "purple"]
	
	public function ScyllaRace(id:int) {
		super("Scylla", id);
	}
	
	public override function setup():void {
		
		addScores()
				.faceType(Face.HUMAN, 0, -1)
				.eyeType(ANY(Eyes.KRAKEN, Eyes.HUMAN), +1)
				.eyeColor(ANY(ScyllaEyeColors), +1)
				.earType(Ears.ELFIN, +1)
				.hornType(Horns.KRAKEN, +2)
				.armType(Arms.KRAKEN, +1)
				.customRequirement("skin","slippery skin",
						function (body:BodyData): Boolean {
							return body.player.hasPlainSkinOnly() && body.skinBaseAdj == "slippery"
						}, +1)
				.skinColor("ghostly pale", +1)
				.rearType(RearBody.KRAKEN, +1)
				.height(GREATER_THAN(96), +1)
				.vaginaType(VaginaClass.SCYLLA, +1)
				.customRequirement("legs","scylla or kraken lower body",
						function (body:BodyData): Boolean {
							return body.player.isScylla() || body.player.isKraken();
						}, +0, -1000)
				.customRequirement("legs","scylla lower body",
						function (body:BodyData): Boolean {
							return body.player.isScylla();
						}, +2)
				.customRequirement("legs","kraken lower body",
						function (body:BodyData): Boolean {
							return body.player.isKraken();
						}, +4)
				.hasPerk(PerkLib.InkSpray, +1);
		addConditionedScores(function (body:BodyData):Boolean {
			return body.player.isScylla() || body.player.isKraken();
		}, "scylla or kraken lower body;")
				.faceType(Face.HUMAN, +1)
				.hairType(Hair.NORMAL, +1)
				.noWings(+2);
		//potem tentacle dick lub scylla vag też bedą sie liczyć do wyniku)
		
		addMutation(IMutationsLib.ScyllaInkGlandsIM);
		
		buildTier(7, "scylla")
				.buffs({
					"str.mult": +0.65,
					"int.mult": +0.40,
					"maxhp_base": +50
				})
				.end();
		
		buildTier(12, "kraken")
				.buffs({
					"str.mult": +1.20,
					"int.mult": +0.60,
					"maxhp_base": +150
				})
				.end();
		
		buildTier(17, "elder kraken")
				.buffs({
					"str.mult": +1.35,
					"tou.mult": +0.60,
					"int.mult": +0.60,
					"maxhp_base": +150
				})
				.end();
	}
}
}
