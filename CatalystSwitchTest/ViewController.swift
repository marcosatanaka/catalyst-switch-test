import UIKit

class ViewController: UIViewController {

    lazy var tableView = SettingsTableView(frame: view.frame, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

class SettingsTableView: UITableView {

    var hideExplicitAlbumsSwitch: UISwitch = {
        let switchView = UISwitch(frame: .zero)
        switchView.onTintColor = .red
        switchView.addTarget(self, action: #selector(didChangeHideExplicitAlbumsSwitch), for: .valueChanged)
        switchView.title = "Hide explicit albums"
        //switchView.preferredStyle = .sliding
        switchView.translatesAutoresizingMaskIntoConstraints = false
        return switchView
    }()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .insetGrouped)
        delegate = self
        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCellReuseIdentifier")
        if UIDevice.current.userInterfaceIdiom == .mac { separatorStyle = .singleLine }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didChangeHideExplicitAlbumsSwitch(_ sender: UISwitch) {
        print("Did change")
    }
}

// MARK: - Table view data source

extension SettingsTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "SettingsTableViewCellReuseIdentifier")
        cell.imageView?.image = UIImage(systemName: "e.square")
        cell.textLabel?.text = "Hide explicit albums"
        cell.accessoryView = hideExplicitAlbumsSwitch
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }

}

// MARK: - Delegate

extension SettingsTableView: UITableViewDelegate {
}
