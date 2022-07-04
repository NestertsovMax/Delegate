//
//  EditProfileViewController.swift
//  Delegate
//
//  Created by M1 on 29.06.2022.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldSurname: UITextField!
    @IBOutlet var switchAge: UISwitch!
    @IBOutlet var buttonReset: UIButton!
    @IBOutlet var buttonConfirm: UIButton!
    @IBOutlet var appealLabel: UILabel!
    var delegate: EditProfileDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appealLabel.text = ""
        switchAge.isOn = false
    }
    @IBAction func changeSwitchAge(_ sender: UISwitch) {
        view.endEditing(true)
    }
    @IBAction func pressedButtonConfirm(_ sender: UIButton) {
        if switchAge.isOn {
            appealLabel.text = "Здрваствуйте, \(textFieldName.text ?? "Undefined") \(textFieldSurname.text ?? "Undefined")"
        } else {
            appealLabel.text = "Здрваствуйте, \(textFieldName.text ?? "Undefined")"
        }
        view.endEditing(true)
    }
    @IBAction func pressedButtonReset(_ sender: UIButton) {
        delegate?.didResetInfo()
    }
    
    @IBAction func nameChanged(_ sender: Any) {
        guard let name = textFieldName.text else { return }
        delegate?.didNameChange(name: name)
    }
    
    @IBAction func surnameChange(_ sender: Any) {
        guard let surname = textFieldSurname.text else { return }
        delegate?.didSurnameChange(surname: surname)
    }
    @IBAction func backToProfileViewController(segue: UIStoryboardSegue) {
        navigationController?.popToRootViewController(animated: true)
    }
}


protocol EditProfileDelegate {
    func didNameChange(name: String)
    func didSurnameChange(surname: String)
    func didResetInfo()
}
