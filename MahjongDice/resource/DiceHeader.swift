//
//  DiceHeader.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit.UIView

enum Dice:Int {
	case _1=1, _2, _3, _4, _5, _6
	private var name: String {
		switch self {
			case ._1: return "dice-six-faces-one"
			case ._2: return "dice-six-faces-two"
			case ._3: return "dice-six-faces-three"
			case ._4: return "dice-six-faces-four"
			case ._5: return "dice-six-faces-five"
			case ._6: return "dice-six-faces-six"
		}
	}
	internal var image:UIImage {
		switch self {
			case ._1: return Self._1View
			case ._2: return Self._2View
			case ._3: return Self._3View
			case ._4: return Self._4View
			case ._5: return Self._5View
			case ._6: return Self._6View
		}
	}
	private static let _1View:UIImage = UIImage(named: Self._1.name)!
	private static let _2View:UIImage = UIImage(named: Self._2.name)!
	private static let _3View:UIImage = UIImage(named: Self._3.name)!
	private static let _4View:UIImage = UIImage(named: Self._4.name)!
	private static let _5View:UIImage = UIImage(named: Self._5.name)!
	private static let _6View:UIImage = UIImage(named: Self._6.name)!
}
extension Dice: CaseIterable {}
extension Dice {
	internal static func random()-> Self {
		allCases.randomElement()!
	}
}
