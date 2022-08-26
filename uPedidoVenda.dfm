object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedido Venda'
  ClientHeight = 691
  ClientWidth = 989
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 989
    Height = 65
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    object lblStatus: TLabel
      Left = 803
      Top = 20
      Width = 172
      Height = 33
      Caption = 'ENCERRADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlIniciaVenda: TPanel
      Left = 16
      Top = 12
      Width = 128
      Height = 41
      Color = clLime
      ParentBackground = False
      TabOrder = 0
      object btnIniciarVenda: TSpeedButton
        Left = 1
        Top = 1
        Width = 126
        Height = 39
        Align = alClient
        Caption = 'F2 - INICIAR VENDA'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnIniciarVendaClick
        ExplicitWidth = 103
      end
    end
    object pnlCancelarPedido: TPanel
      Left = 286
      Top = 12
      Width = 128
      Height = 41
      Color = clRed
      ParentBackground = False
      TabOrder = 1
      object btnCancelarPedido: TSpeedButton
        Left = 1
        Top = 1
        Width = 126
        Height = 39
        Align = alClient
        Caption = 'CANCELAR PEDIDO'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarPedidoClick
        ExplicitLeft = 51
        ExplicitTop = 0
      end
    end
    object pnlCarregaPedido: TPanel
      Left = 151
      Top = 12
      Width = 128
      Height = 41
      Color = clHighlight
      ParentBackground = False
      TabOrder = 2
      object btnCarregarPedido: TSpeedButton
        Left = 1
        Top = 1
        Width = 126
        Height = 39
        Align = alClient
        Caption = 'CARREGAR PEDIDO'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnCarregarPedidoClick
        ExplicitLeft = 51
        ExplicitTop = 0
      end
    end
    object pnlGravarPedido: TPanel
      Left = 16
      Top = 12
      Width = 128
      Height = 41
      Color = clGreen
      ParentBackground = False
      TabOrder = 3
      object btnGravarPedido: TSpeedButton
        Left = 1
        Top = 1
        Width = 126
        Height = 39
        Align = alClient
        Caption = 'GRAVAR PEDIDO(F4)'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnGravarPedidoClick
        ExplicitLeft = -39
        ExplicitTop = -7
        ExplicitWidth = 118
      end
    end
  end
  object grpBuscaCliente: TGroupBox
    Left = 233
    Top = 65
    Width = 750
    Height = 66
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 8
      Top = 2
      Width = 744
      Height = 58
      Color = clMedGray
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Shape6: TShape
        Left = 252
        Top = 9
        Width = 397
        Height = 41
        Pen.Color = clWhite
        Shape = stRoundRect
      end
      object lblNomeCliente: TLabel
        Left = 197
        Top = 20
        Width = 49
        Height = 16
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCliente: TLabel
        Left = 262
        Top = 16
        Width = 355
        Height = 26
        Caption = '                               '
        Font.Charset = ANSI_CHARSET
        Font.Color = clHotLight
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape3: TShape
        Left = 96
        Top = 9
        Width = 91
        Height = 41
        Pen.Color = clWhite
        Shape = stRoundRect
      end
      object Label15: TLabel
        Left = 12
        Top = 19
        Width = 77
        Height = 16
        Caption = 'C'#243'd Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCodCliente: TEdit
        Left = 104
        Top = 15
        Width = 73
        Height = 31
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edtCodClienteChange
      end
      object Panel3: TPanel
        Left = 656
        Top = 9
        Width = 79
        Height = 41
        Color = clTeal
        ParentBackground = False
        TabOrder = 1
        object btnCliente: TSpeedButton
          Left = 1
          Top = 1
          Width = 77
          Height = 39
          Align = alClient
          Caption = 'BUSCAR (F3)'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnClienteClick
          ExplicitLeft = 2
        end
      end
    end
  end
  object grbDadosProduto: TGroupBox
    Left = 7
    Top = 127
    Width = 443
    Height = 258
    Color = clMedGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object lblProduto: TLabel
      Left = 125
      Top = 5
      Width = 52
      Height = 16
      Alignment = taCenter
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape7: TShape
      Left = 125
      Top = 27
      Width = 306
      Height = 41
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape1: TShape
      Left = 11
      Top = 107
      Width = 110
      Height = 41
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Label3: TLabel
      Left = 14
      Top = 88
      Width = 74
      Height = 16
      Alignment = taCenter
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 138
      Top = 107
      Width = 110
      Height = 41
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblPrecoUnitario: TLabel
      Left = 138
      Top = 88
      Width = 120
      Height = 16
      Alignment = taCenter
      Caption = 'Pre'#231'o Unit'#225'rio(R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape4: TShape
      Left = 11
      Top = 182
      Width = 237
      Height = 59
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Label7: TLabel
      Left = 14
      Top = 160
      Width = 89
      Height = 16
      Alignment = taCenter
      Caption = 'Sub Total(R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape5: TShape
      Left = 11
      Top = 27
      Width = 97
      Height = 41
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Label10: TLabel
      Left = 14
      Top = 5
      Width = 84
      Height = 16
      Alignment = taCenter
      Caption = 'C'#243'd. Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProduto: TEdit
      Left = 136
      Top = 33
      Width = 276
      Height = 27
      TabStop = False
      BorderStyle = bsNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtCodigoProduto: TEdit
      Left = 19
      Top = 37
      Width = 77
      Height = 21
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnChange = edtCodigoProdutoChange
    end
    object pnlAdicionar: TPanel
      Left = 275
      Top = 192
      Width = 120
      Height = 41
      Color = clTeal
      ParentBackground = False
      TabOrder = 3
      object btnAdicionar: TSpeedButton
        Left = 1
        Top = 1
        Width = 118
        Height = 39
        Align = alClient
        Caption = '&ADICIONAR'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnAdicionarClick
        ExplicitLeft = 2
        ExplicitTop = 2
      end
    end
    object edtValorUnitario: TEdit
      Left = 154
      Top = 118
      Width = 77
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = edtValorUnitarioChange
    end
    object edtSubTotal: TEdit
      Left = 26
      Top = 193
      Width = 199
      Height = 37
      TabStop = False
      BorderStyle = bsNone
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtQuantidade: TEdit
      Left = 22
      Top = 117
      Width = 77
      Height = 21
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
      Text = '0'
      OnChange = edtQuantidadeChange
    end
  end
  object GroupBox3: TGroupBox
    Left = 454
    Top = 127
    Width = 531
    Height = 498
    Color = clMedGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label9: TLabel
      Left = 230
      Top = 8
      Width = 59
      Height = 16
      Alignment = taCenter
      Caption = 'Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 14
      Top = 30
      Width = 505
      Height = 435
      DataSource = dtsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo_produto'
          Title.Caption = 'C'#243'digo'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Title.Caption = 'Vlr. Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Caption = 'Vlr. Total'
          Visible = True
        end>
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 391
    Width = 442
    Height = 234
    Color = clMedGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Shape10: TShape
      Left = 14
      Top = 71
      Width = 416
      Height = 130
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Label16: TLabel
      Left = 18
      Top = 25
      Width = 123
      Height = 25
      Alignment = taCenter
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtTotalVenda: TEdit
      AlignWithMargins = True
      Left = 67
      Top = 88
      Width = 286
      Height = 85
      Alignment = taCenter
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 626
    Width = 989
    Height = 65
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 706
  end
  object grbPedido: TGroupBox
    Left = 7
    Top = 68
    Width = 231
    Height = 58
    Color = clMedGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 6
    object Shape8: TShape
      Left = 82
      Top = 9
      Width = 129
      Height = 41
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Label4: TLabel
      Left = 10
      Top = 20
      Width = 67
      Height = 16
      Caption = 'N'#186' Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 97
      Top = 19
      Width = 6
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNumeroPedido: TEdit
      Left = 88
      Top = 14
      Width = 88
      Height = 31
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
  end
  object QryProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 496
    Top = 520
    object QryProdutoscodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
    end
    object QryProdutosdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object QryProdutosvalor_unitario: TCurrencyField
      FieldName = 'valor_unitario'
    end
    object QryProdutosquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object QryProdutosvalor_total: TCurrencyField
      FieldName = 'valor_total'
    end
  end
  object dtsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 552
    Top = 520
  end
end
