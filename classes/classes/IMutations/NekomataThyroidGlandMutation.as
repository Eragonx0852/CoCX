/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;

    public class NekomataThyroidGlandMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier >= 1){
                descS += "";//lower cooldowns for Illusion and Terror by three turns, increase speed of the recovery after using magic and slightly boost PC speed
            }
            if (pTier >= 2){
                descS += ", ";//lower cooldowns for Illusion and Terror by three turns, increase speed of the recovery after using magic and slightly boost PC speed
            }
            if (pTier >= 3){
                descS += ", ";//grant bonus soulforce/mana regen depending on Star Sphere rank, increase max Star Sphere rank to 20. Increase speed debuff of Terror to 50, increase evasion boost from Illusion to 20%. Boost PC speed, wisdom and intelligence
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
            return "Nekomata Thyroid Gland" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireHeartMutationSlot();
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

        public function NekomataThyroidGlandMutation() {
            super("Nekomata Thyroid Gland IM", "Nekomata Thyroid Gland", SLOT_NONE, 3);
        }
        
    }
}
