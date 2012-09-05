package view.screens 
{
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import view.CustomInterface;
	import view.LevelBrowserInterface;
	import view.LevelSelDisplay;
	import view.util.ContentRequester;
	import view.BackgroundDisplay;
	
	public class LevelBrowser extends ContentRequester
	{
		
		private var levelBrowserInterface:CustomInterface = new CustomInterface();
		private var backgroundDisplay:BackgroundDisplay = new BackgroundDisplay();
		private var levelBrowserDisplay:LevelBrowserInterface = new LevelBrowserInterface();
		
		private var hasBeenInit:Boolean = false;
		
		public function LevelBrowser() 
		{
			
		}
		
		override public function init(dataObject:Object)
		{
			if (hasBeenInit == false)
			{
			addBackground();
			addChild(levelBrowserInterface);
			addChild(levelBrowserDisplay);
			
			
			//Buttons
			levelBrowserInterface.addBtn(3, "back", 26, 402, null, null, mainClick);
			
			
			//LevelBrowser
			levelBrowserDisplay.addEventListener(LevelBrowserInterface.LEVEL_SELECT, levelSelectHandler);
			levelBrowserDisplay.init(90, 120);
			
			hasBeenInit = true;
			}
			else
				levelBrowserDisplay.reset();
		}
		
		override public function resizeElements(sizeX:Number, sizeY:Number)
		{
			backgroundDisplay.resize(sizeX, sizeY);
			levelBrowserInterface.resize(sizeX, sizeY);
			//levelBrowserDisplay.resize(sizeX, sizeY);
		}
		
		private function mainClick(e:Event)
		{
			super.requestContent(0, new Object());
		}
		
		public function addBackground()
		{
			backgroundDisplay.addBackground();
			addChildAt(backgroundDisplay, 0);
		}
		
		private function levelSelectHandler(e:Event)
		{
			trace("Level selected" + LevelBrowserInterface(e.target).selectedLevel);
		}
	}

}