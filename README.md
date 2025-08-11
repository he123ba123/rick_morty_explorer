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

## Screenshots 📸

*(Add screenshots here)*

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
