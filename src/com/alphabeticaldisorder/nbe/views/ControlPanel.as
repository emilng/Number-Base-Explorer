package com.alphabeticaldisorder.nbe.views 
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import com.bit101.components.HUISlider;
	import com.bit101.components.Window;
	
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Emil Ng
	 */
	public class ControlPanel extends Sprite
	{
		private var _window:Window;
		private var _baseSlider:HUISlider;
		private var _numSlider:HUISlider;
		private var _hsizeSlider:HUISlider;
		private var _hgapSlider:HUISlider;
		private var _vsizeSlider:HUISlider;
		private var _vgapSlider:HUISlider;
		private var _columnSpacingSlider:HUISlider;
		private var _bgShadeSlider:HUISlider;
		private var _model:Model;
		
		public function ControlPanel(model:Model) 
		{
			_model = model;
			init();
		}
		
		private function init():void {
			
			_window = new Window(this, 10, 10, "Control Panel");
			_window.width = 720;
			_window.height = 120;
			_window.draggable = true;
			_window.hasMinimizeButton = true;
			
			_baseSlider = new HUISlider(_window, 10, 0, "Base", updateBase);
			_baseSlider.width = 550;
			_baseSlider.setSliderParams(2, 254, _model.base);
			
			_numSlider = new HUISlider(_window, 10, 20, "Number", updateNumber);
			_numSlider.width = 550;
			_numSlider.setSliderParams(0, 10000, _model.number);
			
			_hsizeSlider = new HUISlider(_window, 10, 40, "HSize", updateHSize);
			_hsizeSlider.width = 350;
			_hsizeSlider.setSliderParams(1, 200, _model.hsize);
			
			_hgapSlider = new HUISlider(_window, 360, 40, "HGap", updateHGap);
			_hgapSlider.width = 350;
			_hgapSlider.setSliderParams(0, 80, _model.hgap);
			
			_vsizeSlider = new HUISlider(_window, 10, 60, "VSize", updateVSize);
			_vsizeSlider.width = 350;
			_vsizeSlider.setSliderParams(1, 200, _model.vsize);
			
			_vgapSlider = new HUISlider(_window, 360, 60, "VGap", updateVGap);
			_vgapSlider.width = 350;
			_vgapSlider.setSliderParams(0, 80, _model.vgap);
			
			_bgShadeSlider = new HUISlider(_window, 10, 80, "BG Shade", updateBgShade);
			_bgShadeSlider.width = 350;
			_bgShadeSlider.setSliderParams(0, 254, _model.bgShade);
			
			_columnSpacingSlider = new HUISlider(_window, 360, 80, "Col Spacing", updateColumnSpacing);
			_columnSpacingSlider.width = 350;
			_columnSpacingSlider.setSliderParams(0, 30, _model.colSpacing);
			
		}
		
		private function updateBase(evt:Event):void {
			_model.base = (evt.target as HUISlider).value;
		}
		
		private function updateNumber(evt:Event):void {
			_model.number = (evt.target as HUISlider).value;
		}
		
		private function updateHSize(evt:Event):void {
			_model.hsize = (evt.target as HUISlider).value;
		}
		
		private function updateHGap(evt:Event):void {
			_model.hgap = (evt.target as HUISlider).value;
		}
		
		private function updateVSize(evt:Event):void {
			_model.vsize = (evt.target as HUISlider).value;
		}
		
		private function updateVGap(evt:Event):void {
			_model.vgap = (evt.target as HUISlider).value;
		}
		
		private function updateColumnSpacing(evt:Event):void {
			_model.colSpacing = (evt.target as HUISlider).value;
		}
		
		private function updateBgShade(evt:Event):void {
			_model.bgShade = (evt.target as HUISlider).value;
		}
	}

}