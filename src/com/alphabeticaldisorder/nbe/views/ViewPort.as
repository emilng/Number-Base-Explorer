package com.alphabeticaldisorder.nbe.views 
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Emil Ng
	 */
	public class ViewPort extends Sprite
	{
		private var _model:Model;
		
		public function ViewPort(model:Model) 
		{
			_model = model;
			init();
		}
		
		private var _bmp:Bitmap;
		private var _bmd:BitmapData;
		private var _rect:Rectangle;
		private var _colorList:Vector.<Vector.<int>>;
		private var _view:Sprite;
		
		private function init():void {
			_model.baseUpdated.add(render);
			_model.numberUpdated.add(render);
			_model.hSizeUpdated.add(render);
			_model.hGapUpdated.add(render);
			_model.vSizeUpdated.add(render);
			_model.vGapUpdated.add(render);
			_model.colSpacingUpdated.add(render);
			_model.bgShadeUpdated.add(render);
			
			_bmd = new BitmapData(780, 520, false, 0x999999);
			_bmp = new Bitmap(_bmd);
			_bmp.x = 10;
			_bmp.y = 150;
			this.addChild(_bmp);
			
			_rect = new Rectangle(0, 0, _bmd.width, _bmd.height);
			_colorList = _model.colorList;
			
			render();
		}
		
		private var _numCount:int;
		
		private var _startInt:int;
		private var _endInt:int;
		private var _base:int;
		private var _r:Vector.<int>;
		
		private var i:int;
		private var j:int;
		private var k:int;
		private var _rlen:int;
		private var _hsize:int;
		private var _vsize:int;
		private var _vgap:int;
		private var _hgap:int;
		private var _cols:int;
		private var _colGap:int;
		private var _colX:int = 0;
		private var _bmdWidth:int;
		private var _bgColor:int;
		
		private function render():void {
//			renderPrimes();
//			return;
			_rect.x = 0;
			_rect.y = 0;
			_rect.width = _bmdWidth = _bmd.width;
			_rect.height = _bmd.height;
			
			_bgColor = _model.bgShade;
			
			_bmd.fillRect(_rect, (_bgColor << 16) + (_bgColor << 8) + _bgColor);
			
			_vgap = _model.vgap;
			_hgap = _model.hgap;
			
			_numCount = 520 / (_model.vsize + _model.vgap);

			var maxHeight:int = 550;
			var startX:int = 0;
			_colGap = _model.colSpacing;
			
			_startInt = _model.number;
			_endInt = _startInt + _numCount;
			_base = _model.base;
			_vsize = _model.vsize;
			_hsize = _model.hsize;
			_rect.width = _hsize;
			_rect.height = _vsize;
			_colX = 0;
			k = 0;
			
			_bmd.lock();
			
			while (_colX < _bmdWidth) {
				var colStart:int = _startInt + (k * _numCount);
				var colEnd:int = colStart + _numCount;
				for (i = colStart; i < colEnd; i++) {
					_r = convertToBase(i, _base);
					_rlen = _r.length;
					var colors:Vector.<int> = _colorList[_base];
					_rect.y = (i - colStart) * (_vsize+_vgap);
					for (j = 0; j < _rlen; j++) 
					{
						_rect.x = _colX + j * (_hsize + _hgap);
						_bmd.fillRect(_rect, colors[_r[j]]);
					}
				}
				_colX = _rect.x + _hsize + _hgap + _colGap;
				k++;
			}
			
			_bmd.unlock();
		}
		
		private function renderPrimes():void {
			_rect.x = 0;
			_rect.y = 0;
			_rect.width = _bmdWidth = _bmd.width;
			_rect.height = _bmd.height;
			
			_bgColor = _model.bgShade;
			
			_bmd.fillRect(_rect, (_bgColor << 16) + (_bgColor << 8) + _bgColor);
			
			_vgap = _model.vgap;
			_hgap = _model.hgap;
			
			_numCount = 520 / (_model.vsize + _model.vgap);

			var maxHeight:int = 550;
			var startX:int = 0;
			_colGap = _model.colSpacing;
			
			_startInt = _model.number;
			_endInt = _startInt + _numCount;
			_base = _model.base;
			_vsize = _model.vsize;
			_hsize = _model.hsize;
			_rect.width = _hsize;
			_rect.height = _vsize;
			_colX = 0;
			k = 0;
			
			_bmd.lock();
			var primes:Vector.<int> = _model.primes;
			
			while (_colX < _bmdWidth) {
				var colStart:int = _startInt + (k * _numCount);
				var colEnd:int = colStart + _numCount;
				for (i = colStart; i < colEnd; i++) {
					if (i > primes.length-1)
						break;
					_r = convertToBase(primes[i], _base);
					_rlen = _r.length;
					var colors:Vector.<int> = _colorList[_base];
					_rect.y = (i - colStart) * (_vsize+_vgap);
					for (j = 0; j < _rlen; j++) 
					{
						_rect.x = _colX + j * (_hsize + _hgap);
						_bmd.fillRect(_rect, colors[_r[j]]);
					}
				}
				if (i > primes.length - 1)
					break;
				_colX = _rect.x + _hsize + _hgap + _colGap;
				k++;
			}
			
			_bmd.unlock();
		}
		
		private function convertToBase(number:int, base:int):Vector.<int> {
			var digits:Vector.<int> = new Vector.<int>();
			var r:int = 0;
			var num:int = number;
			
			while (num > 1) {
				r = num % base;
				num = Math.floor(num/base);
				digits.push(r);
			}
			if (num == 1)
				digits.push(num);
			return digits;
		}
	}

}