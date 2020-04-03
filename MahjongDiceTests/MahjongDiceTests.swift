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
		let cal = DiceCalculator()
		do {
			let t = 3
			let expect = R(._3,3,15)
			let result = cal.calculate(t)
			XCTAssertEqual(result, expect)
		}
		do {
			let t = 5
			let expect = R(._1,5,13)
			let result = cal.calculate(t)
			XCTAssertEqual(result, expect)
		}
		do {
			let t = 18
			let expect = R(._1,1,17)
			let result = cal.calculate(t)
			XCTAssertEqual(result, expect)
		}
	}
	func testPostion() {

		XCTAssertEqual(Postion(v: 3), Postion._3)
		XCTAssertEqual(Postion(v: 4), Postion._4)
		XCTAssertEqual(Postion(v: 5), Postion._1)
		XCTAssertEqual(Postion(v: 6), Postion._2)
		XCTAssertEqual(Postion(v: 7), Postion._3)
		XCTAssertEqual(Postion(v: 18), Postion._1)
		
//		}
	}
}
