void main() {
  int alter = 32; // initialisierung
  late int alter_2; // Deklaration, late muss genutzt werden wenn noch kein Wert übergeben wird
  alter_2 = 2; // Zuweisung

  print(alter);

  print(alter_2);
 
  alter_2 = 50;
  print(alter_2);
}