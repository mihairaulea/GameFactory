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
		var currWidth:int = 0;
		var currHeight:int = 0;
		
		public function Main()
		{
			loaderInfo.addEventListener(Event.COMPLETE, onCompleteInfo);
		}
		
		private function onCompleteInfo(e:Event)
		{
			setView();
			stage.addEventListener(Event.RESIZE, resizeHandler);
			currWidth = loaderInfo.height;
			currHeight = loaderInfo.width;
		}
		
		private function resizeHandler(e:Event)
		{
			currHeight = stage.stageHeight;
			currWidth = stage.stageWidth;
			//trace(currWidth + "|" + currHeight);
			viewInst.resizeElements(currWidth, currHeight);
		}
		
		private function setView()
		{
			addChild(viewInst);
			viewInst.addEventListener(CustomInterface.BUTTON_TRIGGER, buttonTriggerHandler);
			
			//viewInst.addNotif("Player: Guest", 50, 50, 150, 60, true, null, Filters.addShadow(0x62227F));
			//viewInst.addNotif("Notification disabled", 50, 200, 150, 35, false);
			//viewInst.removeNotif(viewInst.notifArray[1]);
			
			//viewInst.addBtn(1, "help" , 300, 300);
			//viewInst.addBtn(0, "Play" , 300,150,Filters.addOutline(0x4A8109));
			//viewInst.removeBtn(viewInst.buttonArray[1]);
			
			viewInst.addBackground(800, 480);
		}
		
		private function buttonTriggerHandler(e:Event)
		{
			trace("Button was clicked");
		}
		
	}

}