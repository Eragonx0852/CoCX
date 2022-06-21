/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.GlobalFlags.kFLAGS;
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Player;
import classes.Races;

public class DisplacerMetabolismMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier >= 1){
                descS += "Increase strength and speed, reduces int after consuming milk";
            }
            if (pTier >= 2){
                descS += ", increase the milk STR and SPD boost by 100% * NG+, int reduction lasts 5 hours longer and adds 50% extra duration";
            }
            if (flags[kFLAGS.HUNGER_ENABLED] > 0) descS += ", increases max hunger cap by 50";
            if (descS != ""){
                descS += (", and increases displacer beast claws attack damage by x" + pTier + 1);
                descS += ".";
            }
            return descS;
        }

        //Name. Need it say more?
        override public function name(params:PerkClass=null):String {
            var sufval:String;
            switch (currentTier(this, player)){
                case 2:
                    sufval = "(Primitive)";
                    break;
                case 3:
                    sufval = "(Evolved)";
                    break;
                default:
                    sufval = "";
            }
            return "Displacer Metabolism" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireMetabolismMutationSlot()
                    .requireRace(Races.DISPLACERBEAST);
                }
                else{
                    var pLvl:int = pTier * 30;
                    this.requireLevel(pLvl);
                }
            }catch(e:Error){
                trace(e.getStackTrace());
            }
        }

        //Mutations Buffs
        override public function pBuffs(target:Creature = null):Object{
            var pBuffs:Object = {};
            var pTier:int = currentTier(this, (target == null)? player : target);
            return pBuffs;
        }

        public function DisplacerMetabolismMutation() {
            super("Displacer Metabolism IM", "Displacer Metabolism", SLOT_METABOLISM, 3);
        }
        
    }
}
