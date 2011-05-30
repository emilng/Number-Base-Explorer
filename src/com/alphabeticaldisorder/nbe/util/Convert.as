package com.alphabeticaldisorder.nbe.util 
{
	/**
	 * ...
	 * @author Emil Ng
	 */
	public class Convert
	{
		
		public function Convert() 
		{
			
		}
		
		public static function numberToDigitArray(number:int, base:int):Array {
			var digits:Array = [];
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