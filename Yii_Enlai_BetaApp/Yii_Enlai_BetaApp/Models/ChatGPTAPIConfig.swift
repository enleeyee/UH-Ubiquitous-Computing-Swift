struct ChatGPTAPIConfig {
    let apiKey: String
    let baseUrl: String = "https://api.openai.com/v1/chat/completions"
    var headers: [String: String] {
        return [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
    }
}