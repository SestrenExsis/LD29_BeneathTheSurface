package
{
	import org.flixel.*;
	
	public class GameState extends ScreenState
	{
		private var theater:TheaterGroup;
		private var information:FlxText;
		
		public function GameState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			theater = new TheaterGroup();
			add(theater);
		}
		
		override public function update():void
		{	
			super.update();
		}
	}
	
}