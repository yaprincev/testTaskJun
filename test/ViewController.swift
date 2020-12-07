//
//  ViewController.swift
//  test
//
//  Created by Maxim on 06.12.2020.
//  Привязка к viewCotroller

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var sexLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var surnLbl: UILabel!
    @IBOutlet weak var bdayLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var folCountLbl: UILabel!
    
    
     var users: AllData?
    override func viewDidLoad() {
        super.viewDidLoad()

        countryLbl.text = users?.country
        sexLbl.text = users?.sexString
        cityLbl.text = users?.newHomeTown
        nameLbl.text = users?.firstName
        surnLbl.text = users?.lastName
        bdayLbl.text = users?.bdate
        statusLbl.text = users?.onlineString
        folCountLbl.text = "\((users?.followersCount)!)"
    }

}
