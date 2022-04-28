//
//  ViewController.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 16.04.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	

	//MARK: UI Elements
	
    let labelHeader: UILabel = {
        let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 50.0)
        label.text = "ByteCoin"
		label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    let headerStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [])
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.spacing = 10
		view.alignment = .center
		view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageToStack: UIImageView = {
        let imageView = UIImageView()
		let config = UIImage.SymbolConfiguration(pointSize: 50)
		imageView.image = UIImage(systemName: "bitcoinsign.circle.fill", withConfiguration: config)
		imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelToStack: UILabel = {
        let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = .white
		label.alpha = 0.9
		label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
	
    
    let currencyLabelToStack: UILabel = {
        let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = .white
		label.alpha = 0.9
		label.text = "Rubble Bubble"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let middleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 10.0
		stackView.backgroundColor = .lightGray
		stackView.alpha = 0.8
		stackView.layer.cornerRadius = 11.72
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: TODO
		
        //Why i can't use initializator like this ?!
/*		 stackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 8, alignment: .center, distribution: .fillEqually) */
        
        return stackView
    }()
    
    let pickerView: UIPickerView = {
        let picker = UIPickerView()
		picker.layer.cornerRadius = 11.72
		picker.alpha = 1
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .cyan
		view.addSubviews([headerStackView, middleStackView, pickerView])
		buildConstraints()
        configureHeaderStackView()
		configureMiddleStackView()
		
		//set the ViewController class as the datasource to the currencyPicker object.
		pickerView.dataSource = self
		pickerView.delegate = self
        
    }
    
    
    //MARK: - Methods vs Logic
    
	func configureHeaderStackView() {
		headerStackView.addArrangedSubview(labelHeader)
		
	}
	
	func configureMiddleStackView() {
		middleStackView.addArrangedSubview(imageToStack)
		middleStackView.addArrangedSubview(labelToStack)
		middleStackView.addArrangedSubview(currencyLabelToStack)
	}
	
	//PickerView Settings
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1;
	}
	
	let coinManager = CoinManager()
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return coinManager.currencyArray.count;
	}
	 // creating number of elenets in picker view
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return coinManager.currencyArray[row]
	}
	
	// create connection with selection in picker view
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//		print (coinManager.currencyArray[row])
		let selectedCurrency = coinManager.currencyArray[row]
		coinManager.getCoinPrice(for: selectedCurrency)
		
	}
	
//	func getLastPrice(for: selectedCurrency) {
//
//	}
	
	
	
	
	
    
}

