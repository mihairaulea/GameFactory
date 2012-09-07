package view.displays 
{
	import flash.display.*;
	import flash.events.*;
	import fl.controls.Slider;
	
	public class SliderDisplay extends Sprite
	{
		private var slider:Slider = new Slider();
		
		private var minVal:int = 0;
		private var maxVal:int = 100;
		private var val:int = 100;
		private var tickInterval:int = 10;
		private var snapInterval:int = 2;
		
		private var liveDragging:Boolean = true;
		
		public function SliderDisplay() 
		{
			
		}
		
		public function init()
		{
			slider.width = 100;
			slider.minimum = minVal;
			slider.maximum = maxVal;
			slider.value = val;
			slider.tickInterval = tickInterval;
			slider.snapInterval = snapInterval;
			
			slider.liveDragging = liveDragging;
			
			slider.addEventListener(Event.CHANGE, sliderChangedHandler);
		}
		
		private function sliderChangedHandler(e:Event)
		{
			//dispatch event with value
		}
	}

}