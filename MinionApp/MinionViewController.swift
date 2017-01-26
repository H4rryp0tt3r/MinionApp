import UIKit

class MinionViewController: UITableViewController {

    var dataSource: [Minion]? = [Minion(name: "Nagesh"), Minion(name: "Hello")]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Minion Names"
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

