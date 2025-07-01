//Mariana Molina 202222414
//clase 7 sonido

// Importar librería
import processing.sound.*;

SoundFile soundfile;
FFT fft;

int bands = 256;
float[] spectrum = new float[bands];

int x = 0;
int y = 70;
float radio;

void setup() {
  size(1000, 1000);
  background(0);
  
  soundfile = new SoundFile(this, "FUNKTRIBU.mp3");
  soundfile.play();
  
  fft = new FFT(this, bands);
  fft.input(soundfile);
}

void draw() {
  // Análisis de espectro
  fft.analyze(spectrum);
  float level=spectrum[10];
  /// otra posibilidad: float level spectrum[random90,2550]*100; o algo asi
  
  // Generar un número aleatorio
  //float numAleatorio = random(0, 1);

  radio = level * width;
  
  fill(255, 30);
  stroke(random(0, 100), random(100, 255), random(200, 255));
  ellipse(x, y, radio, radio);
  
  x += 10; 
  
  if (x > width) {
    x = 0;
    y = y + 10;
  }
}
