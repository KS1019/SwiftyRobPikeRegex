public struct SwiftyRobPikeRegex {
    static public func match(regexp: String, text: String) -> Bool {
		var text = text
        if regexp != "" && regexp[0] == "^" {
			return matchHere(regexp: regexp[1..<regexp.count], text: text)
        }

        while(true) {
			if matchHere(regexp: regexp, text: text) {
				return true
			}
			if text == "" {
				return false
			}

			text = text[1..<text.count]
        }
    }

	static private func matchHere(regexp: String, text: String) -> Bool {
		if regexp == "" {
			return true
		} else if regexp == "$" {
			return text == ""
		} else if regexp.count >= 2 && regexp[1] == "*" {
			return matchStar(c: regexp[0], regexp: regexp[2..<regexp.count], text: text)
		} else if text != "" && (regexp[0] == "." || regexp[0] == text[0]) {
			return matchHere(regexp: regexp[1..<regexp.count], text: text[1..<text.count])
		}
		return false
	}

	// matchStar reports whether c*regexp matches at beginning of text.
	static private func matchStar(c: Character, regexp: String, text: String) -> Bool {
		var text = text
		while(true) {
			if matchHere(regexp: regexp, text: text) {
				return true
			}
			if text == "" || (text[0] != c && c != ".") {
				return false
			}
			text = text[1..<text.count]
		}
	}
}

extension String {
	subscript (_ bounds: CountableClosedRange<Int>) -> String {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[start...end])
	}

	subscript (_ bounds: CountableRange<Int>) -> String {
		let start = index(startIndex, offsetBy: bounds.lowerBound)
		let end = index(startIndex, offsetBy: bounds.upperBound)
		return String(self[start..<end])
	}

	subscript(_ offset: Int) -> Character {
		self[index(startIndex, offsetBy: offset)]
	}
}
