import AppKit

class PseudoTextView: NSView {
    @IBInspectable var characterCount: Int = 0
    @IBInspectable var characterWidth: CGFloat = 5
    @IBInspectable var characterHeight: CGFloat = 8
    @IBInspectable var background: NSColor = .blue {
        didSet {
            layer?.backgroundColor = background.cgColor
        }
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        NotificationCenter.default.addObserver(self, selector: #selector(viewResized), name: NSView.frameDidChangeNotification, object: self)
        wantsLayer = true
        layer?.backgroundColor = background.cgColor
    }
    
    @objc private func viewResized() {
        invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: NSSize {
        if frame.width == 0 {
            return NSSize(width: NSView.noIntrinsicMetric, height: CGFloat(characterCount) * characterHeight)
        }
        let requiredWidth = characterWidth * CGFloat(characterCount)
        let lineCount = (requiredWidth / frame.width).rounded(.up)
        let requiredHeight = lineCount * characterHeight
        return NSSize(width: NSView.noIntrinsicMetric, height: requiredHeight)
    }
}
