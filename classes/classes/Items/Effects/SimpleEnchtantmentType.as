package classes.Items.Effects {
import classes.Items.Enchantment;
import classes.Items.EnchantmentType;

public class SimpleEnchtantmentType extends EnchantmentType {
	public var minPower:int;
	public var maxPower:int;
	public var valueAddBase:int;
	public var valueAddPerPower:int;
	public var valueMulBase:Number;
	public var valueMulPerPower:Number;
	
	protected override function doSpawn(identified:Boolean, params:Array):Enchantment {
		var power:Number = params[0];
		
		return new Enchantment(
				identified,
				this,
				prefix,
				suffix,
				shortSuffix,
				power,
				params,
				valueAddBase + valueAddPerPower * power,
				valueMulBase + valueMulPerPower * power
		)
	}
	
	public override function generateRandom(options:Object = null):Enchantment {
		var power:int = (maxPower <= minPower) ? minPower : (rand(maxPower + 1 - minPower) + minPower);
		return doSpawn(valueOr(options.identified, false), [power]);
	}
	
	public function SimpleEnchtantmentType(id:int,
										   name:String,
										   curse:Boolean,
										   prefix:String,
										   suffix:String,
										   shortSuffix:String,
										   description:String,
										   rarity:int,
										   minPower:int,
										   maxPower:int,
										   valueAddBase:int,
										   valueAddPerPower:int,
										   valueMulBase:Number,
										   valueMulPerPower:Number) {
		super(id, name, curse, prefix, suffix, shortSuffix, description, rarity);
		this.minPower         = minPower;
		this.maxPower         = maxPower;
		this.valueAddBase     = valueAddBase;
		this.valueAddPerPower = valueAddPerPower;
		this.valueMulBase     = valueMulBase;
		this.valueMulPerPower = valueMulPerPower;
	}
}
}
