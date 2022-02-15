import Foundation

func deepMerge(_ d1: [String: Any], _ d2: [String: Any]) -> [String: Any] {
    var result = d1
    for (k2, v2) in d2 {
        if let v1 = result[k2] as? [String: Any], let v2 = v2 as? [String: Any] {
            result[k2] = deepMerge(v1, v2)
        } else {
            result[k2] = v2
        }
    }
    return result
}
