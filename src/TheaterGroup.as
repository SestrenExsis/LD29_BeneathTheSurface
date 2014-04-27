package
{
	import org.flixel.*;
	
	public class TheaterGroup extends FlxGroup
	{
		private var seats:Entity;
		private var valanceBack:Entity;
		private var valanceFront:Entity;
		private var leftBackdrop:Curtain;
		private var rightBackdrop:Curtain;
		private var stageFloor:StageFloor;
		
		private var stageObjects:FlxGroup;
		
		private var frontLeftCurtain:Curtain;
		private var frontRightCurtain:Curtain;
		private var midLeftCurtain:Curtain;
		private var midRightCurtain:Curtain;
		
		private var wave0:Wave;
		private var wave1:Wave;
		private var wave2:Wave;
		
		public var information:InfoText;
		public var isAudienceView:Boolean = true;
		
		private var debugEntity:Entity;
		
		private var selected:String = "";
		
		public function TheaterGroup()
		{
			super();
			
			Entity.currentLayer = 0;
			//background
			leftBackdrop = new Curtain(Curtain.BACKDROP, true);
			rightBackdrop = new Curtain(Curtain.BACKDROP, false);
			add(leftBackdrop);
			add(rightBackdrop);
			
			Entity.currentLayer = 1;
			stageFloor = new StageFloor();
			valanceBack = new Valance();
			add(valanceBack);
			add(stageFloor);
			
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
			seats = new Entity(0, 285);
			//seats.loadGraphic(seats.imgSeats, true, false, 640, 100);
			add(valanceFront);
			//add(seats);
			
			//other
			information = new InfoText();
			add(information);
			
			stageObjects.sort("order");
		}
		
		public function switchView():void
		{
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
				{
					stageObjects.members.sortOn("order", Array.NUMERIC);
					//sort("order");
				}
				else
				{
					stageObjects.members.sortOn("order", Array.NUMERIC | Array.DESCENDING);
					//sort("order", DESCENDING);
				}
			}
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys.justPressed("C"))
			{
				if (selected == "Open Curtains")
					selected = "Close Curtains";
				else
					selected = "Open Curtains";
			}
			else if (FlxG.keys.justPressed("W"))
				selected = "waves";
			else if (FlxG.keys.justPressed("S"))
				selected = "shark";
			
			if (FlxG.keys.justPressed("LEFT"))
				leftAction();
			if (FlxG.keys.justPressed("RIGHT"))
				rightAction();
			if (FlxG.keys.justPressed("DOWN"))
				downAction();
			
		}
		
		private function leftAction():void
		{
			if (selected == "Open Curtains")
				(isAudienceView) ? frontRightCurtain.decrease() : frontLeftCurtain.decrease();
			else if (selected == "Close Curtains")
				(isAudienceView) ? frontRightCurtain.increase() : frontLeftCurtain.increase();
		}
		
		private function rightAction():void
		{
			if (selected == "Open Curtains")
				(isAudienceView) ? frontLeftCurtain.decrease() : frontRightCurtain.decrease();
			else if (selected == "Close Curtains")
				(isAudienceView) ? frontLeftCurtain.increase() : frontRightCurtain.increase();
		}
		
		private function downAction():void
		{
			if (selected == "Open Curtains" || selected == "Close Curtains")
			{
				frontLeftCurtain.pause();
				frontRightCurtain.pause();
			}
		}
	}
	
}