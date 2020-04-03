//
//  DiceView.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

final class DiceView: UIView {
	private var _dice = UIImageView()
	
	func setup() {
		
		_dice.translatesAutoresizingMaskIntoConstraints = false
		_dice.image = Dice.random().image
		addSubview(_dice)
		_dice.topAnchor.constraint(equalTo: topAnchor).isActive = true
		_dice.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		_dice.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		_dice.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}
	
	func setDice(for dice:Dice) {
		_dice.image = dice.image
	}
}

