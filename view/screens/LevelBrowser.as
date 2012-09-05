package view.screens 
{
	
	import flash.events.Event;
	import view.CustomInterface;
	import view.util.ContentRequester;
	import view.BackgroundDisplay;
	
	public class LevelBrowser extends ContentRequester
	{
		
		private var levelBrowserInterface:CustomInterface = new CustomInterface();
		private var backgroundDisplay:BackgroundDisplay = new BackgroundDisplay();
		
		private var hasBeenInit:Boolean = false;
		
		public function LevelBrowser() 
		{
			
		}
		
		override public function init(dataObject:Object)
		{
			if (hasBeenInit == false)
			{
			addChild(levelBrowserInterface);
			addBackground();
			levelBrowserInterface.addBtn(3, "back", 26, 402, null, null, mainClick);
			levelBrowserInterface.addBtn(2, "prev", 26, 233, null, null, prevClick);
			levelBrowserInterface.addBtn(2, "next", 730, 233, null, null, nextClick);
			}
		}
		
		private function mainClick(e:Event)
		{
			super.requestContent(0, new Object());
		}
		
		private function prevClick(e:Event)
		{
			
		}
		
		private function nextClick(e:Event)
		{
			
		}
		
		public function addBackground()
		{
			backgroundDisplay.addBackground();
			addChildAt(backgroundDisplay, 0);
		}
		
	}

}