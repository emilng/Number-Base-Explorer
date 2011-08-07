package com.alphabeticaldisorder.nbe.views 
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import com.alphabeticaldisorder.nbe.vo.RangeVO;
	import com.bit101.components.HUISlider;
	import com.bit101.components.Window;
	
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Emil Ng
	 */
	public class SliderPanel extends Sprite
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
		
		public function SliderPanel(model:Model) 
		{
			_model = model;
			init();
		}
		
		private function init():void {
			
			_window = new Window(this, 10, 10, "Slider Panel");
			_window.width = 720;
			_window.height = 120;
			_window.draggable = true;
			_window.hasMinimizeButton = true;
			
			_baseSlider = new HUISlider(_window, 10, 0, "Base", bind("base"));
			initSlider(_baseSlider, 550, _model.baseRange);
			
			_numSlider = new HUISlider(_window, 10, 20, "Number", bind("number"));
			initSlider(_numSlider, 550, _model.numberRange);
			
			_hsizeSlider = new HUISlider(_window, 10, 40, "HSize", bind("hsize"));
			initSlider(_hsizeSlider, 350, _model.hsizeRange);
			
			_hgapSlider = new HUISlider(_window, 360, 40, "HGap", bind("hgap"));
			initSlider(_hgapSlider, 350, _model.hgapRange);
			
			_vsizeSlider = new HUISlider(_window, 10, 60, "VSize", bind("vsize"));
			initSlider(_vsizeSlider, 350, _model.vsizeRange);
			
			_vgapSlider = new HUISlider(_window, 360, 60, "VGap", bind("vgap"));
			initSlider(_vgapSlider, 350, _model.vgapRange);
			
			_bgShadeSlider = new HUISlider(_window, 10, 80, "BG Shade", bind("bgShade"));
			initSlider(_bgShadeSlider, 350, _model.bgShadeRange);
			
			_columnSpacingSlider = new HUISlider(_window, 360, 80, "Col Spacing", bind("colSpacing"));
			initSlider(_columnSpacingSlider, 350, _model.colSpacingRange);
			
		}
		
		private function initSlider(slider:HUISlider, width:int, range:RangeVO):void {
			slider.width = width;
			slider.setSliderParams(range.min, range.max, range.value);
		}
		
		private function bind(property:String):Function {
			return function (evt:Event):void {
				_model[property] = (evt.target as HUISlider).value;
			}
		}
		
	}

}