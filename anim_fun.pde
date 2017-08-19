void setup () {
   size(640, 480);
   textFont(createFont("Georgia", 36));
   noLoop();
}

void draw() {
  background(0);
  int h = 24;
  float a = 39;
  float b = -25;
  int funcion = 4;
  textSize(20);
  if (funcion == 1) text("Tabla lineal, h= " + h + ", [" + a + ", " + b + "]", 20, 40);
  if (funcion == 2) text("Tabla de log(x), h= " + h + ", [" + a + ", " + b + "]", 20, 40);
  if (funcion == 3) text("Tabla del cuarto cuadrante de círculo, h= "+ h + ", [" + a + ", " + b + "]", 20, 40);
  if (funcion == 4) text("Tabla del polinomio interpolado, h= "+ h + ", [" + a + ", " + b + "]", 20, 40);
  textSize(14);
  if (h < 15) {
    fun(a, b, 1, h, h, funcion, 50);
  } else {
    fun(a, b, 1, 15, h, funcion, 50);
    fun(a, b, 16, h, h, funcion, 350);
  }
}

void fun(float Ia, float Ib, float ini, int fin, int total, int funcion, int desp) {
  if (funcion == 1) {
  for (float i = ini; i <= fin; i++) {
     float n = (Ib-Ia) * (i-1)/(total-1) + Ia;
     int r = floor(i);
     int g = floor(n);
     text("Al fotograma " + r + " le corresponde " + g, desp, 60 + 25*(i-ini+1));
  }
  }
  if (funcion == 2) {
  for (float i = ini; i <= fin; i++) {
     float n = (Ib-Ia) * ((log(((i-1)/(total-1)) + 0.01) - log(0.01))/(log(1.01)-log(0.01))) + Ia;
     int r = floor(i);
     int g = floor(n);
     text("Al fotograma " + r + " le corresponde " + g, desp, 60 + 25*(i-ini+1));
  }
  }
  if (funcion == 3) {
  for (float i = ini; i <= fin; i++) {
     float n = (Ib-Ia) * (-sqrt(1-(((i-1)/(total-1))*((i-1)/(total-1)))) + 1) + Ia;
     int r = floor(i);
     int g = floor(n);
     text("Al fotograma " + r + " le corresponde " + g, desp, 60 + 25*(i-ini+1));
  }
  }
  if (funcion == 4) {
  for (float i = ini; i <= fin; i++) {
     float n = 
     (Ib-Ia) * 
     ((-(377.0/168.0)*(10*(i-1)/(total-1)) + 
     (409.0/112.0)*(10*(i-1)/(total-1))*(10*(i-1)/(total-1)) -
     (1909.0/1680.0)*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))*(10*(i-1)/(total-1)) + 
     (15.0/112.0)*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))*(10*(i-1)/(total-1)) - 
     (3.0/560.0)*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))*(10*(i-1)/(total-1))) 
     )/10
     + Ia
     ;
     int r = floor(i);
     int g = floor(n);
     text("Al fotograma " + r + " le corresponde " + g, desp, 60 + 25*(i-ini+1));
  }
  }
}
