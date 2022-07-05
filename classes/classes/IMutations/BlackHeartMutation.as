/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.PerkLib;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Races;

public class BlackHeartMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier >= 1){
                descS += "Increased Lust strike power, Empower Fascinate";
            }
            if (pTier >= 2){
                descS += ", Adds extra Lust damage to Lust strike scaling with Wisdom (Wis/10). Lowers Fascinate Cooldown by 1";
            }
            if (pTier >= 3){
                descS += ", Adds extra Lust damage to Lust strike, scaling with Sensitivity (Sensitivity/10). Facinate Stun lasts 2 turns";
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
            return "Black Heart" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireHeartMutationSlot()
                    .requirePerk(PerkLib.DarkCharm).requireCor(100)
                    .requireRace(Races.DEMON)
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
            if (pTier == 1) pBuffs['lib.mult'] = 0.05;
            else if (pTier == 2) pBuffs['lib.mult'] = 0.15;
            else if (pTier == 3) pBuffs['lib.mult'] = 0.3;
            return pBuffs;
        }

        public function BlackHeartMutation() {
            super("Black Heart IM", "Black Heart", SLOT_HEART, 3);
        }

        
    }
}
