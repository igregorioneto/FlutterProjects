String titlesCardTypeItem(String status) {
  return status == 'Receiving'
      ? 'quarentena'
      : status == 'Quarantine'
      ? 'disponível para armazenamento'
      : 'em armazenamento';
}

String titlesStatusTypeItem(String status) {
  return status == 'Receiving'
      ? 'Recebimento'
      : status == 'Quarantine'
      ? 'Quarentena'
      : 'Armazenamento';
}

String titlesStatusTypeItemForFilter(String status) {
  return status == 'Recebimento'
      ? 'Receiving'
      : status == 'Quarentena'
      ? 'Quarantine'
      : 'Storage';
}

String titlesStatusNextTypeItem(String status) {
  return status == 'Receiving'
      ? 'Quarentena'
      : status == 'Quarantine'
      ? 'Armazenamento'
      : '';
}