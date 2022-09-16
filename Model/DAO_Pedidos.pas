unit DAO_Pedidos;

interface

uses FireDAC.Comp.Client, DAO_ItensPedido, System.SysUtils, Vcl.Dialogs;

type TPedidos = class

private
    FvalorTotal: Currency;
    FdataEmissao: TDateTime;
    FcodigoCliente: integer;
    FnumeroPedido: integer;
    FQry : TFDMemTable;
    cItensPedido : TItensPedido;

public

  property numeroPedido: integer  read FnumeroPedido write FnumeroPedido;
  property dataEmissao: TDateTime  read FdataEmissao write FdataEmissao;
  property codigoCliente: integer  read FcodigoCliente write FcodigoCliente;
  property valorTotal: Currency  read FvalorTotal write FvalorTotal;
  property Qry: TFDMemTable  read FQry write FQry;

  procedure criaPedido;
  procedure listarPedido;
  procedure cancelarPedido;
  function retornaCodPedido: integer;


end;


implementation

uses dmPrincipal;


{ TPedido }

procedure TPedidos.cancelarPedido;
var QryPedido : TFDQuery;
begin

  cItensPedido := TItensPedido.Create;
  QryPedido := TFDQuery.Create(nil);

  dmConexoes.conexao.StartTransaction;

  try

    try

      //Exclui os itens do pedido primeiro
      cItensPedido.numeroPedido := FnumeroPedido;
      cItensPedido.cancelaItensPedido;

      QryPedido.Connection := dmConexoes.Conexao;

      QryPedido.close;
      QryPedido.SQL.Add('delete from pedidos where numero_pedido = :numero_pedido');
      QryPedido.ParamByName('numero_pedido').AsInteger := FnumeroPedido;
      QryPedido.ExecSQL;

      dmConexoes.conexao.Commit;

    except on E:Exception do
      begin
        dmConexoes.conexao.Rollback;
        raise Exception.Create('Erro ao cancelar o pedido '+ E.Message);
      end;

    end;

  finally
    QryPedido.Free;
    cItensPedido.Free;
  end;

end;

procedure TPedidos.criaPedido;
var QryPedido : TFDQuery;
begin

  cItensPedido := TItensPedido.Create;
  QryPedido := TFDQuery.Create(nil);

  dmConexoes.conexao.StartTransaction;

  try

    try
      QryPedido.Connection := dmConexoes.Conexao;

      QryPedido.close;
      QryPedido.SQL.Add('insert into pedidos(data_emissao, codigo_cliente, valor_total)');
      QryPedido.SQL.Add('values(:data, :codigocliente, :valortotal)');

      QryPedido.ParamByName('data').AsDate             := FdataEmissao;
      QryPedido.ParamByName('codigocliente').AsInteger := FcodigoCliente;
      QryPedido.ParamByName('valortotal').AsCurrency   := FvalorTotal;

      QryPedido.ExecSQL;

      QryPedido.close;
      QryPedido.SQL.clear;
      QryPedido.SQL.Add('select max(numero_pedido) as numero_pedido from pedidos');
      QryPedido.open;

      cItensPedido.numeroPedido := QryPedido.FieldByname('numero_pedido').AsInteger;
      cItensPedido.Qry          := FQry;

      cItensPedido.criaItensPedido;

      FnumeroPedido := QryPedido.FieldByname('numero_pedido').AsInteger;

      dmConexoes.conexao.Commit;

    except on E:Exception do
       begin
         dmConexoes.conexao.rollback;
         raise Exception.Create('Erro ao criar o pedido '+ E.Message);
       end;
    end;


  finally
    QryPedido.Free;
    cItensPedido.Free;
  end;



end;

procedure TPedidos.listarPedido;
var QryPedido : TFDQuery;
begin

  QryPedido    := TFDQuery.Create(nil);
  cItensPedido := TItensPedido.Create;

  try
    QryPedido.Connection := dmConexoes.Conexao;

    QryPedido.close;
    QryPedido.SQL.Add('select numero_pedido, data_emissao, codigo_cliente, valor_total from pedidos where numero_pedido = :numero_pedido');
    QryPedido.ParamByName('numero_pedido').AsInteger := FnumeroPedido;
    QryPedido.open;

    FnumeroPedido  := QryPedido.FieldByname('numero_pedido').AsInteger;
    FdataEmissao   := QryPedido.FieldByname('data_emissao').AsDateTime;
    FcodigoCliente := QryPedido.FieldByname('codigo_cliente').AsInteger;
    FvalorTotal    := QryPedido.FieldByname('valor_total').AsCurrency;

    cItensPedido.numeroPedido := QryPedido.FieldByname('numero_pedido').AsInteger;

    cItensPedido.listarItensPedido;

    FQry := cItensPedido.Qry;

  finally
    QryPedido.free;
  end;
end;

function TPedidos.retornaCodPedido : integer;
var QryPedido : TFDQuery;
begin

  QryPedido := TFDQuery.Create(nil);

  try
    QryPedido.Connection := dmConexoes.Conexao;

    QryPedido.close;
    QryPedido.SQL.Add('select max(codigo_pedido) as codigo_pedido from pedido');
    QryPedido.open;

    Result := QryPedido.FieldByname('codigo_pedido').AsInteger;

  finally
    QryPedido.free;
  end;


end;

end.
