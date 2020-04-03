//
//  ViewController.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet private weak var _1_diceView: UIView!
	@IBOutlet private weak var _2_diceView: UIView!
	@IBOutlet private weak var _3_diceView: UIView!
	private let diceSource:Set<Dice> = Set(Dice.allCases)
	private var allDiceView:[UIView] {
		[_1_diceView,
		 _2_diceView,
		 _3_diceView,]
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	
}

