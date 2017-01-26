import Alamofire
import SwiftyJSON

class MinionService {

    func fetchMinionNames(completionHandler: @escaping ([Minion]) -> Void) {
        print("Getting minions asynchronously!")

        Alamofire.request("http://localhost:8080/api/minions", method: .get).responseJSON { response in
            switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let minions = json["names"].arrayValue.map { Minion(name: $0.string!) }
                        completionHandler(minions)
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
            }
        }
    }
}
