package
{
	import org.flixel.*;
	
	public class GameState extends ScreenState
	{
		private var theater:TheaterGroup;
		private var instructions:Instructions;
		private var isRehearsal:Boolean = false;
		
		public function GameState(IsRehearsal:Boolean)
		{
			super();
			
			isRehearsal = IsRehearsal;
		}
		
		override public function create():void
		{
			super.create();
			
			playback.create(FlxG.random());
			
			theater = new TheaterGroup(false);
			add(theater);
			
			if (isRehearsal)
			{
				instructions = new Instructions();
				add(instructions);
			}
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