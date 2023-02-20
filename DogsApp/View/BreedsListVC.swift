//
//  BreedsListVC.swift
//  DogsApp
//
//  Created by pvrdixit on 20/02/23.
//


import UIKit

class BreedsListVC: UIViewController {
    
    @IBOutlet weak var breedsTableView: UITableView!
    let breedsViewModel : BreedsViewModel = BreedsViewModel()
    var breedsTableData : [String] = []
    private let cellIdentifier = "reuseCell"
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        breedsTableViewSetup()
        getBreedsList()
    }
    
    private func breedsTableViewSetup() {
        breedsTableView.contentInset = UIEdgeInsets(top:0, left: 0, bottom: 50, right: 0)
        breedsTableView.delegate = self
        breedsTableView.dataSource = self
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refreshBreedsList), for: .valueChanged)
        breedsTableView.addSubview(refreshControl)
    }
    
    private func getBreedsList()
    {
        showSpinner()
        breedsViewModel.getBreedsList { [weak self]  result, message in
            guard let self = self else { return }
            self.breedsTableData = result
            self.removeSpinner()
            
            if message != nil {
                DispatchQueue.main.async {
                    self.displayAlert(alertMessage: message!)
                    self.breedsTableView.reloadData()
                }
            }
            else {
                DispatchQueue.main.async {
                    self.breedsTableView.reloadData()
                }
            }
        }
    }
    
    
    @objc private func refreshBreedsList()
    {
        refreshControl.endRefreshing()
        getBreedsList()
    }
    
}


// MARK: Table View Methods

extension BreedsListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedsTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        let cellData = breedsTableData[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = cellData.firstCapitalized
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
