/*:
 [Previous](@previous)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Next](@next)
 
 # Strategy
 - - - - - - - - - -
 ![Strategy Diagram](Strategy_Diagram.png)
 
 The strategy pattern defines a family of interchangeable objects.
 
 This pattern makes apps more flexible and adaptable to changes at runtime, instead of requiring compile-time changes.
 
 ## Code Example
 */
import UIKit

public protocol MenuViewControllerDelegate: AnyObject {
  func menuViewController(
    _ menuViewController: MenuViewController,
    didSelectItemAtIndex index: Int)
}


public class MenuViewController: UIViewController {
  public weak var delegate: MenuViewControllerDelegate?
  
  // 1
  @IBOutlet public var tableView: UITableView! {
    didSet {
      tableView.dataSource = self
      tableView.delegate = self
    }
  }
  
  // 2
  private let items = ["Item 1", "Item 2", "Item 3"]
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      let cell =
        tableView.dequeueReusableCell(withIdentifier: "Cell",
                                      for: indexPath)
      cell.textLabel?.text = items[indexPath.row]
      return cell
  }
  
  public func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
  
  public func tableView(_ tableView: UITableView,
                 didSelectRowAt indexPath: IndexPath) {
    delegate?.menuViewController(self,
      didSelectItemAtIndex: indexPath.row)
  }
}
