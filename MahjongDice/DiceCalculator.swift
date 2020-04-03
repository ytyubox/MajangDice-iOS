//
//  DiceCalculator.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation

public struct DiceCalculator {
	public init() { }
	var rowTotal = 18
	public func calculate(_ nb:Int) -> DiceResult {
		if nb == 18 {
			return DiceResult(1, 1, 17)
		}
		let start = nb % 4
		let fromLeft = nb
		let fromRight = 18 - fromLeft
		return DiceResult(start,fromLeft, fromRight)
	}
	public struct DiceResult:Equatable {
		public init(
			_ start:Int,
			_ fromRight:Int,
			_ fromLeft:Int
		) {
			self.start = start
			self.fromRight = fromRight
			self.fromLeft = fromLeft
			
		}
		public var start:Int
		public var fromRight:Int
		public var fromLeft:Int
	}
}

