void _start() {
    char *video = (char*) 0xb8000;

    char *msg = "Hello from Kernel";

    int i = 0;

    while (msg[i] != '\0') {
        video[i * 2] = msg[i];
        video[i * 2 + 1] = 0x0F;
        i++;
    }

    while(1);
}