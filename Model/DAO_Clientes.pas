unit DAO_Clientes;

interface

type TClientes = class

private
    Fuf: String;
    Fnome: String;
    Fcidade: String;
    FcodigoCliente : Integer;


public

  property codigoCliente : Integer  read FcodigoCliente write FCodigoCliente;
  property nome : String  read Fnome write Fnome;
  property cidade : String  read Fcidade write Fcidade;
  property uf : String  read Fuf write Fuf;

  procedure listarCLientes;
  procedure listarCLientesID;


end;

implementation

uses dmPrincipal, FireDAC.Comp.Client, System.SysUtils;

{ TClientes }

procedure TClientes.listarCLientes;
begin
   dmconexoes.qryClientes.close;
   dmconexoes.qryClientes.SQL.Clear;
   dmconexoes.qryClientes.SQL.Add('select codigo_cliente, nome from clientes where nome like '+ quotedStr('%'+ Fnome + '%'));
   dmconexoes.qryClientes.open;
end;

procedure TClientes.listarCLientesID;
begin
   dmconexoes.qryClientes.close;
   dmconexoes.qryClientes.SQL.Clear;
   dmconexoes.qryClientes.SQL.Add('select codigo_cliente, nome from clientes where codigo_cliente = :codigocliente');
   dmconexoes.qryClientes.ParamByName('codigocliente').AsInteger := FcodigoCliente;
   dmconexoes.qryClientes.open;

   Fnome := dmconexoes.qryClientes.FieldByName('nome').AsString;
end;

end.
