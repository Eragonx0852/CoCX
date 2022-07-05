/**
 * ...
 * @author Zavos
 */
package classes.Items.Jewelries
{
	import classes.Items.Jewelry;
	import classes.PerkLib;

	public class MediusSignet extends Jewelry
	{
		
		public function MediusSignet()
		{
			super("MSignit", "Medius Signet", "Medius Signet", "a Medius Signet", 0, 0, 800, "A gift from your mentor, this ring bears the seal of an extinct clan of magi.", "Special: Ambition (+20% spell effect multiplier, 15% power boost/cost reduction for white magic)");
		}
		
		override public function playerEquip():Jewelry {
			while (game.player.hasPerk(PerkLib.Ambition)) game.player.removePerk(PerkLib.Ambition);
			game.player.createPerk(PerkLib.Ambition,0.2,0.15,0,0);
			return super.playerEquip();
		}
		
		override public function playerRemove():Jewelry {
			while (game.player.hasPerk(PerkLib.Ambition)) game.player.removePerk(PerkLib.Ambition);
			return super.playerRemove();
		}
		
	}

}
