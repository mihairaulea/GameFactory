package  
{
	import fl.motion.Color;
	import flash.display.*;
	import flash.filters.GlowFilter;
	import flash.text.*;
	import flash.events.*;

	import view.*;
	import view.util.*;
	
	public class Main extends MovieClip
	{
		var viewInst:CustomInterface = new CustomInterface();
		var currWidth:int = 800;
		var currHeight:int = 480;
		
		public function Main()
		{
			loaderInfo.addEventListener(Event.COMPLETE, onCompleteInfo);
			setView();
		}
		
		private function onCompleteInfo(e:Event)
		{
			stage.addEventListener(Event.RESIZE, resizeHandler);
			currWidth = loaderInfo.height;
			currHeight = loaderInfo.width;
		}
		
		private function resizeHandler(e:Event)
		{
			currHeight = stage.stageHeight;
			currWidth = stage.stageWidth;
			viewInst.resizeElements(currWidth, currHeight);
		}
		
		private function setView()
		{
			addChild(viewInst);
			viewInst.addEventListener(CustomInterface.BUTTON_TRIGGER, buttonTriggerHandler);
			
			//viewInst.addNotif("Notification disabled", 50, 200, 150, 35, false);
			//viewInst.removeNotif(viewInst.notifArray[1]);
			
			//viewInst.addBtn(1, "help" , 300, 300);
			//viewInst.removeBtn(viewInst.buttonArray[1]);
			
			viewInst.addBtn(0, "Play" , currWidth / 2, currHeight / 2, Filters.addOutline(0x4A8109));
			viewInst.addNotif("Player: Guest", currWidth /2, currHeight/2, 200, 200, true, null, Filters.addShadow(0x62227F));
			viewInst.addBackground(800, 480);		
		}
		
		private function buttonTriggerHandler(e:Event)
		{
			trace("Button was clicked");
		}
		
	}

}