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
import classes.Player;

public class NaturalPunchingBagMutation extends IMutationPerkType
    {
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            if (pTier == 1){
                descS = "Increases the damage reduction from Bouncy body by 5% and increase your natural toughness";
            }
            else if (pTier == 2){
                descS = "Increases the damage reduction from Bouncy body by 15%, continue to increase your natural toughness and healing items are more effective";
            }
            else if (pTier == 3){
                descS = "Increases the damage reduction from Bouncy body by 35%, continue to increase your natural toughness, healing/wrath/stat boosting items are more effective and allows you to keep the effect of bouncy body as long as you are below 4 feet tall";
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
            return "Natural Punching Bag" + sufval;
        }

        //Mutation Requirements
        override public function pReqs():void{
            try{
                var pTier:int = currentTier(this, player);
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireFatTissueMutationSlot()
                    .requirePerk(PerkLib.BouncyBody)
                    .requireCustomFunction(function (player:Player):Boolean {
                        return player.isGoblinoid();
                    }, "Goblin race");
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
            var buffVal:Number = 0;
            if (pTier == 1) buffVal = 0.05;
            if (pTier == 2) buffVal = 0.15;
            if (pTier == 3) buffVal = 0.35;
            pBuffs['tou.mult'] = buffVal;
            return pBuffs;
        }

        public function NaturalPunchingBagMutation() {
            super("Natural Punching Bag IM", "Natural Punching Bag", SLOT_FAT, 3);
        }

    }
}
