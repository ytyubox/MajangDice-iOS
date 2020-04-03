//
//  Postion.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation

enum Postion:Int {
	case _1 = 0, _2,_3,_4
	init(v: Int) {
		if v == 18 {self.init(rawValue: 0)!; return}
		let i = v % 4 - 1
		self.init(rawValue: i >= 0 ? i : 3)!
	}
}
