extern "C" void kernel_main()
{
    char *video_memory = (char *)0xb8000;
    const char *hello = "Hello from Kernel!";

    for (int i = 0; hello[i] != '\0'; ++i)
    {
        video_memory[i * 2] = hello[i]; // Character byte
        video_memory[i * 2 + 1] = 0x07; // Attribute byte (light grey on black)
    }
}
