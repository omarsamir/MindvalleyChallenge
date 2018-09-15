//
//  ResourceViewController.swift
//  MindvalleyChallenge
//
//  Created by Omar Samir on 9/15/18.
//  Copyright © 2018 Omar Samir. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ResourceControllerDelegate {
    
    @IBOutlet weak var resourcesTableView: UITableView!
    var resources : [Resource]!
    var resourceController : ResourceController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resourceController = ResourceController()
        resourceController.delegate = self
        
        resourcesTableView.delegate = self
        resourcesTableView.dataSource = self
        resourcesTableView.register(UINib(nibName: String(describing: ResourceTableViewCell.self), bundle: nil), forCellReuseIdentifier: "ResourceTableViewCellId")
        
        resources = [Resource]()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resourceController.getResources()
    }
    
    // #MARK: Resource table view delegate methods implementation
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ResourceTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ResourceTableViewCellId", for: indexPath) as! ResourceTableViewCell
        let resource = resources[indexPath.row]
        
//        cell.backgroundColor = UIColor(rgb:);
        cell.usernameLabel.text = resource.user.username
        cell.userFullName.text = resource.user.name
        cell.createdAtLabel.text = resource.created_at
        cell.numberOfLikesLabel.text = String(resource.likes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.resources.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return  620.0
    }
    
    // #MARK: Resource controller delegate methods implementation
    
    func display(resources: [Resource]) {
        self.resources = resources
        resourcesTableView.reloadData()
    }
    
    func display(error: Error) {
        let alert = UIAlertController(title: "Error Alert", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: false, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
