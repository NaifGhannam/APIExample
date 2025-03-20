import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
    @State private var newTitle = ""
    @State private var newBody = ""

    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                if let successMessage = viewModel.successMessage {
                    Text(successMessage)
                        .foregroundColor(.green)
                        .padding()
                }
                
                List(viewModel.posts) { post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .listStyle(PlainListStyle())

                // Input Fields for New Post
                VStack {
                    TextField("Post Title", text: $newTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    TextField("Post Content", text: $newBody)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        viewModel.addPost(title: newTitle, body: newBody)
                        newTitle = ""
                        newBody = ""
                    }) {
                        Text("Add New Post")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }

                Button(action: {
                    viewModel.fetchPosts()
                }) {
                    Text("Refresh Data")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Post List")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}
