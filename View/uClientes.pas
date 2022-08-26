unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Controller_Clientes, DAO_Clientes, Vcl.ExtCtrls, Vcl.Buttons;


type
  TfrmClientes = class(TForm)
    GroupBox1: TGroupBox;
    lblDescricao: TLabel;
    edtCliente: TEdit;
    dbgClientes: TDBGrid;
    dtsClientes: TDataSource;
    pnlFinalizar: TPanel;
    btnSelecionar: TSpeedButton;
    procedure edtClienteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure dbgClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    var cControleClientes : TController_Clientes;
        cClientes : TClientes;

    procedure selecionaCliente;

  public

  end;

var
  frmClientes: TfrmClientes;

implementation

uses

  dmPrincipal, uPedidoVenda, System.SysUtils;

{$R *.dfm}

procedure TfrmClientes.btnSelecionarClick(Sender: TObject);
begin
  selecionaCliente();
end;

procedure TfrmClientes.dbgClientesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    selecionaCliente();
end;

procedure TfrmClientes.edtClienteChange(Sender: TObject);
begin

  if edtCliente.Text <> '' then
  begin
    cClientes.nome := edtCliente.Text;
    cControleClientes.listarCLientes(cClientes);
  end;

end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(cClientes);
  FreeAndNil(cControleClientes);
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  cControleClientes := TController_Clientes.Create();
  cClientes := TClientes.Create();
end;

procedure TfrmClientes.selecionaCliente;
begin
  frmPedidoVenda.edtCodCliente.text := dmconexoes.qryClientes.fieldByName('codigo_cliente').AsString;
  frmPedidoVenda.lblCliente.Caption := dmconexoes.qryClientes.fieldByName('nome').AsString;
  Close;
end;

end.
