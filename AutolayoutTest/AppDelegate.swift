import Cocoa

fileprivate let entryCellID = NSUserInterfaceItemIdentifier("EntryCell")

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var window: NSWindow!
    
    let data = [
        Entry(input: 100)
    ]


    func numberOfRows(in tableView: NSTableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard data.indices.contains(row) else { return nil }
        guard let cellView = tableView.makeView(withIdentifier: entryCellID, owner: self) as? EntryCellView else { return nil }
        cellView.input.stringValue = String(repeating: "a", count: data[row].input)
        return cellView
    }
    
    func tableView(_ tableView: NSTableView, didAdd rowView: NSTableRowView, forRow row: Int) {
        print("row.fittingSize: \(rowView.fittingSize)")
    }
}
