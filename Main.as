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
		var viewInst:View = new View();//CustomInterface = new CustomInterface();
		var currWidth:int = 800;
		var currHeight:int = 480;
		
		public function Main()
		{
			loaderInfo.addEventListener(Event.COMPLETE, onCompleteInfo);
		}
		
		private function onCompleteInfo(e:Event)
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			currWidth = loaderInfo.width;
			currHeight = loaderInfo.height;
			setView();
			viewInst.resizeElements(currWidth, currHeight);
			stage.addEventListener(Event.RESIZE, resizeHandler);
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
			viewInst.initView();
		}
		
		private function buttonTriggerHandler(e:Event)
		{
			trace("Button was clicked");
		}
		
	}

}