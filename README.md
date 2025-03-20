# APIExample - SwiftUI & Alamofire

## Overview
APIExample is a SwiftUI application that demonstrates how to fetch and send data using RESTful APIs with Alamofire. The app allows users to retrieve posts from an API, display them in a list, and create new posts.

## Features
- Fetch posts from an API using a **GET** request.
- Create new posts using a **POST** request.
- Display fetched posts in a SwiftUI **List**.
- Handle success and error messages.

## Technologies Used
- **SwiftUI** for the user interface.
- **Alamofire** for network requests.
- **Combine** for data binding and state management.
- **JSONPlaceholder API** as the backend.

## Usage
- When the app launches, it automatically fetches posts.
- Click **Refresh Data** to reload the list of posts.
- Enter a title and content, then click **Add New Post** to create a new post.

## Code Structure
### `APIService.swift`
Handles API calls using Alamofire.
- `fetchPosts()`: Retrieves posts from the API.
- `createPost(title:body:)`: Sends a new post to the API.

### `PostViewModel.swift`
Manages API responses and updates the UI state.
- `fetchPosts()`: Calls `APIService.fetchPosts()` and updates the posts list.
- `addPost(title:body:)`: Calls `APIService.createPost()` and updates the UI upon success or failure.

### `ContentView.swift`
Displays posts and provides a form to add new posts.
- Shows a list of fetched posts.
- Allows users to input a title and body for a new post.
- Includes buttons to refresh and submit data.



## Screenshot
<img width="358" alt="Screenshot 1446-09-20 at 7 29 25 AM" src="https://github.com/user-attachments/assets/118c6f7c-5981-4b08-80bc-f79f783f9c9e" />
