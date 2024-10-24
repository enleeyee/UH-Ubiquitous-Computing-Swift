class ChatGPTAPI {
    private let config: ChatGPTAPIConfig
    private let session = URLSession.shared

    init(apiKey: String) {
        self.config = ChatGPTAPIConfig(apiKey: apiKey)
    }

    func sendMessage(messages: [Message], completion: @escaping (Result<String, Error>) -> Void) {
        let requestModel = ChatGPTRequest(model: "gpt-3.5-turbo", messages: messages)
        guard let url = URL(string: config.baseUrl) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = config.headers
        request.httpBody = try? JSONEncoder().encode(requestModel)

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let chatResponse = try JSONDecoder().decode(ChatGPTResponse.self, from: data)
                if let result = chatResponse.choices.first?.message.content {
                    completion(.success(result))
                } else {
                    completion(.failure(NSError(domain: "APIError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No response from API"])))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}