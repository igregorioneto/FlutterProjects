abstract class TitleType {
  static String getTitleType(String type) {
    switch(type) {
      case 'TE': return 'Transferência enviada';
      case 'TR': return 'Transferência recebida';
      case 'DB': return 'Depósito por boleto';
      case 'PIXE': return 'Transferência PIX realizada';
      case 'PIXR': return 'Transferência PIX recebida';
      default: return '';
    }
  }
}