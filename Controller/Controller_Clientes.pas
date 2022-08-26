unit Controller_Clientes;


interface

uses  DAO_Clientes;

type TController_Clientes = class
     private

     public

     procedure listarCLientes(const cCliente: TClientes);
     procedure listarClienteID(const cCliente: TClientes);

     end;

implementation


{ TController_Cliente }

procedure TController_Clientes.listarCLientes(const cCliente: TClientes);
begin
  cCliente.listarCLientes;
end;

procedure TController_Clientes.listarClienteID;
begin
  cCliente.listarCLientesID;
end;

end.
