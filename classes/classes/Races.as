package classes {
import classes.Races.*;
import classes.internals.race.RaceTierBuilder;

public class Races {
	/**
	 * All races, including disabled
	 */
	public static const AllRacesWithDisabled:/*Race*/Array = [];
	/**
	 * All races except disabled; use this array to calc racial scores and apply bonuses
	 */
	public static var AllEnabledRaces:/*Race*/Array      = [];
	/**
	 * All races except disabled and hidden
	 */
	public static var AllVisibleRaces:/*Race*/Array = [];
	/**
	 * All visible enabled races, sorted by name
	 */
	public static var AllRacesByName:/*Race*/Array = [];
	
	public static const HUMAN:HumanRace                    = new HumanRace(1);
	public static const CAT:CatRace                        = new CatRace(2);
	public static const NEKOMATA:NekomataRace              = new NekomataRace(3);
	public static const CHESHIRE:CheshireRace              = new CheshireRace(4);
	public static const HELLCAT:HellcatRace                = new HellcatRace(5);
	public static const DISPLACERBEAST:DisplacerBeastRace  = new DisplacerBeastRace(6);
	public static const SPHINX:SphinxRace                  = new SphinxRace(7);
	public static const LIZARD:LizardRace                  = new LizardRace(8);
	public static const DRAGON:DragonRace                  = new DragonRace(9);
	public static const DRAGONNE:DragonneRace              = new DragonneRace(10);
	public static const RACCOON:RaccoonRace                = new RaccoonRace(11);
	public static const DOG:DogRace                        = new DogRace(12);
	public static const WOLF:WolfRace                      = new WolfRace(13);
	public static const WEREWOLF:WerewolfRace              = new WerewolfRace(14);
	public static const FOX:FoxRace                        = new FoxRace(15);
	public static const FERRET:FerretRace                  = new FerretRace(16);
	public static const KITSUNE:KitsuneRace                = new KitsuneRace(17);
	public static const HORSE:HorseRace                    = new HorseRace(18);
	public static const UNICORN:UnicornRace                = new UnicornRace(19);
	public static const CENTAUR:CentaurRace                = new CentaurRace(20);
	public static const MINOTAUR:MinotaurRace              = new MinotaurRace(21);
	public static const COW:CowRace                        = new CowRace(22);
	public static const SANDTRAP:SandTrapRace              = new SandTrapRace(23);
	public static const BEE:BeeRace                        = new BeeRace(24);
	public static const GOBLIN:GoblinRace                  = new GoblinRace(25);
	public static const DEMON:DemonRace                    = new DemonRace(26);
	public static const DEVIL:DevilRace                    = new DevilRace(27);
	public static const SHARK:SharkRace                    = new SharkRace(28);
	public static const ORCA:OrcaRace                      = new OrcaRace(29);
	public static const OOMUKADE:OomukadeRace              = new OomukadeRace(30);
	public static const ONI:OniRace                        = new OniRace(31);
	public static const ELF:ElfRace                        = new ElfRace(32);
	public static const ORC:OrcRace                        = new OrcRace(33);
	public static const RAIJU:RaijuRace                    = new RaijuRace(34);
	public static const THUNDERBIRD:ThunderbirdRace        = new ThunderbirdRace(35);
	public static const BUNNY:BunnyRace                    = new BunnyRace(36);
	public static const HARPY:HarpyRace                    = new HarpyRace(37);
	public static const SPIDER:SpiderRace                  = new SpiderRace(38);
	public static const KANGAROO:KangarooRace              = new KangarooRace(39);
	public static const MOUSE:MouseRace                    = new MouseRace(40);
	public static const SCORPION:ScorpionRace              = new ScorpionRace(41);
	public static const MANTIS:MantisRace                  = new MantisRace(42);
	public static const SALAMANDER:SalamanderRace          = new SalamanderRace(43);
	public static const CAVEWYRM:CaveWyrmRace              = new CaveWyrmRace(44);
	public static const NAGA:NagaRace                      = new NagaRace(45);
	public static const GORGON:GorgonRace                  = new GorgonRace(46);
	public static const VOUIVRE:VouivreRace                = new VouivreRace(47);
	public static const COUATL:CouatlRace                  = new CouatlRace(48);
	public static const HYDRA:HydraRace                    = new HydraRace(49);
	public static const FIRESNAILS:FireSnailRace           = new FireSnailRace(50);
	public static const PHOENIX:PhoenixRace                = new PhoenixRace(51);
	public static const SCYLLA:ScyllaRace                  = new ScyllaRace(52);
	public static const PLANT:PlantRace                    = new PlantRace(53);
	public static const ALRAUNE:AlrauneRace                = new AlrauneRace(54);
	public static const YGGDRASIL:YgddrasilRace            = new YgddrasilRace(55);
	public static const PIG:PigRace                        = new PigRace(56);
	public static const SATYR:SatyrRace                    = new SatyrRace(57);
	public static const RHINO:RhinoRace                    = new RhinoRace(58);
	public static const ECHIDNA:EchidnaRace                = new EchidnaRace(59);
	public static const DEER:DeerRace                      = new DeerRace(60);
	public static const MANTICORE:ManticoreRace            = new ManticoreRace(61);
	public static const REDPANDA:RedPandaRace              = new RedPandaRace(62);
	public static const BEARANDPANDA:BearRace              = new BearRace(63);
	public static const SIREN:SirenRace                    = new SirenRace(64);
	public static const YETI:YetiRace                      = new YetiRace(65);
	public static const YUKIONNA:YukiOnnaRace              = new YukiOnnaRace(66);
	public static const BAT:BatRace                        = new BatRace(67);
	public static const VAMPIRE:VampireRace                = new VampireRace(68);
	public static const JABBERWOCKY:JabberwockyRace        = new JabberwockyRace(69);
	public static const AVIAN:AvianRace                    = new AvianRace(70);
	public static const GARGOYLE:GargoyleRace              = new GargoyleRace(71);
	public static const SLIME:SlimeRace                    = new SlimeRace(72);
	public static const MAGMASLIME:MagmaSlimeRace          = new MagmaSlimeRace(73);
	public static const DARKSLIME:DarkSlimeRace            = new DarkSlimeRace(74);
	public static const JIANGSHI:JiangshiRace              = new JiangshiRace(75);
	public static const POLTERGEIST:PoltergeistRace        = new PoltergeistRace(76);
	public static const BANSHEE:BansheeRace                = new BansheeRace(77);
	public static const MELKIE:MelkieRace                  = new MelkieRace(78);
	public static const EASTERBUNNY:EasterBunnyRace        = new EasterBunnyRace(79);
	public static const CENTIPEDE:CentipedeRace            = new CentipedeRace(80);
	public static const FROSTWYRM:FrostWyrmRace            = new FrostWyrmRace(81);
	public static const CANCER:CancerRace                  = new CancerRace(82);
	public static const USHIONNA:UshiOniRace               = new UshiOniRace(83);
	public static const FAIRY:FairyRace                    = new FairyRace(84);
	public static const GREMLIN:GremlinRace                = new GremlinRace(85);
	public static const KAMAITACHI:KamaitachiRace          = new KamaitachiRace(86);
	public static const GAZER:GazerRace                    = new GazerRace(87);
	public static const RATATOSKR:RatatoskrRace            = new RatatoskrRace(88);
	public static const WENDIGO:WendigoRace                = new WendigoRace(89);
	public static const TROLL:TrollRace                    = new TrollRace(90);
	public static const ATLACH_NACHA:AtlachNachaRace       = new AtlachNachaRace(91);
	public static const WOODELF:WoodElfRace                = new WoodElfRace(92);
	public static const SEA_DRAGON:SeaDragonRace           = new SeaDragonRace(93);
	public static const FMINDBREAKER:FemaleMindbreakerRace = new FemaleMindbreakerRace(94);
	public static const MMINDBREAKER:MaleMindbreakerRace   = new MaleMindbreakerRace(95);
	public static const ELEMENTALFUSION:ElementalRace      = new ElementalRace(96);
	public static const GRYPHON:GryphonRace                = new GryphonRace(97);
	public static const PEACOCK:PeacockRace                = new PeacockRace(98);
	public static const ANGEL:AngelRace                    = new AngelRace(99);
	public static const APOPHIS:ApophisRace                = new ApophisRace(100);
	public static const CYCLOP:CyclopRace                  = new CyclopRace(101);
	public static const ALICORN:AlicornRace                = new AlicornRace(102);
	
	// Racial groups
	public static const CatlikeRaces:/*Race*/Array   = [
			CAT, NEKOMATA, DISPLACERBEAST, HELLCAT, CHESHIRE, SPHINX, MANTICORE
	];
	public static const SnakelikeRaces:/*Race*/Array = [
			NAGA, GORGON, VOUIVRE, COUATL, HYDRA, APOPHIS
	];
	public static const InsectRaces:/*Race*/Array = [
			BEE, MANTIS, SCORPION, SPIDER, CANCER, ATLACH_NACHA
	];
	public static const GoblinoidRaces:/*Race*/Array = [
			GOBLIN, GREMLIN
	];
	public static const HarpylikeRaces:/*Race*/Array = [
			HARPY, THUNDERBIRD, PHOENIX
	];
	
	function Races() {
	}
	
	public static function load():void {
		RaceTierBuilder.ensureEndCalled();
		// log scary numbers for fun
		var nreq:int=0,nt:int=0,nr:int=0;
		
		for (var id:String in Race.RaceById) {
			var race:Race = Race.RaceById[id];
			AllRacesWithDisabled.push(race);
			try {
				race.setup();
			} catch (e:Error) {
				trace("[ERROR] Error initializing race "+race.name);
				trace(e.getStackTrace());
				continue;
			}
			if (race.disabled) {
				trace("Race "+race.name+" (#"+race.id+") is disabled")
				continue;
			} else if (race.tiers.length == 0) {
				trace("[ERROR] Race "+race.name+" has no tiers, disabling it");
				race.disabled = true;
				continue;
			}
			nr++;
			nreq += race.requirements.length;
			nt += race.tiers.length;
			AllEnabledRaces.push(race);
			if (race.hidden) {
				trace("Race "+race.name+" (#"+race.id+") is hidden")
				continue;
			}
			AllVisibleRaces.push(race);
		}
		trace("Loaded "+nr+" races, "+nt+" tiers, "+nreq+" requirements");
		
		AllRacesByName = AllVisibleRaces.slice().sortOn("name",Array.CASEINSENSITIVE);
	}
}
}
