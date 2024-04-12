//
//  Background.swift
//  Client App
//
//  Created by Karthik Datta on 09/04/24.
//

import Foundation

extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        Dispatch.DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
    
    /**
     async await are same as async couroutine builder. starts corountines and waits for the result.
        similar to coroutines, where we have to mention dispatcher (on which thread the task should run?),
        we have to mention the thread inside the async function using Task.runDetached /  Task
     
     Never mix DispatchQueue.global(qos: .background).async {} in async await. Since both are similar concepts -> asynchronous / concurrent task running, both should be used independely
     
     like in coroutines,
     launch -> DispatchQueue.global(qos: .background).async {} -> runs task in qos mentioned thread.
     async -> async await -> waits for the result
     
     */
    func fetchWeatherHistory() async -> [Double] {
        (1...100_000).map { _ in Double.random(in: -10...30) }
    }

    func calculateAverageTemperature(for records: [Double]) async -> Double {
        let total = records.reduce(0, +)
        let average = total / Double(records.count)
        return average
    }

    func upload(result: Double) async -> String {
        "OK"
    }
   
    func process() async {
        Task {
            func processWeather() async {
                let records = await fetchWeatherHistory()
                let average = await calculateAverageTemperature(for: records)
                let response = await upload(result: average)
                print("Server response: \(response)")
            }
        }
    }

    /**
     
    
    DispatchQueue.global(qos: .background).async and async/await are both mechanisms for concurrent programming in Swift, but they serve different purposes and have different use cases:

    DispatchQueue.global(qos: .background).async: This approach is based on Grand Central Dispatch (GCD) and allows you to execute tasks asynchronously on a global background queue with a specific Quality of Service (QoS) level. You typically use this when you need finer control over threading and execution priorities. For example, you might use it for tasks like fetching data from a server, performing complex computations, or processing large amounts of data in the background. GCD provides low-level control over concurrency and thread management.
     
     */
    func runBackgroundTask() {
        DispatchQueue.global(qos: .background).async {
            // Your task code here
        }
    }
    
    /**
     
    async/await: This approach is part of Swift's structured concurrency model introduced in Swift 5.5. It provides a more structured and intuitive way to write asynchronous code compared to callback-based or completion handler-based approaches. With async/await, you can write asynchronous code that looks like synchronous code, making it easier to understand and reason about. You typically use async/await for tasks like asynchronous API calls, asynchronous data processing, or any other operation that involves waiting for results from asynchronous tasks.
     */

  
    func runAwaitAsyncFunction() async {
        Task {
            let result = try await someAsyncFunction()
            // Handle the result
        }
    }
    /**
     
    In summary:

    Use DispatchQueue.global(qos: .background).async when you need fine-grained control over threading and execution priorities, or when interacting with low-level concurrency primitives like GCD.
     
    Use async/await when you want to write asynchronous code in a structured and intuitive manner, especially when dealing with Swift-native asynchronous APIs or when you prefer a more high-level and declarative approach to concurrency.
     
     */
  
    
    
    /**
     Example of API call making in both concepts
     */
    
    
    // Making an API call using DispatchQueue.global().async
    func makeAPIRequestBGThread(completion: @escaping (Result<Data, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            // Perform network request
            guard let url = URL(string: "https://api.example.com/data") else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.invalidURL))
                }
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

    
    // Making an API call using async/await
    func makeAPIRequestAsyncAwait() async throws -> Data {
        guard let url = URL(string: "https://api.example.com/data") else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }

}

