/**
 * ...
 * @author Ormael
 */
package classes.Scenes.Monsters 
{

	import classes.*;
	import classes.internals.*;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.GlobalFlags.kFLAGS;
	
	public class GolemTrueAdvanced extends AbstractGolem
	{
		public function backhand():void {
			outputText("The golem's visage twists into a grimace of irritation, and it swings its hand at you in a vicious backhand.");
			var damage:Number = int ((str + weaponAttack) - rand(player.tou) - player.armorDef);
			//Dodge
			if (damage <= 0 || (player.getEvasionRoll())) outputText(" You slide underneath the surprise swing!");
			else
			{
				outputText(" It hits you square in the chest. ");
				damage = player.takePhysDamage(damage, true);
			}
		}
		
		public function overhandSmash():void {
			outputText("Raising its fist high overhead, the golem swiftly brings it down in a punishing strike!");
			
			var damage:Number = 100 + int((str + weaponAttack) - rand(player.tou) - player.armorDef);
			if (damage <= 0 || rand(100) < 25 || player.getEvasionRoll()) outputText(" You're able to sidestep it just in time.");
			else
			{
				outputText(" The concussive strike impacts you with bonecrushing force. ");
				damage = player.takePhysDamage(damage, true);
			}
		}
		
		override protected function performCombatAction():void
		{
			if (this.HPRatio() < 0.6) {
				var choice2:Number = rand(5);
				if (choice2 < 3) eAttack();
				if (choice2 == 3) backhand();
				if (choice2 == 4) overhandSmash();
			}
			else if (this.HPRatio() < 0.8) {
				var choice1:Number = rand(4);
				if (choice1 < 3) eAttack();
				if (choice1 == 3) backhand();
			}
			else eAttack();
		}
		
		public function GolemTrueAdvanced() 
		{
			super(false);
			this.a = "the ";
			this.short = "advanced true golem";
			this.imageName = "advanced true golem";
			this.long = "You're currently fighting advanced true golem. It's eight feet tall without any sexual characteristics, it stone body lacking any cracks dummy ones possesed and using it bare stone fists to smash enemies.";
			initStrTouSpeInte(250, 200, 150, 10);
			initWisLibSensCor(10, 10, 10, 50);
			this.tallness = 96;
			this.drop = new ChainedDrop()
					.add(useables.GOLCORE, 1/4);
			this.level = 51;
			this.bonusHP = 650;
			this.additionalXP = 650;
			this.weaponName = "stone fists";
			this.weaponVerb = "smash";
			this.weaponAttack = 70;
			this.armorName = "stone";
			this.armorDef = 70;
			this.createPerk(PerkLib.RefinedBodyI, 0, 0, 0, 0);
			this.createPerk(PerkLib.TankI, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyConstructType, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}