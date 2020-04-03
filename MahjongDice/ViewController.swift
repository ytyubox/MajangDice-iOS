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
	@IBOutlet private weak var hintGroupStackView: UIStackView!
	@IBOutlet private weak var grapGroupStackView: UIStackView!
	@IBOutlet private weak var hintLabel: UILabel!
	@IBOutlet private weak var leftNumberLabel: UILabel!
	@IBOutlet private weak var rightNumberLabel: UILabel!
	@IBOutlet private weak var _1_diceView: DiceView!
	@IBOutlet private weak var _2_diceView: DiceView!
	@IBOutlet private weak var _3_diceView: DiceView!
	private var rotateAngle:CGFloat = 0
	private let calculator = DiceCalculator()
	private var allDiceView:[DiceView] {
		[_1_diceView,
		 _2_diceView,
		 _3_diceView,]
	}
	private var diceResult = 0
	private var bag = Set<AnyCancellable>()
	private var r: DiceCalculator.DiceResult!
	override func viewDidLoad() {
		super.viewDidLoad()
		allDiceView.forEach{
			$0.setup()
		}
		self.hintGroupStackView.transform = CGAffineTransform(rotationAngle: .pi)
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
		rotatingStackView()
	}
	
	private func genRamdomDice() {
		let diceSet = getDiceSet
		r = calculator.calculate(diceResult)
		hintLabel.text = "dicing"
		zip(diceSet,allDiceView).forEach {
			$1.setDice(for: $0)
		}
	}
}
// MARK: - Dice login
extension ViewController {
	private var getDiceSet: [Dice] {
		let rt = [Dice.random(),.random(),.random()]
		diceResult = rt.map(\.rawValue).reduce(0, +)
		return rt
	}
	private func setLabel() {
		rightNumberLabel.text = r.fromRight.formatted
		rightNumberLabel.sizeToFit()
		leftNumberLabel.text = r.fromLeft.formatted
		leftNumberLabel.sizeToFit()
		hintLabel.text = diceResult.description
		
	}
	private func rotatingStackView() {
		self.grapGroupStackView.transform = .identity
		let post = r.start
		print(post.rawValue)
		print(self.rotateAngle)
		rotateAngle = (.pi / 2) * CGFloat(post.rawValue)
		print(self.rotateAngle)
		UIView.animate(withDuration: 2.0, delay: 0
			, options: .curveEaseInOut,  animations: {
				self.grapGroupStackView.transform = CGAffineTransform(rotationAngle: self.rotateAngle)
		})
	}
}

extension Int {
	var formatted:String {
		if self < 10 {return " " + description}
		return description
	}
}
