import XCTest
import Quick
import Nimble
@testable import MinionApp

class MinionViewControllerTests: QuickSpec {

    class FakeMinionService: MinionService {
        var fetchMinionsMethodCalled = false
        var result = [Minion(name: "Bob"), Minion(name: "Dave")]

        override func fetchMinionNames(completionHandler: @escaping ([Minion]) -> Void) {
            fetchMinionsMethodCalled = true
            completionHandler(result)
        }
    }

    override func spec() {
        describe("Minion view controller") {

            var minionViewController: MinionViewController!

            beforeEach {
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: self.classForCoder))
                minionViewController = storyboard.instantiateViewController(withIdentifier: "minionTableViewController") as! MinionViewController
                _ = minionViewController.view
            }

            it("should verify title") {
                expect(minionViewController.navigationItem.title).to(equal("Minion Names"))
            }

            it("should verify fetchminions method called and completion handler able to set datasource of tableView") {
                let fakeMinionService = FakeMinionService()
                minionViewController.fetchMinions(minionService: fakeMinionService)

                expect(fakeMinionService.fetchMinionsMethodCalled).to(beTrue())
                expect(fakeMinionService.result).to(equal(minionViewController.dataSource))
            }
        }
    }
}
