package view.util 
{
	import fl.motion.Color;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.display.Sprite;  
    import flash.display.GradientType;  
    import flash.geom.Matrix;  
	
	public class Filters 
	{
		
		public function Filters() 
		{
			
		}
		
		//General filters
		
		
		//{ region Text filters
		
		public static function addOutline(color:Object = 0xFFFFFF, alpha:int = 1, size:int = 6, strength:int = 10):GlowFilter
		{
			var outline:GlowFilter = new GlowFilter(uint(color), alpha, size, size, 10, 1, false, false);
			return outline;
		}
		
		public static function addShadow( color:Object = 0xFFFFFF, distance:int = 3, angle:int = 45, size:int = 2, strength:int = 10)
		{
			var shadow:DropShadowFilter = new DropShadowFilter(distance, angle, uint(color), 1, size, size, strength, 1, false, false, false);
			return shadow;
		}
		
		//} endregion
		
	}

}