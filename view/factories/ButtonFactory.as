package view.factories 
{

	import flash.display.*;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.*;
	import flash.utils.getDefinitionByName;
	
	public class ButtonFactory extends Sprite
	{	
		public function ButtonFactory() 
		{
			
		}
		
		
		/* Templates:
		 * 0 - generic text button
		 * 1 - cicle green template
		 * 2 - circle blue template
		 * 3 - square green template
		 */
		public function createTmpl(tmpl:String):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			if (tmpl != "Blank")
			{
				var tmplClass:Class = Class(getDefinitionByName("Tmpl" + tmpl));
				var tmplBm:Bitmap = new Bitmap(new tmplClass());
				sprite.addChild(tmplBm);
			}
			else
			{
				//Adauga un sprite invizibil pentru clickabilitate?
			}
			
			return sprite;
		}
		
		public function createSymb(symb:String):Sprite
		{
			var sprite:Sprite = new Sprite();
			
			if (symb != "Blank")
			{
				var symbClass:Class = Class(getDefinitionByName("Symb" + symb));
				var symbBm:Bitmap = new Bitmap(new symbClass());
				sprite.addChild(symbBm);
			}
			
			return sprite;
		}
		
		public function createText(text:String = "Menu", glow:GlowFilter = null, shadow:DropShadowFilter = null):TextField
		{
			var textSize:int = 35;
			var textFont:Font = new HoboStd(); 
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
	}

}