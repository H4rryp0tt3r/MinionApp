import UIKit

class MinionViewController: UITableViewController {

    var dataSource: [Minion]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Minion Names"

        MinionService().fetchMinionNames(completionHandler: { [weak self] (minions) in
            if let strongSelf = self {
                strongSelf.dataSource = minions
                strongSelf.tableView.reloadData()
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "minionCell")! as UITableViewCell

        if let minion = dataSource?[indexPath.row] {
            cell.textLabel?.text = minion.name
            cell.imageView?.image = UIImage(named: minion.name)
        }

        return cell
    }

}

