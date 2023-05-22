//
//  ViewController.swift
//  TableViewExercise
//
//  Created by Tabita Barbosa on 11/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    let emojisList : Array = ["🫠", "🥰", "🥲", "🙃", "😶‍🌫️", "🤓", "😳", "🤡", "😵‍💫", "☺️"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    func setupView() {
        navigationItem.title = "tela inicial"
        self.setupHierarchy()
        self.setupConstraints()
        self.emojisTable.dataSource = self
        self.emojisTable.delegate = self
        self.emojisTable.reloadData()
    }
    
    private lazy var listTitle: UILabel = {
        let label = UILabel()
        label.text = "Lista de emojis"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emojisTable: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

}

extension ViewController {
    func setupHierarchy() {
        view.addSubview(self.listTitle)
        view.addSubview(self.emojisTable)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        self.listTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40.0),
            listTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24.0),
            listTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24.0)
        ])
        
        self.emojisTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojisTable.topAnchor.constraint(equalTo: self.listTitle.bottomAnchor, constant: 24.0),
            emojisTable.heightAnchor.constraint(equalToConstant: 400.0),
            emojisTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emojisTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24.0)
        ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojisList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = emojisList[indexPath.row]
        content.textProperties.alignment = .center
        
        if cell.tag == 0 {
            cell.tag = indexPath.row + 1
            content.text = "\(cell.tag): \(emojisList[indexPath.row])"
        }
        
        cell.contentConfiguration = content
        return cell
    }
}
