//
//  PostViewModel.swift
//  APIExample
//
//  Created by Mac on 19/09/1446 AH.
//
import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String?
    @Published var successMessage: String?

    func fetchPosts() {
        APIService.shared.fetchPosts { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure(let error):
                    self?.errorMessage = "Failed to load posts: \(error.localizedDescription)"
                }
            }
        }
    }

    func addPost(title: String, body: String) {
        APIService.shared.createPost(title: title, body: body) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newPost):
                    self?.posts.insert(newPost, at: 0)
                    self?.successMessage = "Post added successfully!"
                case .failure(let error):
                    self?.errorMessage = "Failed to send data: \(error.localizedDescription)"
                }
            }
        }
    }
}
