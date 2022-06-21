/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Player;
import classes.Races;

public class GorgonEyesMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier >= 1){
                descS += "Allows you to use Petrify with any type of eyes and improves your resistance to attacks that are related to sight";
            }
            if (pTier >= 2){
                descS += ", increases your reactions, increases Petrify's duration, and inverts the negative effects of resistances against basilisk and similars";
            }
            if (pTier >= 3){
                descS += ", ";
            }
            if (descS != "")descS += ".";
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
            return "Gorgon Eyes" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireEyesMutationSlot()
                        .requireCustomFunction(function (player:Player):Boolean {
                            return player.eyes.type == 4;
                        }, "Gorgon eyes")
                        .requireRace(Races.GORGON);
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
            if (pTier == 1) {
                pBuffs['spe.mult'] = 0.05;
                pBuffs['sens'] = 5
            }
            if (pTier == 2) {
                pBuffs['spe.mult'] = 0.15;
                pBuffs['sens'] = 15;
            }
            return pBuffs;
        }

        public function GorgonEyesMutation() {
            super("Gorgon Eyes IM", "Gorgon Eyes", SLOT_EYES, 2);
        }

    }
}
