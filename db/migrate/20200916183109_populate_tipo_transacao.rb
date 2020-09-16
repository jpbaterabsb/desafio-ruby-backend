class PopulateTipoTransacao < ActiveRecord::Migration[6.0]
  def up
    TipoTransacao.create([
      {
        descricao: 'Débito',
        natureza: 0
      },
      {
        descricao: 'Boleto',
        natureza: 1
      },
      {
        descricao: 'Financiamento',
        natureza: 1
      },
      {
        descricao: 'Crédito',
        natureza: 0
      },
      {
        descricao: 'Recebimento Empréstimo',
        natureza: 0
      },
      {
        descricao: 'Vendas',
        natureza: 0
      },
      {
        descricao: 'Recebimento TED',
        natureza: 0
      },
      {
        descricao: 'Recebimento DOC',
        natureza: 0
      },
      {
        descricao: 'Aluguel',
        natureza: 1
      },
    ])
  end
 
  def down
    TipoTransacao.delete_all
  end
end
