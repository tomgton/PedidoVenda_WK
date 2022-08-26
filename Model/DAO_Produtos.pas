unit DAO_Produtos;

interface

uses
  FireDAC.Comp.Client;

type TProdutos = class

private
    Fdescricao: string;
    FcodigoProduto: integer;
    FprecoVenda: double;

public

  property codigoProduto: integer  read FcodigoProduto write FcodigoProduto;
  property descricao: string  read Fdescricao write Fdescricao;
  property precoVenda: double  read FprecoVenda write FprecoVenda;

  procedure listarProdutoCodigo;

end;


implementation

uses dmPrincipal;


procedure TProdutos.listarProdutoCodigo;
var QryProdutos : TFDQuery;
begin
   QryProdutos := TFDQuery.Create(nil);

   try
     QryProdutos.Connection := dmConexoes.conexao;

     QryProdutos.close;
     QryProdutos.SQL.Clear;
     QryProdutos.SQL.Add('select codigo_produto, descricao, preco_venda from produtos where codigo_produto = :codigo_produto');
     QryProdutos.ParamByName('codigo_produto').AsInteger := FcodigoProduto;
     QryProdutos.open;

     FcodigoProduto := QryProdutos.FieldByName('codigo_produto').AsInteger;
     FDescricao := QryProdutos.FieldByName('descricao').AsString;
     FprecoVenda := QryProdutos.FieldByName('preco_venda').AsCurrency;
   finally

   end;
end;

end.
