//
//  String+Extention.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

extension String {
 
    // =============================
    // MARK: Removed Prefix / Suffix
    // =============================

    public func removed(anyPrefixIn prefixes: [String]) -> String {
        guard let foundPrefix = prefixes.first(where: { hasPrefix($0) }) else {
            return self
        }
        let start = foundPrefix.endIndex
        return String(self[start...])
    }

    public func removed(prefix: String) -> String {
        removed(anyPrefixIn: [prefix])
    }

    public func removed(anySuffixIn suffixes: [String]) -> String {
        guard let foundSuffix = suffixes.first(where: { hasSuffix($0) }) else {
            return self
        }
        let suffixLength = foundSuffix.distance(from: foundSuffix.startIndex, to: foundSuffix.endIndex)
        let end = index(endIndex, offsetBy: -suffixLength)
        return String(self[..<end])
    }

    public func removed(suffix: String) -> String {
        removed(anySuffixIn: [suffix])
    }

    public func removed(prefix: String, suffix: String) -> String {
        guard hasPrefix(prefix), hasSuffix(suffix) else {
            return self
        }
        let start = prefix.endIndex
        let suffixLength = suffix.distance(from: suffix.startIndex, to: suffix.endIndex)
        let end = index(endIndex, offsetBy: -suffixLength)
        return String(self[start ..< end])
    }
 


}
