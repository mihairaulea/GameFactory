package view.screens 
{

	import flash.display.*;
	import flash.events.Event;
	import view.*;
	import view.util.ContentRequester;
	import view.util.Filters;
	
	public class FirstScreen extends ContentRequester
	{
		
		
		private var backgroundDisplay:BackgroundDisplay = new BackgroundDisplay();
		private var firstScreenInterface:CustomInterface = new CustomInterface();
		
		private var hasBeenInit:Boolean = false;
		
		public function FirstScreen() 
		{
			
		}
		
		override public function init(initData:Object)
		{
			if (hasBeenInit == false)
			{
				addBackground();
				addChild(firstScreenInterface);
				
				//Buttons
				firstScreenInterface.addBtn(0, "Play", 400, 240, Filters.addOutline(0x4A8109), null, levelBrowserClick);
				firstScreenInterface.addBtn(1, "setup", 209, 381, null, null, setupClick); 
				firstScreenInterface.addBtn(1, "menu", 312, 381, null, null, menuClick);
				firstScreenInterface.addBtn(1, "help", 415, 381, null, null, helpClick);
				firstScreenInterface.addBtn(1, "about", 518, 381, null, null, aboutClick);
				
				//Notif
				firstScreenInterface.addNotif("Player1", 400, 310, 165, 40, false, null, Filters.addShadow(0x62227F));
				
				hasBeenInit = true;
			}	
		}
		
		private function levelBrowserClick(e:Event)
		{
			trace("level browser click!");
			super.requestContent(1, new Object());
		}
		
		private function setupClick(e:Event)
		{
			trace("setup click!");
		}
		
		private function menuClick(e:Event)
		{
			trace("menu click!");
		}
		
		private function helpClick(e:Event)
		{
			trace("help click!");
		}
		
		private function aboutClick(e:Event)
		{
			trace("about click!");
		}
		
		//{ region Backgrounds
		
		public function addBackground()
		{
			backgroundDisplay.addBackground();
			addChildAt(backgroundDisplay, 0);
		}
		
		//} endregion
		
		public function resizeElements(w:Number, h:Number)
		{
			backgroundDisplay.resize(w, h);
		}		
		
	}

}