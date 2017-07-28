//
//  ViewController.swift
//  Wide Color
//
//  Created by Julian Dunskus on 28.07.17.
//  Copyright © 2017 Julian Dunskus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var sliders: [UISlider]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		sliders = [red, green, blue]
		sliderChanged()
	}
	
	func updateLabels() {
		topLabel.text = String(describing: clampedValues)
		bottomLabel.text = String(describing: rgbValues)
	}
	
	func color(from rgb: [Float]) -> UIColor {
		let cgFloats = rgb.map(CGFloat.init)
		return UIColor(red: cgFloats[0], green: cgFloats[1], blue: cgFloats[2], alpha: 1)
	}
	
	var rgbValues: [Float] {
		get {
			return sliders.map { $0.value }
		}
		set {
			for (slider, value) in zip(sliders, newValue) {
				slider.value = value
			}
			sliderChanged()
		}
	}
	
	var clampedValues: [Float] {
		return rgbValues.map { min(max($0, 0), 1) }
	}
	
	@IBOutlet weak var top: UIView!
	@IBOutlet weak var topLabel: UILabel!
	@IBOutlet weak var bottom: UIView!
	@IBOutlet weak var bottomLabel: UILabel!
	
	@IBOutlet weak var red: UISlider!
	@IBOutlet weak var green: UISlider!
	@IBOutlet weak var blue: UISlider!
	
	@IBAction func sliderChanged() {
		bottom.backgroundColor = color(from: rgbValues)
		top.backgroundColor = color(from: clampedValues)
		updateLabels()
	}
	
	@IBAction func reset() {
		rgbValues = [1, 1, 1]
	}
}
