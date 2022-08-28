//
//  ViewController.swift
//  LayOutMariya
//
//  Created by Мария  on 28.08.22.
//

import UIKit

protocol TextFieldDelegate {
    func labelInfo ( info: String)
}
class TextField {
    var delegate : TextFieldDelegate?
    var firstTextField : UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter First Name"
        textField.borderStyle = .roundedRect
        return textField
    }
    var middleTextField : UITextField {

        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter Middle Name"
        textField.borderStyle = .roundedRect
        return textField
    }
    var lastTextField : UITextField {
//
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter Last Name"
        textField.borderStyle = .roundedRect
        return textField
    }
}

class Buttons {
    func buttonSave()-> UIButton{
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.tintColor = .systemBlue
        return button
    }
//    var buttonSave : UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle("Save", for: .normal)
//        button.tintColor = .systemBlue
//        return button
func buttonCancel()-> UIButton{
    let button = UIButton(type: .system)
    button.setTitle("Cancel", for: .normal)
    button.tintColor = .systemBlue
    return button
}
//    var buttonCancel : UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle("Cancel", for: .normal)
//        button.tintColor = .systemBlue
//        return button
//    }
    func buttonClear ()->UIButton{
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.tintColor = .systemBlue
        return button
    }
//    var buttonClear : UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle("Clear", for: .normal)
//        button.tintColor = .systemBlue
//        return button
//    }
   
    }

class ViewController: UIViewController,TextFieldDelegate {
    
    let image = UIImageView(image: UIImage(named: "IMG_9158"))
    let labelFirst = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
    let labelMiddle = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
    let labelLast = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 20))
    let stackOfLabel = UIStackView(frame: CGRect(x: 0, y: 0, width: 60, height: 125))
    
    let bigView = UIView()
    let labelNotes = UILabel (frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    var buttons = Buttons()
    var textField = TextField()
    let stackOfTextField = UIStackView()
    let stackOfButtons = UIStackView()
    
    

    override func viewDidLoad() {
       
        super.viewDidLoad()
        bigView.backgroundColor = .systemGray
        labelFirst.text = "First"
        labelMiddle.text = "Middle"
        labelLast.text = "Last"
        labelNotes.text = "Notes:"
        
        stackOfLabel.axis = .vertical
        stackOfLabel.spacing = 30
        stackOfLabel.distribution = .fillEqually
        stackOfLabel.alignment = .fill
        
        stackOfButtons.addArrangedSubview(buttons.buttonSave())
        stackOfButtons.addArrangedSubview(buttons.buttonClear())
        stackOfButtons.addArrangedSubview(buttons.buttonCancel())
        
        stackOfButtons.axis = .horizontal
        stackOfButtons.spacing = 55
        stackOfButtons.distribution = .fillEqually
        stackOfButtons.alignment = .fill
        
        
        image.translatesAutoresizingMaskIntoConstraints = false
        stackOfLabel.translatesAutoresizingMaskIntoConstraints = false
        stackOfButtons.translatesAutoresizingMaskIntoConstraints = false
        stackOfTextField.translatesAutoresizingMaskIntoConstraints = false
        bigView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(image)
        bigView.addSubview(labelNotes)
        stackOfLabel.addArrangedSubview(labelFirst)
        stackOfLabel.addArrangedSubview(labelMiddle)
        stackOfLabel.addArrangedSubview(labelLast)
        
        stackOfTextField.addArrangedSubview(textField.firstTextField)
        stackOfTextField.addArrangedSubview(textField.middleTextField)
        stackOfTextField.addArrangedSubview(textField.lastTextField)
        
        stackOfTextField.axis = .vertical
        stackOfTextField.spacing = 12
        stackOfTextField.alignment = .leading
        stackOfTextField.distribution = .fillEqually
       
      
        view.addSubview(stackOfLabel)
        view.addSubview(stackOfButtons)
        view.addSubview(stackOfTextField)
        view.addSubview(bigView)
        
    
        setUpBigView()
        setUpTextField()
        setButtonStack()
        setUpForLabel()
        setUpImage()
        
        buttons.buttonClear().addTarget(self, action: #selector(buttonTouchClear), for: .touchUpInside)
        buttons.buttonSave().addTarget(self, action: #selector(buttonTouchSave(info:)), for: .touchUpInside)
        buttons.buttonCancel().addTarget(self, action: #selector(buttonTouchCancel), for: .touchUpInside)

    }
    func setUpTextField (){
        _ = stackOfTextField.leftAnchor.constraint(equalTo: stackOfLabel.rightAnchor, constant: 5).isActive = true
        _ = stackOfTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        _ = stackOfTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        _ = stackOfTextField.bottomAnchor.constraint(equalTo: bigView.topAnchor, constant: -25).isActive = true
        _ = stackOfTextField.widthAnchor.constraint(equalToConstant: 155).isActive = true
        _ = stackOfTextField.heightAnchor.constraint(equalToConstant: 120).isActive = true

    }
    func setUpBigView (){
        _ = bigView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        _ = bigView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        _ = bigView.topAnchor.constraint(equalTo: stackOfTextField.bottomAnchor, constant: 25).isActive = true
        _ = bigView.bottomAnchor.constraint(equalTo: stackOfButtons.topAnchor, constant: -40).isActive = true
        _ = bigView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        _ = bigView.heightAnchor.constraint(equalToConstant: 575).isActive = true
    }
    func setButtonStack (){
        _ = stackOfButtons.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        _ = stackOfButtons.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        _ = stackOfButtons.topAnchor.constraint(equalTo: bigView.bottomAnchor, constant: 10).isActive = true
        _ = stackOfButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36).isActive = true
        _ = stackOfButtons.widthAnchor.constraint(equalToConstant: 315).isActive = true
        _ = stackOfButtons.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    func setUpForLabel (){
        _ = stackOfLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 5).isActive = true
//        _ = stackOfLabel.rightAnchor.constraint(equalTo: stackOfTextField.leftAnchor, constant: 5).isActive = true
        _ = stackOfLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        _ = stackOfLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        _ = stackOfLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    func setUpImage (){
        _ = image.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        _ = image.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        _ = image.widthAnchor.constraint(equalToConstant: 125).isActive = true
        _ = image.heightAnchor.constraint(equalToConstant: 125).isActive = true
        _ = image.bottomAnchor.constraint(equalTo: bigView.topAnchor, constant: -25).isActive = true
    
    }
    @objc func buttonTouchSave(info: String){
        labelInfo(info: (textField.firstTextField.text ?? "") + (textField.middleTextField.text ?? "") + (textField.lastTextField.text ?? ""))
        textField.delegate = self
    }
    @objc func  buttonTouchClear(){
        labelNotes.text = "Notes:"
    }
    @objc func buttonTouchCancel(){
        textField.lastTextField.text = ""
        textField.firstTextField.text = ""
        textField.middleTextField.text = ""
    }
    func labelInfo(info: String) {
        labelNotes.text = info
    }
}

