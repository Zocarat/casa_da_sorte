class DadosDoJogo {
  double saldoTeste = 100;

  String getSaldoString() {
    return saldoTeste.toStringAsFixed(2);
  }

  double getSaldoDouble() {
    return saldoTeste;
  }

  void setSaldoDouble(double novoSaldo) {
    saldoTeste = novoSaldo;
  }
}
