package com.alphabeticaldisorder.nbe.vo
{
	public class RangeVO
	{
		
		public var min:int;
		public var max:int;
		public var value:int;
		
		public function RangeVO(min:int = 0, max:int = 0, value:int = 0)
		{
			this.min = min;
			this.max = max;
			this.value = value;
		}
	}
}