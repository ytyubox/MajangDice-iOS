//
//  DiceCalculator.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation

struct DiceCalculator {
	init() { }
	var rowTotal = 18
	func calculate(_ nb:Int) -> DiceResult {
		if nb == 18 {
			return DiceResult(._1, 1, 17)
		}
		let fromLeft = nb
		let fromRight = 18 - fromLeft
		return DiceResult(Postion(v:nb),fromLeft, fromRight)
	}
	struct DiceResult:Equatable {
		init(
			_ start:Postion,
			_ fromRight:Int,
			_ fromLeft:Int
		) {
			self.start = start
			self.fromRight = fromRight
			self.fromLeft = fromLeft
			
		}
		var start:Postion
		var fromRight:Int
		var fromLeft:Int
	}
}

