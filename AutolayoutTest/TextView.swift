import Cocoa

class TextView: NSTextField {

    override func awakeFromNib() {
        NotificationCenter.default.addObserver(forName: NSView.frameDidChangeNotification, object: self, queue: nil) { note in
            print("text frame: \(self.frame.size)")
        }
    }
    override var intrinsicContentSize: NSSize {
        return super.intrinsicContentSize
    }
    
}
