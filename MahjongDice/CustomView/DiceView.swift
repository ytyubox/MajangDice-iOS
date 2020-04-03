//
//  DiceView.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import UIKit
import Combine

final class DiceView: UIView {
	static var delay:TimeInterval = 0.1
	
	static var threshold = 10
	private var _dice = UIImageView()
	let publish = PassthroughSubject<Bool,Never>()
	var timer:Timer! {
		didSet {oldValue?.invalidate()}
	}
	func setup() {
		
		_dice.translatesAutoresizingMaskIntoConstraints = false
		_dice.image = Dice.random().image
		addSubview(_dice)
		_dice.topAnchor.constraint(equalTo: topAnchor).isActive = true
		_dice.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		_dice.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		_dice.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}
	var count = 0
	func setDice(for dice:Dice) {
		shake()
		count = 0
		timer = Timer.scheduledTimer(withTimeInterval: Self.delay, repeats: true, block: { (timer) in
			self.count += 1
			if self.count == Self.threshold {
				self._dice.image = dice.image
				self.publish.send(true)
				timer.invalidate()
				return
			}
			self._dice.image = Dice.random().image
			self.publish.send(false)
		})
	}
}

extension UIView {
    func shake() {
			let x = (40...100).randomElement()!
			let y = (40...100).randomElement()!
			print(x,y)
			self.transform = CGAffineTransform(translationX: CGFloat(x), y: CGFloat(y))
			UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
