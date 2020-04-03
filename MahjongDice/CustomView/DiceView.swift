//
//  DiceView.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

final class DiceView: UIView {
	private var _dice:UIView!
	
	func setDice(for dice:Dice) {
		_dice?.removeFromSuperview()
		_dice = dice.uiview(bound: bounds)
		addSubview(_dice)
	}
}

