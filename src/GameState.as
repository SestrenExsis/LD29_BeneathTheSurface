package
{
	import org.flixel.*;
	
	public class GameState extends ScreenState
	{
		private var theater:TheaterGroup;
		
		public function GameState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			playback.create(FlxG.random());
			
			theater = new TheaterGroup(false);
			add(theater);
		}
		
		override public function update():void
		{	
			super.update();
			
			// supress the space bar in the playback since it switches views
			// doesn't seem to work, but keeping it here, anyway. Supression of view-switching is hard-coded
			// into the TheaterGroup class, instead.
			var _space:Boolean = FlxG.keys.pressed("SPACE");
			if (FlxG.keys.pressed("SPACE"))
				FlxG.keys.SPACE = false;
			playback.recordFrame();
			FlxG.keys.SPACE = _space;
		}
	}
	
}