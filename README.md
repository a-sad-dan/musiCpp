# MusiC++

A C++ CLI-based Music Player (Phase 1)

## Overview

**musiC++** is a command-line music player built using **C++ and SFML**.

- Play, pause, and stop audio files
- Manage playlists
- Control volume and playback
- Log playback history

This project is developed in **two phases**:

1. **Phase 1**: CLI-based music player (current stage)
2. **Phase 2**: UI-based version

---

## Features

- Play MP3, WAV, and OGG files
- Pause, resume, and stop playback
- Manage playlists (add/remove songs)
- Adjust volume
- Log playback history

---

## Project Structure

```
/musiCpp
 ├── /build             # Compiled binaries (ignored in Git)
 ├── /src               # Source files
 │   ├── main.cpp       # Entry point
 │   ├── player.cpp     # Audio playback logic
 │   ├── playlist.cpp   # Playlist management
 │   ├── controls.cpp   # User input handling
 │   ├── filemanager.cpp # File operations
 │   ├── logger.cpp     # Logs playback history
 │   ├── config.cpp     # Configuration settings
 ├── /include           # Header files
 │   ├── player.h
 │   ├── playlist.h
 │   ├── controls.h
 │   ├── filemanager.h
 │   ├── logger.h
 │   ├── config.h
 │   ├── common.h       # Precompiled headers
 ├── CMakeLists.txt     # CMake build configuration
 ├── run.sh             # Automated testing script
 ├── test_audio.ogg     # Sample audio file for testing
 ├── README.md          # Project documentation
```

---

## Getting Started

### **Install Dependencies**

#### **Linux (Ubuntu/Debian)**

```bash
sudo apt update
sudo apt install libsfml-dev cmake g++
```

#### **Mac (Homebrew)**

```bash
brew install sfml cmake
```

#### **Windows (vcpkg)**

```powershell
vcpkg install sfml
```

---

### **Build & Run**

```bash
git clone https://github.com/yourusername/musiCpp.git
cd musiCpp
chmod u+x run.sh
./run.sh
```

---

### **Usage**

| Command          | Description                     |
| ---------------- | ------------------------------- |
| `play <file>`    | Play a song                     |
| `pause`          | Pause playback                  |
| `resume`         | Resume playback                 |
| `stop`           | Stop the music                  |
| `add <file>`     | Add a song to the playlist      |
| `remove <file>`  | Remove a song from the playlist |
| `list`           | Show playlist                   |
| `volume <level>` | Set volume (0-100)              |
| `exit`           | Quit the player                 |

---

## Configuration

Modify `config.h` to set:

- Default volume
- File paths
- Logging preferences

---

## Running Tests

Run the test script to check memory leaks with valgrind.

#### Install Valgrind
```bash
sudo apt update
sudo apt install valgrind
```

#### Run tests
```bash
./run.sh --test
```

---

## License

This project is licensed under the **MIT License**.

---

## Contributing

1. Fork the repo
2. Create a branch (`feature-xyz`)
3. Commit changes
4. Open a Pull Request

---

Developed by [***a-sad-dan***](https://a-sad-dan-folio.netlify.app)