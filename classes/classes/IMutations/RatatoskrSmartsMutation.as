/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Races;

public class RatatoskrSmartsMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier >= 1){
                descS += "Allows you to perm Weird words";
            }
            if (pTier >= 3){
                descS += ", knowledge is power is now three times as effective";
            }
            if (pTier >= 2){
                descS += ", increase the damage of Weird words by " + ((pTier == 2)?"20%":((pTier == 3)?"50%":"")) + ", lower cooldown of Knowledge overload by " + ((pTier == 2)?"1 turn":((pTier == 3)?"2 turns":""));
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
            return "Ratatoskr Smarts" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requirePeripheralNervSysMutationSlot()
                    .requireRace(Races.RATATOSKR);
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
            if (pTier == 1) pBuffs['int.mult'] = 0.05;
            if (pTier == 2) pBuffs['int.mult'] = 0.15;
            if (pTier == 3) pBuffs['int.mult'] = 0.35;
            return pBuffs;
        }

        public function RatatoskrSmartsMutation() {
            super("Ratatoskr Smarts IM", "Ratatoskr Smarts", SLOT_NERVSYS, 3);
        }
        
    }
}
