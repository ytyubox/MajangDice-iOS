//
//  ViewController.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
	@IBOutlet private weak var hintLabel: UILabel!
	@IBOutlet private weak var leftNumberLabel: UILabel!
	@IBOutlet private weak var rightNumberLabel: UILabel!
	@IBOutlet private weak var _1_diceView: DiceView!
	@IBOutlet private weak var _2_diceView: DiceView!
	@IBOutlet private weak var _3_diceView: DiceView!
	private let calculator = DiceCalculator()
	private var allDiceView:[DiceView] {
		[_1_diceView,
		 _2_diceView,
		 _3_diceView,]
	}
	private var diceResult = 0
	private var bag = Set<AnyCancellable>()
	override func viewDidLoad() {
		super.viewDidLoad()
		allDiceView.forEach{
			$0.setup()
		}
		Publishers.Zip3(
			_1_diceView.publish,
			_2_diceView.publish,
			_3_diceView.publish
		).sink { (a,b,c) in
			guard a,b,c else {return}
			self.setLabel()
		}.store(in: &bag)
		print(#function)
	}
	
	@IBAction private func didTapReroll(_ sender: UIButton) {
		genRamdomDice()
	}
	
	private func genRamdomDice() {
		hintLabel.text = "dicing"
		zip(getDiceSet,allDiceView).forEach {
			$1.setDice(for: $0)
		}
	}
}
// MARK: - Dice login
extension ViewController {
	private var getDiceSet: [Dice] {
		let rt = [Dice.random(),.random(),.random()]
		print(rt)
		diceResult = rt.map(\.rawValue).reduce(0, +)
		return rt
	}
	private func setLabel() {
		let r = calculator.calculate(diceResult)
		rightNumberLabel.text = r.fromRight.formatted
		rightNumberLabel.sizeToFit()
		leftNumberLabel.text = r.fromLeft.formatted
		leftNumberLabel.sizeToFit()
		hintLabel.text = diceResult.description
		
	}

}

extension Int {
	var formatted:String {
		if self < 10 {return " " + description}
		return description
	}
}
