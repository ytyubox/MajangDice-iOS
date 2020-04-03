//
//  ViewController.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet private weak var _1_diceView: DiceView!
	@IBOutlet private weak var _2_diceView: DiceView!
	@IBOutlet private weak var _3_diceView: DiceView!
	private let diceSource:Set<Dice> = Set(Dice.allCases)
	private var allDiceView:[DiceView] {
		[_1_diceView,
		 _2_diceView,
		 _3_diceView,]
	}
	fileprivate func genRamdomDice() {
		allDiceView.forEach{
			$0.setDice(for: .random())
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		allDiceView.forEach{
			$0.setup()
		}
		print(#function)
	}
	
	@IBAction func didTapReroll(_ sender: UIButton) {
		genRamdomDice()
	}
	
}

