unit uPedidoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, Controller_Pedidos, DAO_Pedidos, DAO_ItensPedido;

type
  TfrmPedidoVenda = class(TForm)
    grpBuscaCliente: TGroupBox;
    pnlCabecalho: TPanel;
    grbDadosProduto: TGroupBox;
    lblProduto: TLabel;
    Shape7: TShape;
    Shape1: TShape;
    Label3: TLabel;
    edtProduto: TEdit;
    Shape2: TShape;
    lblPrecoUnitario: TLabel;
    Shape4: TShape;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    Shape5: TShape;
    Label10: TLabel;
    pnlRodape: TPanel;
    edtCodigoProduto: TEdit;
    pnlAdicionar: TPanel;
    btnAdicionar: TSpeedButton;
    pnlIniciaVenda: TPanel;
    btnIniciarVenda: TSpeedButton;
    edtValorUnitario: TEdit;
    edtSubTotal: TEdit;
    QryProdutos: TFDMemTable;
    QryProdutoscodigo_produto: TIntegerField;
    QryProdutosdescricao: TStringField;
    QryProdutosvalor_unitario: TCurrencyField;
    dtsProdutos: TDataSource;
    QryProdutosquantidade: TIntegerField;
    QryProdutosvalor_total: TCurrencyField;
    edtQuantidade: TEdit;
    grbPedido: TGroupBox;
    Shape8: TShape;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Shape6: TShape;
    lblNomeCliente: TLabel;
    lblCliente: TLabel;
    edtCodCliente: TEdit;
    Shape3: TShape;
    Label15: TLabel;
    edtNumeroPedido: TEdit;
    Panel3: TPanel;
    btnCliente: TSpeedButton;
    lblStatus: TLabel;
    pnlCancelarPedido: TPanel;
    btnCancelarPedido: TSpeedButton;
    pnlCarregaPedido: TPanel;
    btnCarregarPedido: TSpeedButton;
    pnlGravarPedido: TPanel;
    btnGravarPedido: TSpeedButton;
    Shape10: TShape;
    edtTotalVenda: TEdit;
    Label16: TLabel;
    pnlCancelaInsercao: TPanel;
    btnCancelaInsercao: TSpeedButton;
    procedure btnClienteClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure edtCodClienteChange(Sender: TObject);
    procedure btnIniciarVendaClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnPedidosClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtValorUnitarioChange(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure btnCarregarPedidoClick(Sender: TObject);
    procedure btnCancelaInsercaoClick(Sender: TObject);
  private
    function criaPedido : integer;
    procedure carregaPedido;
    procedure carregaCliente(codcliente : integer);
    procedure carregaProduto(codigoproduto : integer);
    procedure calculaSubTotal;
    procedure adicionarAlterarItemsGrid(codigo_produto,quantidade : Integer; descricao : string; valor_unitario, valor_total : Currency);
    procedure calculaValorTotal;
    procedure habilitaBotoes(value:Boolean);
    procedure carregaDadosItem;
    procedure apagaItem;
    procedure limpaCampos;

    var cControlePedidos : TController_Pedidos;
        cPedidos : TPedidos;
        cItensPedidos : TItensPedido;
        tipoOperacao : string;

  public
    codigoCliente : Integer;
  end;

var
  frmPedidoVenda: TfrmPedidoVenda;

implementation

uses uClientes, Controller_Clientes,
     DAO_Clientes, DAO_Produtos,dmPrincipal;

{$R *.dfm}

procedure TfrmPedidoVenda.adicionarAlterarItemsGrid(codigo_produto, quantidade : Integer; descricao : string; valor_unitario, valor_total : Currency);
begin
  QryProdutos.Open;

  if tipoOperacao = 'I' then
  begin
    QryProdutos.insert;
    QryProdutos.FieldByName('codigo_produto').AsInteger  := codigo_produto;
    QryProdutos.FieldByName('descricao').AsString        := descricao;
    QryProdutos.FieldByName('quantidade').AsInteger      := quantidade;
    QryProdutos.FieldByName('valor_unitario').AsCurrency := valor_unitario;
    QryProdutos.FieldByName('valor_total').AsCurrency    := valor_total;
    edtCodigoProduto.SetFocus;
  end
  else
  begin
    QryProdutos.Edit;
    QryProdutos.FieldByName('quantidade').AsInteger      := quantidade;
    QryProdutos.FieldByName('valor_unitario').AsCurrency := valor_unitario;
    QryProdutos.FieldByName('valor_total').AsCurrency    := valor_total;

    btnAdicionar.Caption := 'ADICIONAR';
    tipoOperacao         := 'I';
   end;

   QryProdutos.post;
end;


procedure TfrmPedidoVenda.apagaItem;
var valor : Currency;
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin

    try

      valor := QryProdutos.FieldByName('valor_unitario').AsCurrency;
      QryProdutos.delete;
      calculaValorTotal;

    except on E:Exception do
      begin
        ShowMessage('Erro ao excluir item - ' + E.Message);
        Abort
      end;
    end;

  end;

end;

procedure TfrmPedidoVenda.btnAdicionarClick(Sender: TObject);
begin
  adicionarAlterarItemsGrid(
                    StrToInt(edtCodigoProduto.Text),
                    StrToInt(edtQuantidade.Text),
                    edtProduto.Text,
                    StrToCurr(edtValorUnitario.Text),
                    StrToCurr(edtSubTotal.Text)
                    );
  calculaValorTotal;

  limpaCampos;

end;


procedure TfrmPedidoVenda.btnCancelaInsercaoClick(Sender: TObject);
begin
  limpaCampos;
  QryProdutos.Close;
end;

procedure TfrmPedidoVenda.btnCancelarPedidoClick(Sender: TObject);
var numeropedido : string;
begin
  if InputQuery('Pedido cara cancelar:', 'nº pedido', numeropedido)then
  begin

     edtNumeroPedido.Text := numeropedido;
     carregaPedido;

     if MessageDlg('Deseja mesmo cancelar o pedido de nº: '+numeropedido + '?', mtConfirmation, mbYesNo, 0) = mrYes then
     begin
       cControlePedidos := TController_Pedidos.Create();
       cControlePedidos.cancelarPedido(StrToInt(numeropedido));
     end;
  end;
end;

procedure TfrmPedidoVenda.btnCarregarPedidoClick(Sender: TObject);
var numeropedido : string;
begin
  if InputQuery('Carregar pedido:', 'nº pedido', numeropedido)then
  begin
     edtNumeroPedido.Text := numeropedido;
     carregaPedido;
  end;
end;

procedure TfrmPedidoVenda.btnClienteClick(Sender: TObject);
begin
  try
    if not Assigned(frmClientes) then
      Application.CreateForm(TfrmClientes, frmClientes);

    frmClientes.ShowModal;

  finally

    FreeAndNil(frmClientes)

  end;

end;


procedure TfrmPedidoVenda.btnGravarPedidoClick(Sender: TObject);
begin
  if QryProdutos.RecordCount > 0 then
  begin
    edtNumeroPedido.Text := intToStr(criaPedido);
    lblStatus.Caption    := 'ENCERRADO';
    habilitaBotoes(false);
  end
  else
  begin
    ShowMessage('Não existe itens para serem gravados!');
  end;
end;

procedure TfrmPedidoVenda.calculaSubTotal;
var subtotal : Currency;
begin
  try
    if (edtQuantidade.Text <> '') and (edtQuantidade.Text <> '')  then
    begin
      subtotal := StrToInt(edtQuantidade.Text) * StrToCurr(edtValorUnitario.Text);
      edtSubTotal.Text := FormatFloat('##,###,##0.00',subtotal);
    end;

  except on E:Exception do

    ShowMessage('Erro em cálculo de valores: ' + E.Message);

  end;
end;

procedure TfrmPedidoVenda.calculaValorTotal;
var valorTotal : Currency;
begin
  valorTotal := 0;

  try

    QryProdutos.First;

    while not QryProdutos.Eof do
    begin
       valorTotal := valorTotal + QryProdutos.FieldByName('valor_total').AsCurrency;
       QryProdutos.Next;
    end;

    edtTotalVenda.Text := FormatFloat('##,###,##0.00',valorTotal);

  except on E:Exception do
    ShowMessage('Erro em cálculo de valores: ' + E.Message);
  end;

end;

procedure TfrmPedidoVenda.carregaCliente(codcliente : integer);
var cControleCliente : TController_Clientes;
    cClientes         : TClientes;
begin
  try
    cControleCliente := TController_Clientes.Create();
    cClientes        := TClientes.Create();

    cClientes.codigoCliente := codcliente;
    cControleCliente.listarClienteID(cClientes);

    lblCliente.Caption := cClientes.nome;


  finally
    cControleCliente.Free;
    cClientes.Free;
  end;

end;

procedure TfrmPedidoVenda.carregaDadosItem;
begin
  edtCodigoProduto.Text :=  IntToStr(QryProdutos.FieldByName('codigo_produto').AsInteger);
  edtQuantidade.Text    :=  IntToStr(QryProdutos.FieldByName('quantidade').AsInteger);
  edtProduto.Text       :=  QryProdutos.FieldByName('descricao').AsString;
  edtValorUnitario.Text :=  CurrToStr(QryProdutos.FieldByName('valor_unitario').AsCurrency);
  edtSubTotal.Text      :=  CurrToStr(QryProdutos.FieldByName('valor_total').AsCurrency);

  edtQuantidade.Enabled    := True;
  edtValorUnitario.Enabled := True;

  edtQuantidade.SetFocus;
end;


procedure TfrmPedidoVenda.carregaPedido;
begin
  tipoOperacao := 'I';

  cControlePedidos := TController_Pedidos.Create();
  cPedidos := TPedidos.Create();
  cItensPedidos := TItensPedido.Create();

  cControlePedidos.listarPedido(StrToInt(edtNumeroPedido.Text),cPedidos);

  edtCodCliente.text   := IntToStr(cPedidos.codigoCliente);
  edtNumeroPedido.text := IntToStr(cPedidos.numeroPedido);
  edtTotalVenda.Text   := CurrToStr(cPedidos.valorTotal);

  cPedidos.Qry.First;

  while not cPedidos.Qry.Eof do
  begin
     adicionarAlterarItemsGrid(
                      cPedidos.Qry.FieldByName('codigo_produto').AsInteger,
                      cPedidos.Qry.FieldByName('quantidade').AsInteger,
                      cPedidos.Qry.FieldByName('descricao').AsString,
                      cPedidos.Qry.FieldByName('valor_unitario').AsCurrency,
                      cPedidos.Qry.FieldByName('valor_total').AsCurrency
                       );
     cPedidos.Qry.Next;
  end;

  lblStatus.Caption := 'ENCERRADO';

end;

procedure TfrmPedidoVenda.carregaProduto(codigoproduto: integer);
var cProdutos : TProdutos;
begin
  try
    cProdutos := TProdutos.Create();

    cProdutos.codigoproduto := codigoproduto;
    cProdutos.listarProdutoCodigo;

    edtProduto.Text       := cProdutos.descricao;
    edtValorUnitario.Text := FormatFloat('##,###,##0.00',cProdutos.precoVenda);

  finally
    cProdutos.Free;
  end;

  edtQuantidade.Text := '1';

end;

function TfrmPedidoVenda.criaPedido : integer;
begin
  try
    cControlePedidos := TController_Pedidos.Create();
    cPedidos := TPedidos.Create();
    cItensPedidos := TItensPedido.Create();

    cPedidos.dataEmissao   := Date();
    cPedidos.codigoCliente := StrToInt(edtCodCliente.Text);
    cPedidos.valorTotal    := StrToCurr(edtTotalVenda.Text);

    cItensPedidos.Qry := QryProdutos;

    cControlePedidos.criarPedido(cPedidos, cItensPedidos);

    result := cPedidos.numeroPedido;

  finally
    cControlePedidos.Free;
    cPedidos.Free;
    cItensPedidos.Free;
  end;

end;

procedure TfrmPedidoVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (lblStatus.Caption = 'ABERTO') then
  begin
    carregaDadosItem;
    tipoOperacao := 'A';
    btnAdicionar.Caption := 'CONFIRMAR';
  end;

  if (Key = VK_DELETE) and (lblStatus.Caption = 'ABERTO') then
  begin
    apagaItem;
  end;

end;

procedure TfrmPedidoVenda.edtCodClienteChange(Sender: TObject);
var cControlePedidos : TController_Pedidos;
begin
  if edtCodCliente.text <> '' then
    carregaCliente(StrToInt(edtCodCliente.Text));
end;

procedure TfrmPedidoVenda.edtCodigoProdutoChange(Sender: TObject);
begin
  if edtCodigoProduto.Text <> '' then
  begin
    carregaProduto(StrToInt(edtCodigoProduto.Text));
  end;
end;

procedure TfrmPedidoVenda.edtQuantidadeChange(Sender: TObject);
begin
  calculaSubTotal;
end;

procedure TfrmPedidoVenda.edtValorUnitarioChange(Sender: TObject);
begin
  calculaSubTotal;
end;

procedure TfrmPedidoVenda.FormCreate(Sender: TObject);
begin
  habilitaBotoes(false);
  lblStatus.Caption := '';
end;

procedure TfrmPedidoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnAdicionar.OnClick(self);
end;

procedure TfrmPedidoVenda.habilitaBotoes(value: Boolean);
begin
  edtCodCliente.Enabled      := value;
  edtCodigoProduto.Enabled   := value;
  edtQuantidade.Enabled      := value;
  edtNumeroPedido.Enabled    := not(value);
  btnAdicionar.Enabled       := value;
  btnCliente.Enabled         := value;
  pnlGravarPedido.Visible    := value;
  pnlIniciaVenda.Visible     := not(value);
  pnlCarregaPedido.Visible   := not(value);
  pnlCancelarPedido.Visible  := not(value);
  pnlCancelaInsercao.Visible := value;
end;

procedure TfrmPedidoVenda.limpaCampos;
begin
  edtCodigoProduto.Text := '';
  edtQuantidade.Text    := '';
  edtProduto.Text       := '';
  edtValorUnitario.Text := '';
  edtSubTotal.Text      := '';
end;


procedure TfrmPedidoVenda.btnIniciarVendaClick(Sender: TObject);
begin
  habilitaBotoes(true);

  edtNumeroPedido.Text := '000000';
  edtCodCliente.Text   := '1';
  lblStatus.Caption    := 'ABERTO';
  tipoOperacao         := 'I';

  QryProdutos.Close;

  edtCodigoProduto.SetFocus;
end;

procedure TfrmPedidoVenda.btnPedidosClick(Sender: TObject);
begin
  if edtNumeroPedido.Text = '' then
  begin
    ShowMessage('Insira número do pedido a ser carregado!');
    edtNumeroPedido.SetFocus;
  end
  else
  begin
    QryProdutos.Close;
    carregaPedido;
  end;
end;

end.
