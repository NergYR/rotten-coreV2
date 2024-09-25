// kernel/main.c

// Déclaration de la fonction
void kernel_main() {
    // Adresse de la mémoire vidéo (0xB8000 pour le mode texte)
    char *video_memory = (char *)0xB8000;
    
    // Message à afficher
    const char *message = "Hello, Kernel World!";
    
    // Remplir la mémoire vidéo avec le message
    for (int i = 0; message[i] != '\0'; i++) {
        video_memory[i * 2] = message[i];      // Caractère
        video_memory[i * 2 + 1] = 0x07;         // Attribut (couleur : texte blanc sur fond noir)
    }
    
    // Boucle infinie pour empêcher le noyau de se terminer
    while (1) {
        asm volatile ("hlt"); // HLT instruction pour suspendre le processeur
    }
}
