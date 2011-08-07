package com.alphabeticaldisorder.nbe.views
{
	import com.alphabeticaldisorder.nbe.component.XYSlider;
	import com.alphabeticaldisorder.nbe.model.Model;
	import com.alphabeticaldisorder.nbe.vo.RangeVO;
	import com.bit101.components.Label;
	import com.bit101.components.RadioButton;
	import com.bit101.components.Window;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.sampler.NewObjectSample;
	
	public class XYPanel extends Sprite
	{
		private var _window:Window;
		private var _model:Model;
		private var _xprop:String = "base";
		private var _yprop:String = "base";
		
		public var _xySlider:XYSlider;
		
		private var _xnames:Array = ["base", "number", "hsize", "hgap", "colSpacing", "bgShade"];
		private var _ynames:Array = ["base", "number", "vsize", "vgap", "colSpacing", "bgShade"];
		
		public function XYPanel(model:Model)
		{
			_model = model;
			init();
		}
		
		private function init():void
		{
			_window = new Window(this, 10, 30, "XY Panel");
			_window.width = 320;
			_window.height = 240;
			_window.draggable = true;
			_window.hasMinimizeButton = true;
			
			addRadioGroup(10, "X Axis", _xnames);
			addRadioGroup(80, "Y Axis", _ynames);
			
			_xySlider = new XYSlider(_window, 150, 10, updateSlider);
			_xySlider.width = 150;
			_xySlider.height = 150;
			_xySlider.setXSliderParams(_model.baseRange.min, _model.baseRange.max, _model.base);
			_xySlider.setYSliderParams(_model.baseRange.min, _model.baseRange.max, _model.base);
		}
		
		private function addRadioGroup(x:int, groupName:String, names:Array):void {
			new Label(_window, x, 10, groupName);
			
			
			
			var yPos:int = 50;
			var active:Boolean = true;
			for each (var name:String in names) {
				addRadioButton(x, yPos, name, active, groupName);
				yPos += 20;
				active = false;
			}
		}
		
		private function addRadioButton(x:int, y:int, label:String, active:Boolean, groupName:String):void {
			var newRadioButton:RadioButton = new RadioButton(_window, x, y, label, active, updateAxis);
			newRadioButton.groupName = groupName;
		}
		
		private function updateAxis(evt:Event):void {
			var radioButton:RadioButton = evt.target as RadioButton;
			if (radioButton.selected) {
				var property:String = radioButton.label;
				var range:RangeVO = _model[(property + "Range")] as RangeVO;
				if (radioButton.groupName == "X Axis") {
					_xySlider.setXSliderParams(range.min, range.max, _model[property]);
					_xprop = property;
				} else if (radioButton.groupName == "Y Axis") {
					_xySlider.setYSliderParams(range.min, range.max, _model[property]);
					_yprop = property;
				}
			}
		}
		
		private function updateSlider(evt:Event):void {
			_model[_xprop] = _xySlider.xvalue;
			_model[_yprop] = _xySlider.yvalue;
		}
	}
}