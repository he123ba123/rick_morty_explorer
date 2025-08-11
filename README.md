# Rick and Morty Characters Explorer 🚀

A compact Flutter app to explore characters from the popular TV show **Rick and Morty** using the public API.  
The app demonstrates clean architecture, efficient state management with Bloc, offline support, and a polished UI.

---

## Features ✨

- **Character List**: Display characters with avatars, names, species, and status. 👤
- **Infinite Scroll**: Load more characters as you scroll. 🔄
- **Search**: Search characters. 🔍
- **Favorites**: Mark/unmark characters as favorites; favorites persist offline. ❤️
- **Character Details**: View full details including origin, location, and episodes. 📋
- **Offline Support**: Cache data locally using Hive; show offline banner when no connection. 📡🚫
- **Error Handling**: Friendly messages and retry options on failure. ⚠️

---

## Tech Stack 🛠️

- Flutter & Dart 🦋
- State Management: flutter_bloc 🔧
-  API: dio 🌐
- Dependency Injection: get_it 🧩
- Local Storage & Cache: Hive 📦
- Connectivity: connectivity_plus 📶
- Image Loading: cached_network_image 🖼️

---

## Architecture 🏗️

- **Presentation Layer**: UI widgets + Bloc/Cubit for state management. 🎨
- **Domain Layer**: Entities, use cases, and repository interfaces. 📚
- **Data Layer**: Remote and local data sources, repository implementations, models, and mappers. 🔗

---
## video


https://github.com/user-attachments/assets/af7d9b12-79f7-45a9-bb4b-4d52da8f58c4



--- 

## Screenshots 📸


<img width="441" height="910" alt="Screenshot 2025-08-11 195221" src="https://github.com/user-attachments/assets/fd2dc897-9810-4f38-ae5c-b54291245f80" />


<img width="453" height="900" alt="Screenshot 2025-08-11 195331" src="https://github.com/user-attachments/assets/dd9f34fd-d590-4312-86f0-843e328e5ff7" />


<img width="461" height="889" alt="Screenshot 2025-08-11 195403" src="https://github.com/user-attachments/assets/996343ad-0d04-49d6-b3e8-d2f0bd484671" />


<img width="447" height="898" alt="Screenshot 2025-08-11 195446" src="https://github.com/user-attachments/assets/b3f17411-3272-4a0f-beb4-950951fab072" />


<img width="460" height="903" alt="Screenshot 2025-08-11 195507" src="https://github.com/user-attachments/assets/573e1b57-fb5b-4b0b-838c-896cc240b8e3" />

---

### Prerequisites ✅

- Flutter SDK 
- Dart
- Android Studio
- VS Code

### Installation 💻

- Clone the repo:  
   ```bash
   git clone https://github.com/your-username/rick-morty-explorer.git
   cd rick-morty-explorer

