package view.screens 
{
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import view.displays.LevelSelDisplay;
	import view.util.ContentRequester;
	import view.customInterfaces.*;
	
	public class LevelBrowser extends ContentRequester
	{
		
		private var screenInterface:CustomInterface = new CustomInterface();
		private var backgroundInterface:BackgroundInterface = new BackgroundInterface();
		private var levelBrowserInterface:LevelBrowserInterface = new LevelBrowserInterface();
		
		private var hasBeenInit:Boolean = false;
		
		public function LevelBrowser() 
		{
			
		}
		
		override public function init(dataObject:Object)
		{
			if (hasBeenInit == false)
			{
			addBackground(1);
			addChild(screenInterface);
			addChild(levelBrowserInterface);
			
			
			//Buttons
			screenInterface.addBtn("SquareGreen", "Back", 26, 402, null, null, mainClick);
			
			
			//LevelBrowser
			levelBrowserInterface.addEventListener(LevelBrowserInterface.LEVEL_SELECT, levelSelectHandler);
			levelBrowserInterface.init(90, 120);
			
			hasBeenInit = true;
			}
			else
				levelBrowserInterface.reset();
		}
		
		override public function resizeElements(sizeX:Number, sizeY:Number)
		{
			backgroundInterface.resize(sizeX, sizeY);
			screenInterface.resize(sizeX, sizeY);
			levelBrowserInterface.resize(sizeX, sizeY);
		}
		
		private function mainClick(e:Event)
		{
			super.requestContent(0, new Object());
		}
		
		public function addBackground(nr:int)
		{
			backgroundInterface.addBackground(nr);
			addChildAt(backgroundInterface, 0);
		}
		
		private function levelSelectHandler(e:Event)
		{
			trace("Level selected" + LevelBrowserInterface(e.target).selectedLevel);
		}
	}

}