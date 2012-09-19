package view.screens 
{

	import flash.display.*;
	import flash.events.Event;
	import view.*;
	import view.util.ContentRequester;
	import view.util.Filters;
	import view.customInterfaces.*;
	import view.util.IResizableElement;
	
	public class FirstScreen extends ContentRequester implements IResizableElement
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
				//addBackground(1);
				addChild(firstScreenInterface);
				//addChild(panelInterface);
				
				hasBeenInit = true;
			}	
		}
		
		override public function resizeElements(sizeX:Number, sizeY:Number)
		{
			//backgroundInterface.resize(sizeX, sizeY);
			//firstScreenInterface.resize(sizeX, sizeY);
			centerElements(sizeX, sizeY);
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
		
		//{ region ResizableElement
		
		//ToDo later!
		public function resizeElementsLarge()
		{
			//large buttons
		}
		
		public function placeElementsSmall()
		{
			trace("Small");
			//Buttons
			firstScreenInterface.addBtn("Text", "Play", 41, 0, Filters.addOutline(0x4A8109), null, levelBrowserClick);
			firstScreenInterface.addBtn("CircleGreen", "Setup", 0, 150, null, null, setupClick); 
			firstScreenInterface.addBtn("CircleGreen", "Menu", 60, 150, null, null, menuClick);
			firstScreenInterface.addBtn("CircleGreen", "Help", 120, 150, null, null, helpClick);
			firstScreenInterface.addBtn("CircleGreen", "About", 180, 150, null, null, aboutClick);
			
			//Notif
			firstScreenInterface.addNotif("Player1", 45, 90, 165, 40, false, null, Filters.addShadow(0x62227F));
		}
		
		//Astai bun
		public function placeElementsMedium()
		{
			trace("Medium");
			//Buttons
			firstScreenInterface.addBtn("Text", "Play", 81, 0, Filters.addOutline(0x4A8109), null, levelBrowserClick);
			firstScreenInterface.addBtn("CircleGreen", "Setup", 0, 215, null, null, setupClick); 
			firstScreenInterface.addBtn("CircleGreen", "Menu", 90, 215, null, null, menuClick);
			firstScreenInterface.addBtn("CircleGreen", "Help", 180, 215, null, null, helpClick);
			firstScreenInterface.addBtn("CircleGreen", "About", 270, 215, null, null, aboutClick);
			
			//Notif
			firstScreenInterface.addNotif("Player1", 85, 90, 165, 40, false, null, Filters.addShadow(0x62227F));
		}
		
		public function placeElementsLarge()
		{
			trace("Large");
			//Buttons
			firstScreenInterface.addBtn("Text", "Play", 81, 0, Filters.addOutline(0x4A8109), null, levelBrowserClick);
			firstScreenInterface.addBtn("CircleGreen", "Setup", 0, 215, null, null, setupClick); 
			firstScreenInterface.addBtn("CircleGreen", "Menu", 90, 215, null, null, menuClick);
			firstScreenInterface.addBtn("CircleGreen", "Help", 180, 215, null, null, helpClick);
			firstScreenInterface.addBtn("CircleGreen", "About", 270, 215, null, null, aboutClick);
			
			//Notif
			firstScreenInterface.addNotif("Player1", 85, 90, 165, 40, false, null, Filters.addShadow(0x62227F));
		}
		
		public function centerElements(sizeX:int,sizeY:int)
		{
			firstScreenInterface.x = (sizeX  - firstScreenInterface.width) / 2;
			firstScreenInterface.y = (sizeY - firstScreenInterface.height) / 2;
		}
		
		//} endregion
		
	}

}