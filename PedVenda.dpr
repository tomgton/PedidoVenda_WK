program PedVenda;

uses
  Vcl.Forms,
  uPedidoVenda in 'uPedidoVenda.pas' {frmPedidoVenda},
  dmPrincipal in 'Model\dmPrincipal.pas' {dmConexoes: TDataModule},
  DAO_Clientes in 'Model\DAO_Clientes.pas',
  DAO_Pedidos in 'Model\DAO_Pedidos.pas',
  DAO_ItensPedido in 'Model\DAO_ItensPedido.pas',
  DAO_Produtos in 'Model\DAO_Produtos.pas',
  uClientes in 'View\uClientes.pas' {frmClientes},
  Controller_Clientes in 'Controller\Controller_Clientes.pas',
  Controller_Pedidos in 'Controller\Controller_Pedidos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);
  Application.CreateForm(TdmConexoes, dmConexoes);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
