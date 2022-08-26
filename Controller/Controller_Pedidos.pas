unit Controller_Pedidos;

interface

uses DAO_Pedidos, DAO_ItensPedido, System.SysUtils;

type TController_Pedidos = class
     private


     public
        procedure criarPedido(const cPedidos : TPedidos; const cItemPedido : TItensPedido);
        procedure listarPedido(numeroPedido : integer; const cPedidos: TPedidos);
        procedure cancelarPedido(numeroPedido : integer);
     end;

implementation

{ TController_Pedidos }

procedure TController_Pedidos.cancelarPedido(numeroPedido : integer);
var cPedido : TPedidos;
begin
  try

    cPedido := TPedidos.Create;
    cPedido.numeroPedido := numeroPedido;
    cPedido.cancelarPedido;

  finally

    cPedido.Free;

  end;

end;

procedure TController_Pedidos.criarPedido(const cPedidos: TPedidos; const cItemPedido : TItensPedido);
begin
  cPedidos.Qry := cItemPedido.Qry;
  cPedidos.criaPedido;
end;

procedure TController_Pedidos.listarPedido(numeroPedido : integer; const cPedidos: TPedidos);
begin
  cPedidos.numeroPedido := numeroPedido;
  cPedidos.listarPedido;

  if cPedidos.numeroPedido = 0 then
    raise Exception.Create('Pedido não econtrado!');
end;

end.
