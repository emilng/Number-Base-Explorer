package com.alphabeticaldisorder.nbe.model 
{
	import com.alphabeticaldisorder.nbe.vo.RangeVO;
	
	import org.osflash.signals.Signal;

	/**
	 * ...
	 * @author Emil Ng
	 */
	public class Model
	{
		private const MAXBASE:int = 255;
		
		private var _base:int = 2;
		private var _number:int = 0;
		private var _hsize:int = 10;
		private var _hgap:int = 0;
		private var _vsize:int = 10;
		private var _vgap:int = 0;
		private var _colSpacing:int = 0;
		private var _colorList:Vector.<Vector.<int>> = new Vector.<Vector.<int>>();
		private var _primes:Vector.<int>;
		private var _bgShade:int = 153;
		
		public var baseRange:RangeVO;
		public var numberRange:RangeVO;
		public var hSizeRange:RangeVO
		public var hGapRange:RangeVO
		public var vSizeRange:RangeVO
		public var vGapRange:RangeVO
		public var colSpacingRange:RangeVO
		public var bgShadeRange:RangeVO
		
		public var baseUpdated:Signal;
		public var numberUpdated:Signal;
		public var hSizeUpdated:Signal;
		public var hGapUpdated:Signal;
		public var vSizeUpdated:Signal;
		public var vGapUpdated:Signal;
		public var colSpacingUpdated:Signal;
		public var bgShadeUpdated:Signal;
		
		public function Model() 
		{
			init();
		}
		
		private function init():void {
			for (var i:int = 0; i < MAXBASE; i++) 
			{
				_colorList.push(getBaseColors(i));
			}
			
			baseRange 		= new RangeVO(2, 254, 	_base);
			numberRange 	= new RangeVO(0, 10000, _number);
			hSizeRange 		= new RangeVO(1, 200, 	_hsize);
			hGapRange 		= new RangeVO(0, 80, 	_hgap);
			vSizeRange 		= new RangeVO(1, 200, 	_vsize);
			vGapRange 		= new RangeVO(0, 80,	_vgap);
			colSpacingRange = new RangeVO(0, 30, 	_colSpacing);
			bgShadeRange 	= new RangeVO(0, 254, 	_bgShade);
			
			baseUpdated 		= new Signal();
			numberUpdated 		= new Signal(); 
			hSizeUpdated		= new Signal();
			hGapUpdated			= new Signal();
			vSizeUpdated		= new Signal();
			vGapUpdated			= new Signal();
			colSpacingUpdated	= new Signal();
			bgShadeUpdated		= new Signal();
			
//			generatePrimes();
		}
		
		//create color list of digits in base to colors from lightest = lowest to darkest = highest
		private function getBaseColors(base:int):Vector.<int> {
			
			var colors:Vector.<int> = new Vector.<int>();
			
			if (base < 2 || base > 255)
				return colors;
				
			for (var i:int = 0; i < base; i++) {
				var shade:int = 255 - (i/(base-1) * 255);
				var r:int = shade << 16;
				var g:int = shade << 8;
				var b:int = shade;
				var rgb:int = r + g + b;
				colors.push(rgb);
			}
			//trace("colors for base + " + base + " , " + colors);
			return colors;
		}
		
		private function generatePrimes():void {
			_primes = new Vector.<int>();
			var primeCount:int = 10001;
			var i:int;
			var prime:int;
			_primes.push(2);
			var currentNum:int = 3;
			var isPrime:Boolean;
			var loopCounter:int = 0;
			var loopLimit:int = primeCount * 200;
			while (_primes.length < primeCount) {
				isPrime = true;
				for (i = 0; i < _primes.length; i++) {
					if (currentNum % _primes[i] == 0) {
						isPrime = false;
						break;
					}
				}
				if (isPrime)
					_primes.push(currentNum);
				currentNum++;
				loopCounter++;
				if (loopCounter > loopLimit)
					break;
			}
			//trace(_primes);
		}
		
		
		public function get primes():Vector.<int> { return _primes; }
		
		public function get colorList():Vector.<Vector.<int>> { return _colorList; }
		
		public function get base():int { return _base; }
		
		public function set base(value:int):void 
		{
			_base = value;
			baseRange.value = value;
			baseUpdated.dispatch();
		}
		
		public function get number():int { return _number; }
		
		public function set number(value:int):void 
		{
			_number = value;
			numberRange.value = value;
			numberUpdated.dispatch();
		}
		
		public function get hsize():int { return _hsize; }
		
		public function set hsize(value:int):void 
		{
			_hsize = value;
			hSizeRange.value = value;
			hSizeUpdated.dispatch();
		}
		
		public function get hgap():int { return _hgap; }
		
		public function set hgap(value:int):void 
		{
			_hgap = value;
			hGapRange.value = value;
			hGapUpdated.dispatch();
		}
		
		public function get vsize():int { return _vsize; }
		
		public function set vsize(value:int):void 
		{
			_vsize = value;
			vSizeRange.value = value;
			vSizeUpdated.dispatch();
		}
		
		public function get vgap():int { return _vgap; }
		
		public function set vgap(value:int):void 
		{
			_vgap = value;
			vGapRange.value = value;
			vGapUpdated.dispatch();
		}
		
		public function get colSpacing():int { return _colSpacing; }
		
		public function set colSpacing(value:int):void 
		{
			_colSpacing = value;
			colSpacingRange.value = value;
			colSpacingUpdated.dispatch();
		}
		
		public function get bgShade():int { return _bgShade; }

		public function set bgShade(value:int):void 
		{
			_bgShade = value;
			bgShadeRange.value = value;
			bgShadeUpdated.dispatch();
		}
	}

}