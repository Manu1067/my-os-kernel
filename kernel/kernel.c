*void main() {
    char *video = (char*) 0xb8000;

    video[0] = 'H';
    video[1] = 0x07;

    video[2] = 'E';
    video[3] = 0x07;

    video[4] = 'L';
    video[5] = 0x07;

    video[6] = 'L';
    video[7] = 0x07;

    video[8] = 'O';
    video[9] = 0x07;

    while(1);
}*