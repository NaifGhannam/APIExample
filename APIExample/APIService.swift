//
//  APIService.swift
//  APIExample
//
//  Created by Mac on 19/09/1446 AH.
//
import Alamofire
import Foundation

class APIService {
    static let shared = APIService()
    private let baseURL = "https://jsonplaceholder.typicode.com"

    // ✅ GET Request - استرجاع البيانات
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let url = "\(baseURL)/posts"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let posts):
                    completion(.success(posts))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    // ✅ POST Request - إرسال بيانات جديدة
    func createPost(title: String, body: String, completion: @escaping (Result<Post, Error>) -> Void) {
        let url = "\(baseURL)/posts"
        let parameters: [String: Any] = [
            "title": title,
            "body": body,
            "userId": 1
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self) { response in
                switch response.result {
                case .success(let post):
                    completion(.success(post))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
