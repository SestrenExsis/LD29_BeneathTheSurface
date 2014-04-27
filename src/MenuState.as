package
{
	import org.flixel.*;
	
	public class MenuState extends ScreenState
	{
		[Embed(source="../assets/images/Title.png")] public var imgTitle:Class;

		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			var _title:FlxSprite = new FlxSprite(0, 0);
			_title.loadGraphic(imgTitle);
			add(_title);
			
			var _button:FlxButton;
			add(new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 72, "Rehearsal", onButtonRehearsal));
			add(new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 96, "Opening Night", onButtonGame));
			if (playback.frameCount > 0)
			{
				_button = new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 120, "Spectate", onButtonSpectator);
			}
			else
			{
				_button = new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 120, "Spectate");
				//_button.label.color = 0x999999;
				_button.alpha = 0.35;
			}
			add(_button);
		}
		
		override public function update():void
		{	
			super.update();
		}
	}
	
}