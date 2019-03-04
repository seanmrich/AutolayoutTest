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
        wantsLayer = true
        layer?.backgroundColor = background.cgColor
    }
    
    override var intrinsicContentSize: NSSize {
        let requiredWidth = characterWidth * CGFloat(characterCount)
        let lineCount = (requiredWidth / frame.width).rounded(.up)
        let usedHeight = lineCount * characterHeight
        let charactersPerLine = (frame.width / characterWidth).rounded(.down)
        let usedWidth = charactersPerLine * characterWidth
        return NSSize(width: usedWidth, height: usedHeight)
    }
}
