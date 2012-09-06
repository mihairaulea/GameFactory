package view.screens 
{

	import flash.display.*;
	import flash.events.Event;
	import view.*;
	import view.util.ContentRequester;
	import view.util.Filters;
	import view.customInterfaces.*;
	
	public class FirstScreen extends ContentRequester
	{
		
		
		private var backgroundInterface:BackgroundInterface = new BackgroundInterface();
		private var firstScreenInterface:CustomInterface = new CustomInterface();
		private var panelInterface:PanelInterface = new PanelInterface();
		
		private var hasBeenInit:Boolean = false;
		
		public function FirstScreen() 
		{
			
		}
		
		override public function init(initData:Object)
		{
			if (hasBeenInit == false)
			{
				addBackground(1);
				addChild(firstScreenInterface);
				addChild(panelInterface);
				
				//Buttons
				firstScreenInterface.addBtn("Text", "Play", 400, 240, Filters.addOutline(0x4A8109), null, levelBrowserClick);
				firstScreenInterface.addBtn("CircleGreen", "Setup", 209, 381, null, null, setupClick); 
				firstScreenInterface.addBtn("CircleGreen", "Menu", 312, 381, null, null, menuClick);
				firstScreenInterface.addBtn("CircleGreen", "Help", 415, 381, null, null, helpClick);
				firstScreenInterface.addBtn("CircleGreen", "About", 518, 381, null, null, aboutClick);
				
				//Notif
				firstScreenInterface.addNotif("Player1", 400, 310, 165, 40, false, null, Filters.addShadow(0x62227F));
				
				hasBeenInit = true;
			}	
		}
		
		override public function resizeElements(sizeX:Number, sizeY:Number)
		{
			backgroundInterface.resize(sizeX, sizeY);
			firstScreenInterface.resize(sizeX, sizeY);
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
			panelInterface.addCreditsPanel(["Mihai Raulea", "Raluca Borangic"], ["Programmer", "Graphic design"], ["mihai.raulea@geekvillage.eu", "spiraluca@yahoo.com"], 400, 100, null, 25);
		}
		
		//{ region Backgrounds
		
		public function addBackground(nr:int)
		{
			backgroundInterface.addBackground(nr);
			addChildAt(backgroundInterface, 0);
		}
		
		//} endregion		
		
	}

}