void main() {
    char* video_memory = (char*) 0xb8000;
    char* message = "Hello from Kernel";

    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];
        video_memory[i * 2 + 1] = 0x0F; // White text on black
    }
}