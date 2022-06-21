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

public class TwinHeartMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier == 1){
                descS = "+40% fatigue recovery and +5 to max tou/spe (scalable). +100% fatigue recovery, reduce Charge fatigue cost by 10% as well as its cooldown by 1 round so long as your body is tauric/drider. (Also raise all Taur race score by 1, by 2 as long pc is tauric/drider)";
            }
            if (pTier == 2){
                descS = "+80% fatigue recovery and +15 to max tou/spe (scalable). +200% fatigue recovery, reduce Charge fatigue cost by 20%, increase damage by 20%, its cooldown by 2 rounds so long as your body is tauric/drider. (Also raise all Taur race score by 2, by 4 as long pc is tauric/drider)";
            }
            if (pTier == 3){
                descS = "+120% fatigue recovery and +45 to max tou/spe (scalable). +300% fatigue recovery, reduce Charge fatigue cost by 30%, increase damage by 80%, its cooldown by 3 rounds so long as your body is tauric/drider. (Also raise all Taur race score by 3, by 6 as long pc is tauric/drider)";
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
            return "Twin Heart" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireAdaptationsMutationSlot()
                    .requireCustomFunction(function (player:Player):Boolean {
                        return player.isRace(Races.CENTAUR) || player.isRace(Races.UNICORN, 2) || player.isRace(Races.SPHINX) || player.isRace(Races.CANCER) || player.isTaur() || player.isDrider();
                    }, "Taur/Drider or Unicorn/Bicorn race");
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
                pBuffs['tou.mult'] = 0.05;
                pBuffs['spe.mult'] = 0.05;
            }
            else if (pTier == 2) {
                pBuffs['tou.mult'] = 0.15;
                pBuffs['spe.mult'] = 0.15;
            }
            else if (pTier == 3) {
                pBuffs['tou.mult'] = 0.45;
                pBuffs['spe.mult'] = 0.45;
            }
            return pBuffs;
        }

        public function TwinHeartMutation() {
            super("Twin Heart IM", "Twin Heart", SLOT_ADAPTATIONS, 3);
        }

    }
}
