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
        cell.set(resource: resource)
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
