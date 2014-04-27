package
{
	import org.flixel.*;
	
	public class TheaterGroup extends FlxGroup
	{
		public static var selected:String = "";
		public var state:int = 0;
		
		private var stageObjects:FlxGroup;
		
		private var seatsAudienceView:Entity;
		private var seatsDirectorView:Entity;
		private var valanceBack:Entity;
		private var valanceFront:Entity;
		private var leftBackdrop:Curtain;
		private var rightBackdrop:Curtain;
		private var stageFloor:StageFloor;
		private var frontLeftCurtain:Curtain;
		private var frontRightCurtain:Curtain;
		private var midLeftCurtain:Curtain;
		private var midRightCurtain:Curtain;
		private var wave0:Wave;
		private var wave1:Wave;
		private var wave2:Wave;
		
		public var information:InfoText;
		public var lastAction:InfoText;
		public var isAudienceView:Boolean = true;
		public var isSpectating:Boolean = false;
				
		public function TheaterGroup(IsSpectating:Boolean = false)
		{
			super();
			
			isSpectating = IsSpectating;
			
			Entity.currentLayer = 0;
			//background
			leftBackdrop = new Curtain(Curtain.BACKDROP, true);
			rightBackdrop = new Curtain(Curtain.BACKDROP, false);
			add(leftBackdrop);
			add(rightBackdrop);
			
			Entity.currentLayer = 1;
			seatsDirectorView = new Seats();
			stageFloor = new StageFloor();
			valanceBack = new Valance();
			add(seatsDirectorView);
			add(stageFloor);
			add(valanceBack);
			
			Entity.currentLayer = 2;
			//curtains
			midLeftCurtain = new Curtain(Curtain.INSIDE_CURTAIN, true);
			midRightCurtain = new Curtain(Curtain.INSIDE_CURTAIN, false);
			wave0 = new Wave(0);
			wave1 = new Wave(1);
			wave2 = new Wave(2);
			frontLeftCurtain = new Curtain(Curtain.OUTSIDE_CURTAIN, true);
			frontRightCurtain = new Curtain(Curtain.OUTSIDE_CURTAIN, false);

			stageObjects = new FlxGroup();
			stageObjects.add(midLeftCurtain);
			stageObjects.add(midRightCurtain);
			stageObjects.add(wave0);
			stageObjects.add(wave1);
			stageObjects.add(wave2);
			stageObjects.add(frontLeftCurtain);
			stageObjects.add(frontRightCurtain);
			add(stageObjects);
			
			Entity.currentLayer = 3;
			//foreground
			valanceFront = new Valance();
			seatsAudienceView = new Seats();
			add(valanceFront);
			add(seatsAudienceView);
			
			//other
			information = new InfoText("View");
			add(information);
			lastAction = new InfoText("Action");
			add(lastAction);
			
			stageObjects.sort("order");
			
			if (!isSpectating)
				switchView();
			
			if (isAudienceView)
				stageObjects.members.sortOn("order", Array.NUMERIC);
			else
				stageObjects.members.sortOn("order", Array.NUMERIC | Array.DESCENDING);
		}
		
		public function switchView():void
		{
			if (isSpectating)
				return;
			isAudienceView = !isAudienceView;
			
			callAll("switchView", true);
		}
		
		override public function preUpdate():void
		{
			super.preUpdate();
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				switchView();
				
				if (isAudienceView)
					stageObjects.members.sortOn("order", Array.NUMERIC);
				else
					stageObjects.members.sortOn("order", Array.NUMERIC | Array.DESCENDING);
			}
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys.justPressed("C"))
			{
				if (selected == "Open Curtain")
					selected = "Close Curtain";
				else
					selected = "Open Curtain";
			}
			else if (FlxG.keys.justPressed("W"))
			{
				if (selected == "Front Waves")
					selected = "Middle Waves";
				else if (selected == "Middle Waves")
					selected = "Back Waves";
				else
					selected = "Front Waves";
			}
			else if (FlxG.keys.justPressed("S"))
				selected = "Shark";
			
			if (FlxG.keys.justPressed("LEFT") || FlxG.keys.justPressed("J"))
				leftAction();
			if (FlxG.keys.justPressed("RIGHT") || FlxG.keys.justPressed("L"))
				rightAction();
			if (FlxG.keys.justPressed("DOWN") || FlxG.keys.justPressed("K"))
				downAction();
			
			if (state == 2 && frontLeftCurtain.progress == 1 && frontRightCurtain.progress == 1)
				ScreenState.goToMenu();
		}
		
		private function leftAction():void
		{
			if (selected == "Open Curtain")
			{
				frontLeftCurtain.decrease();
				if (state == 0)
					state = 1;
			}
			else if (selected == "Close Curtain")
			{
				frontLeftCurtain.increase();
				if (state == 1)
					state = 2;
			}
			else if (selected == "Front Waves")
				wave2.decrease();
			else if (selected == "Middle Waves")
				wave1.decrease();
			else if (selected == "Back Waves")
				wave0.decrease();
		}
		
		private function rightAction():void
		{
			if (selected == "Open Curtain")
			{
				frontRightCurtain.decrease();
				if (state == 0)
					state = 1;
			}
			else if (selected == "Close Curtain")
			{
				frontRightCurtain.increase();
				if (state == 1)
					state = 2;
			}
			else if (selected == "Front Waves")
				wave2.increase();
			else if (selected == "Middle Waves")
				wave1.increase();
			else if (selected == "Back Waves")
				wave0.increase();
		}
		
		private function downAction():void
		{
			if (selected == "Open Curtain" || selected == "Close Curtain")
			{
				frontLeftCurtain.pause();
				frontRightCurtain.pause();
			}
			else if (selected == "Front Waves")
				wave2.pause();
			else if (selected == "Middle Waves")
				wave1.pause();
			else if (selected == "Back Waves")
				wave0.pause();
		}
	}
	
}