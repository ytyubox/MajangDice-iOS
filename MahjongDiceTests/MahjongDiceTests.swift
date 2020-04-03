//
//  MahjongDiceTests.swift
//  MahjongDiceTests
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import XCTest
@testable import MahjongDice

class MahjongDiceTests: XCTestCase {
	
	typealias R = DiceCalculator.DiceResult
	
	func testDiceCalculator() {
		var cal = DiceCalculator()
		do {
			let t = 3
			let expect = R(3,3,15)
			let result = cal.calculate(t)
			XCTAssertEqual(result, expect)
		}
		do {
			let t = 5
			let expect = R(1,5,13)
			let result = cal.calculate(t)
			XCTAssertEqual(result, expect)
		}
		do {
			let t = 18
			let expect = R(1,1,17)
			let result = cal.calculate(t)
			XCTAssertEqual(result, expect)
		}
	}
}
