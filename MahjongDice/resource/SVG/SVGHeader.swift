//
//  SVGHeader.swift
//  MahjongDice
//
//  Created by 游宗諭 on 2020/4/3.
//  Copyright © 2020 游宗諭. All rights reserved.
//

import Foundation
import SwiftSVG
import UIKit

struct SVGBuilder {
	
	func makeUIView(name: String) -> UIView {
		UIView(SVGNamed: name)
	}
}
