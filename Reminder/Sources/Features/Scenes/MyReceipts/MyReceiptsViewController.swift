//
//  MuReceiptsViewController.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 12/01/25.
//

import Foundation
import UIKit

class MyReceiptsViewController: UIViewController {
    let contentView: MyReceiptsView
    weak var flowDelegate: MyReceiptsFlowDelegate?
    
    private let medicamentos = [
            ("Nome do remédio", "14:00", "A cada 12 horas"),
            ("Nome do remédio", "08:00", "A cada 7 dias"),
            ("Nome do remédio", "12:00", "A cada 1 dia"),
            ("Nome do remédio", "08:00", "A cada 7 dias"),
            ("Nome do remédio", "03:00", "A cada 7 dias"),
            ("Nome do remédio", "04:00", "2 em 2 horas"),
            ("Nome do remédio", "01:00", "A cada 7 dias"),
            ("Nome do remédio", "12:00", "A cada 7 dias"),
            ("Nome do remédio", "13:00", "A cada 7 dias"),
        ]
    
    init(contentView: MyReceiptsView,
         flowDelegate: MyReceiptsFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()

    }
    
    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray800
        self.navigationItem.hidesBackButton = true
        setupConstraints()
    }

    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(RemedyCell.self, forCellReuseIdentifier: RemedyCell.identifier)
        contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)

    }
    
}

extension MyReceiptsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Each cell will be in its own section
        return medicamentos.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90 // Height of the cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Create a spacing view between cells
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4 // Spacing between cells
    }
}

extension MyReceiptsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // One row per section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemedyCell.identifier, for: indexPath) as! RemedyCell
        let medicamento = medicamentos[indexPath.section] // Access data using section index
        cell.configure(title: medicamento.0, time: medicamento.1, recurrence: medicamento.2)
        return cell
    }
}
