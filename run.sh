#!/bin/bash
set -e  # Exit on error

BUILD_DIR="build"
EXECUTABLE="$BUILD_DIR/musiCpp"
DEFAULT_AUDIO="test_audio.ogg"

# Check if build directory exists, if not create and configure CMake
if [ ! -d "$BUILD_DIR" ]; then
    echo "🔧 Build directory not found. Creating and configuring CMake..."
    mkdir "$BUILD_DIR"
    cmake -S . -B "$BUILD_DIR"
fi

# Build the project (only recompile modified files)
echo "🔨 Building musiC++..."
cmake --build "$BUILD_DIR" -- -j$(nproc)

# Run tests if "--test" argument is passed
if [ "$1" == "--test" ]; then
    echo "🧪 Running musiC++ Tests..."
    
    # Check if the binary exists
    if [ ! -f "$EXECUTABLE" ]; then
        echo "❌ Error: musiCpp binary not found. Please build the project first."
        exit 1
    fi

    # Test basic execution
    echo "🔹 Testing execution..."
    "$EXECUTABLE" --version
    echo "✅ Execution test passed."

    # Test playing a sample file
    if [ -f "$DEFAULT_AUDIO" ]; then
        echo "🔹 Testing audio playback..."
        "$EXECUTABLE" play "$DEFAULT_AUDIO"
        echo "✅ Playback test passed."
    else
        echo "⚠️ Warning: Test audio file ($DEFAULT_AUDIO) not found. Skipping playback test."
    fi

    # Check for memory leaks (if Valgrind is installed)
    if command -v valgrind &> /dev/null; then
        echo "🔹 Running memory leak test with Valgrind..."
        valgrind --leak-check=full --error-exitcode=1 "$EXECUTABLE" --test
        echo "✅ Memory leak test passed."
    fi

    exit 0
fi

# Determine the audio file to use
if [ -z "$1" ]; then
    if [ -f "$DEFAULT_AUDIO" ]; then
        AUDIO_FILE="$DEFAULT_AUDIO"
        echo "🎵 No audio file provided. Using default: $DEFAULT_AUDIO"
    else
        echo "❌ Error: No audio file provided and default file is missing!"
        exit 1
    fi
else
    AUDIO_FILE="$1"
fi

# Run the compiled executable
echo "🚀 Running musiC++ with: $AUDIO_FILE"
"$EXECUTABLE" "$AUDIO_FILE"
