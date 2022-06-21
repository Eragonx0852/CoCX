package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

public class AntRace extends Race {
    public static const AntChitinColors:/*String*/Array = ["brown", "black"];
    	
	public function AntRace(id:int) {
		super("Ant", id);
		chimeraTier = 0;
		grandChimeraTier = 0;
	}
	
	public override function setup():void {
		
		addScores()
				.faceType(ANY(Face.HUMAN, Face.ANT), 0, -1)
                .faceType(Face.ANT, +1)
				.hornType(Horns.NONE, +1)
				.antennaeType(Antennae.ANT, +1)
                .earType(Ears.INSECT, +1)
                .earType(ANY(Ears.HUMAN, Ears.HoleEars), 0, -1)//
				.skinCoatType(Skin.CHITIN, +1)
				.armType(Arms.ANT, +1)
				.legType(ANY(LowerBody.CHITINOUS_SPIDER_LEGS, LowerBody.MANTIS), +1)
                .legType(LowerBody.ANT, +2)
				.hasCockOfType(CockTypesEnum.INSECT, +1)
				.wingType(ANY(Wings.ANT_SMALL, Wings.BEE_SMALL, Wings.BEE_LARGE), +1)
				.wingType(Wings.ANT_LARGE, +2)
                .hasPerk(PerkLib.AntyDexterity, +1)
				.hasPerk(PerkLib.AntOvipositor, +1);

        addMutation(IMutationsLib.TrachealSystemIM);
				
		
		buildTier(8, "ant-morph")
				.buffs({
					"str.mult": +1.00,
                    "tou.mult": +0.70,
					"int.mult": -0.70,
                    "wis.mult": -0.60
				})
				.end();
		
		buildTier(12, "formicidian")
				.buffs({
					"str.mult": +1.5,
					"tou.mult": +1.20,
					"int.mult": -0.70,
                    "wis.mult": -0.60
				})
				.end();
	}
}
}
