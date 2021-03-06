package
{
	import org.flixel.*;
	import org.flixel.system.FlxReplay;
	
	public class ScreenState extends FlxState
	{
		public static var playback:FlxReplay = new FlxReplay();
		public static var wasRehearsal:Boolean = false;
		public static var wasGood:Boolean = false;
		
		public function ScreenState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			FlxG.flash(0xff000000, 0.5);
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		public function onButtonMenu():void
		{
			fadeToMenu();
		}
		
		public function fadeToMenu(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToMenu);
		}
		
		public static function goToMenu():void
		{
			FlxG.switchState(new MenuState);
		}
		
		public function onButtonGame():void
		{
			fadeToGame();
		}
		
		public function fadeToGame(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToGame);
		}
		
		public function goToGame():void
		{
			FlxG.switchState(new GameState(false));
		}
		
		public function onButtonRehearsal():void
		{
			fadeToRehearsal();
		}
		
		public function fadeToRehearsal(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToRehearsal);
		}
		
		public function goToRehearsal():void
		{
			FlxG.switchState(new GameState(true));
		}
		
		public function onButtonSpectator():void
		{
			fadeToSpectator();
		}
		
		public function fadeToSpectator(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToSpectator);
		}
		
		public function goToSpectator():void
		{
			FlxG.switchState(new SpectatorState);
		}
		
		public function onButtonResults():void
		{
			fadeToResults();
		}
		
		public function fadeToResults(Timer:FlxTimer = null):void
		{
			FlxG.fade(0xff000000, 0.5, goToResults);
		}
		
		public static function goToResults():void
		{
			var _index:int = 6;
			if (!wasGood)
				_index++;
			if (wasRehearsal)
				_index += 2;
			
			FlxG.switchState(new ResultState(_index));
		}
	}
	
}