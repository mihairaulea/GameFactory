package view.factories 
{
	import flash.display.*;
	import flash.geom.Matrix;
	import flash.text.*;
	import flash.filters.*;
	import flash.utils.getDefinitionByName;

	public class NotificationFactory extends Sprite
	{
		
		public function NotificationFactory() 
		{
			
		}
		
		public function createTmpl(syzeX:int,syzeY):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			var roundRect:Shape = new Shape();
			roundRect.graphics.lineStyle(0, 0x000000, 0);
			roundRect.graphics.beginFill(0x000000, 0.4);
			roundRect.graphics.drawRoundRect(0, 0, syzeX, syzeY, 10, 10);
			roundRect.graphics.endFill();

			sprite.addChild(roundRect);
			return sprite;
		}
		
		public function createTmplGradient(syzeX:int, syzeY:int, gradientArray:Array):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			var roundRect:Shape = new Shape();
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(syzeX, syzeY,toRad(-90), 0, 0);

			roundRect.graphics.lineStyle(0, 0x000000, 0);
			roundRect.graphics.beginGradientFill(GradientType.LINEAR, gradientArray, [1, 1], [0, 255], matrix);
			roundRect.graphics.drawRoundRect(0, 0, syzeX, syzeY, 10, 10);
			roundRect.graphics.endFill();
			
			sprite.addChild(roundRect);
			return sprite;
		}
		
		public function createText(text:String = "Notification", glow:GlowFilter = null, shadow:DropShadowFilter = null, textSize:int = 20, font:String = "HoboStd"):TextField
		{
			var fontClass:Class = Class(getDefinitionByName(font));
			var textFont:Font = new fontClass(); 
			var textColor:Object = 0xFFFFFF;
			var bold:Boolean = false;
			var underlined:Boolean = false;
			var alignment:String = "center";
			
			var textField:TextField = new TextField();
			var textFormat:TextFormat = new TextFormat(textFont.fontName, textSize, textColor, bold, false, underlined, null, null, alignment);
			
			textField.defaultTextFormat = textFormat;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.embedFonts = true;
			textField.antiAliasType = AntiAliasType.ADVANCED;
			textField.multiline = false;
			textField.selectable = false;
			
			if( glow != null && shadow != null)
				textField.filters = [glow, shadow];
			else if ( glow != null)
				textField.filters = [glow];
			else if ( shadow != null)
				textField.filters = [shadow];
			
			textField.text = text;
			return textField;
		}
		
		function toRad(a:Number):Number {
			return a*Math.PI/180;
		}
		
		
	}

}