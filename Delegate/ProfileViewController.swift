//
//  ProfileViewController.swift
//  Delegate
//
//  Created by M1 on 29.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var labelSurname: UILabel!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var buttonRedact: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelName.text = ""
        labelSurname.text = ""

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedButtonRedict(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "editProfile" else { return }
        guard let destVC = segue.destination as? EditProfileViewController else { return }
        destVC.delegate = self
    }

}

extension ProfileViewController: EditProfileDelegate {
    func didResetInfo() {
        labelName.text = ""
        labelSurname.text = ""
    }
    
    func didNameChange(name: String) {
        labelName.text = name
    }
    func didSurnameChange(surname: String) {
        labelSurname.text = surname
    }
}
