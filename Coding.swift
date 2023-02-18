struct Coding {
    func snakeToCamel(from input: String) -> String {
        if input.isEmpty { return "" }

        let split = input
            .split(separator: "_")
            .enumerated()
            .map { $0.0 == 0 ? $0.1.lowercased() : $0.1.capitalized }

        return split.joined()
    }  
  
    func camelToSnake(from input: String) -> String {
        let pattern = "([a-z0-9])([A-Z])"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return ""
        }
        
        let range = NSRange(location: 0, length: input.utf16.count)
        let result = regex.stringByReplacingMatches(in: input,
                                                    options: [],
                                                    range: range,
                                                    withTemplate: "$1_$2")
        return result.lowercased()
    }
}

let coding = Coding()
let camel = coding.snakeToCamel(from: "user_name")
let snake = coding.camelToSnake(from: "userName")
