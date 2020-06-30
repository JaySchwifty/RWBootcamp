//
//  ViewController.swift
//  Birdie-Final
//
//  Created by Jay Strawn on 6/18/20.
//  Copyright © 2020 Jay Strawn. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        MediaPostsHandler.shared.getPosts()
    }
    
    func setUpTableView() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func userPostDate() -> DateFormatter {
        let today = DateFormatter()
        today.dateStyle = .short
        today.timeStyle = .short
        return today
    }
    
    @IBAction func didPressCreateTextPostButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "What's on your mind?", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Type Here"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okay = UIAlertAction(title: "OK", style: .default) {  _ in
            
            let username = "JaySchwifty"
            let message = alert.textFields![0].text ?? "No message"
            
            let post = TextPost(textBody: message, userName: username, timestamp: Date())
            MediaPostsHandler.shared.addTextPost(textPost: post)
            self.tableview.reloadData()
        }
        
        alert.addAction(cancel)
        alert.addAction(okay)
        
        present(alert, animated: true) {
            print("complete")
        }
    }
    
    @IBAction func didPressCreateImagePostButton(_ sender: Any) {
        
    }
}

extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MediaPostsHandler.shared.mediaPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = MediaPostsHandler.shared.mediaPosts[indexPath.row]
        
        switch post {
            
        case let imagePost as ImagePost:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SMPView", for: indexPath) as! ImageTVC
            
            cell.nameLbl?.text = imagePost.userName
            cell.dateLbl?.text = userPostDate().string(from: imagePost.timestamp)
            cell.bodyLbl?.text = imagePost.textBody
            cell.postImage.image = imagePost.image
            
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SMTView", for: indexPath) as! TextPostTVC
            
            cell.nameLbl?.text = post.userName
            cell.dateLbl?.text = userPostDate().string(from: post.timestamp)
            cell.bodyLbl?.text = post.textBody
            
            return cell
        }
    }
}
