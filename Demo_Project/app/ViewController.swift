//
//  ViewController.swift
//  Demo_Project
//
//  Created by Farhan Mirza on 31/03/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit


fileprivate let reuseIdentifier = "PostCellId"

class ViewController: UITableViewController {
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        // api call
        getPosts()
    }

    
    private func getPosts() {
        // handle api call
        APIClient.getPosts { result in
            switch result {
            case .success(let response):
                print(response)
                self.posts = response
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].body
        return cell
    }
}

