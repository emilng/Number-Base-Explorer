package com.alphabeticaldisorder.nbe.views
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import com.bit101.components.RadioButton;
	import com.bit101.components.Window;
	
	import flash.display.Sprite;
	
	public class XYPanel extends Sprite
	{
		private var _window:Window;
		private var _model:Model;
		
		private var _xBase:RadioButton;
		private var _xNum:RadioButton;
		private var _xhSize:RadioButton;
		private var _xhGap:RadioButton;
		private var _xvSize:RadioButton;
		private var _xvGap:RadioButton;
		private var _xColSpacing:RadioButton;
		private var _xbgShade:RadioButton;
		
		private var _yBase:RadioButton;
		private var _yNum:RadioButton;
		private var _yhSize:RadioButton;
		private var _yhGap:RadioButton;
		private var _yvSize:RadioButton;
		private var _yvGap:RadioButton;
		private var _yColSpacing:RadioButton;
		private var _ybgShade:RadioButton;
		
		private var _names:Array = ["base", "num", "hSize", "hGap", "vSize", "vGap", "colSpacing", "bgShade"];
		
		public function XYPanel(model:Model)
		{
			_model = model;
			init();
		}
		
		private function init():void
		{
			_window = new Window(this, 10, 30, "XY Panel");
			_window.width = 720;
			_window.height = 120;
			_window.draggable = true;
			_window.hasMinimizeButton = true;
			
			addRadioGroup(10, "x");
			addRadioGroup(50, "y");
		}
		
		private function addRadioGroup(x:int, groupName:String):void {
			var yPos:int = 10;
			var active:Boolean = true;
			for each (var name:String in _names) {
				addRadioButton(x, yPos, name, active, groupName);
				yPos += 20;
				active = false;
			}
		}
		
		private function addRadioButton(x:int, y:int, name:String, active:Boolean, groupName:String):void {
			var newRadioButton:RadioButton = new RadioButton(_window, x, y, name, active);
			newRadioButton.groupName = groupName;
		}
	}
}