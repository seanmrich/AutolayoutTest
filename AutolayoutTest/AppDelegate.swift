import Cocoa

fileprivate let entryCellID = NSUserInterfaceItemIdentifier("EntryCell")

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var window: NSWindow!
    
    let data = ["First", "Second", "Next, lay out the table view cell’s content within the cell’s content view. To define the cell’s height, you need an unbroken chain of constraints and views (with defined heights) to fill the area between the content view’s top edge and its bottom edge. If your views have intrinsic content heights, the system uses those values."]


    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard data.indices.contains(row) else { return nil }
        guard let cellView = tableView.makeView(withIdentifier: entryCellID, owner: self) as? NSTableCellView else { return nil }
        cellView.textField?.stringValue = data[row]
        return cellView
    }
}

