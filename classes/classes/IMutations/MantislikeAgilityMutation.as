/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Player;

public class MantislikeAgilityMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this): pTier;
            if (pTier >= 1){
                descS += "Your agility is increased, and can be even further boosted if you have natural armour or thick skin.";
            }
            if (pTier >= 3){
                descS += ", (+30% max core spe as phantom spe)";
            }
            if (descS != "")descS += ".";
            return descS;
        }

        //Name. Need it say more?
        override public function name(params:PerkClass=null):String {
            var sufval:String;
            switch (currentTier(this)){
                case 2:
                    sufval = "(Primitive)";
                    break;
                case 3:
                    sufval = "(Evolved)";
                    break;
                default:
                    sufval = "";
            }
            return "Mantislike Agility" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireMusclesMutationSlot()
                    .requireMutation(IMutationsLib.TrachealSystemIM)
                    .requireCustomFunction(function (player:Player):Boolean {
                        return player.mantisScore() >= 12;
                    }, "Mantis race");
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
        override public function pBuffs():Object{
            var pBuffs:Object = {};
            var pTier:int = currentTier(this);
            return pBuffs;
        }

        public function MantislikeAgilityMutation() {
            super("Mantislike Agility IM", "Mantislike Agility", ".");
            maxLvl = 3;
        }

    }
}