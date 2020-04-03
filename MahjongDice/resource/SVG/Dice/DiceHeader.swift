//
//  DiceHeader.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit.UIView

extension SVGBuilder {
	enum Dice {
		case _1, _2, _3, _4, _5, _6
		var name: String {
			switch self {
				case ._1: return "dice-six-faces-one"
				case ._2: return "dice-six-faces-two"
				case ._3: return "dice-six-faces-three"
				case ._4: return "dice-six-faces-four"
				case ._5: return "dice-six-faces-five"
				case ._6: return "dice-six-faces-six"
			}
		}
	}
	func makeDiceView(for dice: Dice) -> UIView {
		makeUIView(name: dice.name)
	}
}

