//
//  ViewController.swift
//  BitCoinValue
//
//  Created by Dmitry Kaveshnikov on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let labelHeader: UILabel = {
        let label = UILabel()
//        label.font = UIFont(name: "System", size: 50)
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
//        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
		imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
		imageView.image = UIImage(systemName: <#T##String#>, withConfiguration: <#T##UIImage.Configuration?#>)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelToStack: UILabel = {
        let label = UILabel()
		label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
	
    
    let currencyLabelToStack: UILabel = {
        let label = UILabel()
		label.font = UIFont(name: "System", size: 30)
		label.text = "Rubble Bubble"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let middleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: TODO
		
        //Why i can't use initializator like this ?!
/*		 stackView = UIStackView(arrangedSubviews: [], axis: .horizontal, spacing: 8, alignment: .center, distribution: .fillEqually) */
        
        return stackView
    }()
    
    
    //    self.view.addSubview(middleStackView)
    
    let pickerView: UIPickerView = {
        let picker = UIPickerView()
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
		
        
    }
    
    
    //MARK: - Methods vs Logic
    
	func configureHeaderStackView() {
//		NSLayoutConstraint.activate([
//		labelHeader.widthAnchor.constraint(equalToConstant: 230),
//		labelHeader.heightAnchor.constraint(equalToConstant: 60)
//		])
		headerStackView.addArrangedSubview(labelHeader)
		
	}
	
	func configureMiddleStackView() {
		middleStackView.addArrangedSubview(imageToStack)
		middleStackView.addArrangedSubview(labelToStack)
		middleStackView.addArrangedSubview(currencyLabelToStack)
	}
	
	
    
}

