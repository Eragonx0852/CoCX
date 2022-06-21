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

public class RaijuCathodeMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier == 1){
                descS = "Your Raiju Cathode provides an increase in speed by 10% and increase lust damage from weapons and natural weapons by 50%";
            }
            if (pTier == 2){
                descS = "Your Raiju Cathode provides an increase in speed by 25% and increase lust damage from weapons and natural weapons by 100%, All lightning damage is increased by 20%";
            }
            if (pTier == 3){
                descS = "Your Raiju Cathode provides an increase in speed by 50% and increase lust damage from weapons and natural weapons by 200%, All lightning damage is increased by 20%, Supercharged bonuses are twice as strong";
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
            return "Raiju Cathode" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requirePeripheralNervSysMutationSlot()
                    .requireRace(Races.RAIJU);
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
            if (pTier == 1) pBuffs['spe.mult'] = 0.1;
            else if (pTier == 2) pBuffs['spe.mult'] = 0.25;
            else if (pTier == 3) pBuffs['spe.mult'] = 0.5;
            return pBuffs;
        }

        public function RaijuCathodeMutation() {
            super("Raiju Cathode IM", "Raiju Cathode", SLOT_NERVSYS, 3);
        }
        
    }
}
