//
//  ViewController.swift
//  AbdulHasib_iOS
//
//  Created by Abdul Hasib on 16/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    struct ProjectItem {
        let title: String
        let destinationViewController: () -> UIViewController
    }
    var projects: [ProjectItem]  = []
    @IBOutlet weak var indexTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indexTableView.delegate = self
        indexTableView.dataSource = self
      
        projects = [
            ProjectItem(title: "15/09/2025 - Table View Task", destinationViewController: { UIStoryboard.instantiate(CartPageTableVC.self) }),
            
            ProjectItem(title: "16/09/2025 - NS URL Session", destinationViewController: { UIStoryboard.instantiate(URLSessionVC.self) }),
            ProjectItem(title: "19/09/2025 - Sign In API (POST)", destinationViewController: { UIStoryboard.instantiate(URLSessionVC.self) }),
        ]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!  ProjectCardCell
//        let project = projects[indexPath.row]
//
//        cell.projectTitleLabel.text = project.title
//        cell.viewButton.tag = indexPath.row
//        cell.viewButton.addTarget(self, action: #selector(viewButtonTapped), for: .touchUpInside)
//        return cell
        let project = projects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "testcell", for: indexPath)
        cell.textLabel?.text = project.title
        return cell
    }
    



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        			
        let project = projects[indexPath.row]
            let vc = project.destinationViewController()
            navigationController?.pushViewController(vc, animated: true)
            
            // Optional: deselect row after tapping
            tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension UIStoryboard {
    static func instantiate<T: UIViewController>(_ type: T.Type, from storyboardName: String = "Main") -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let identifier = String(describing: type) // storyboard ID must match class name
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
