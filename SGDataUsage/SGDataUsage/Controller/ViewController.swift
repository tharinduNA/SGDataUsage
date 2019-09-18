//
//  ViewController.swift
//  SGDataUsage
//
//  Copyright © 2019 Tharindu Abeyratne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private let viewModel = TableViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    private let backgroundImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        if Reachability.isConnectedToNetwork(){
            self.viewModel.getDataUsageInfo { [weak self] in
                DispatchQueue.main.async {
                    self?.spinner.isHidden = true
                    self?.tableView.reloadData()
                }
            }
        }else{
            DispatchQueue.main.async {
                self.spinner.isHidden = true
                self.alertUser(strTitle: Constants.NO_NETWORK_TITLE, strMessage: Constants.NO_NETWORK_MESSAGE)
            }
        }
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 600

        
    }

    func setBackgroundImage() {
        
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.image = UIImage(named: "sky_bg")
        view.sendSubviewToBack(backgroundImage)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: Constants.TABLE_CELL_ID,
                                                        for: indexPath) as? DataViewCell) else {
                                                            return UITableViewCell()
        }
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        return cell
    }

    
}

extension UIViewController {
    func alertUser(strTitle: String, strMessage: String) {
        let myAlert = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        UIApplication.shared.delegate?.window??.rootViewController?.present(myAlert, animated: true, completion: nil)
    }
}

