object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Busca Cliente'
  ClientHeight = 530
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 645
    Height = 89
    Align = alTop
    Caption = 'Busca'
    Color = clMedGray
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 635
    object lblDescricao: TLabel
      Left = 16
      Top = 26
      Width = 77
      Height = 13
      Caption = 'Nome Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCliente: TEdit
      Left = 16
      Top = 45
      Width = 601
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtClienteChange
    end
  end
  object dbgClientes: TDBGrid
    Left = 0
    Top = 95
    Width = 635
    Height = 370
    DataSource = dtsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = dbgClientesKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo_cliente'
        Title.Caption = 'C'#243'd. Cliente'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome Cliente'
        Width = 536
        Visible = True
      end>
  end
  object pnlFinalizar: TPanel
    Left = 254
    Top = 471
    Width = 120
    Height = 42
    Color = clGreen
    ParentBackground = False
    TabOrder = 2
    object btnSelecionar: TSpeedButton
      Left = 1
      Top = 1
      Width = 118
      Height = 40
      Align = alClient
      Caption = 'SELECIONAR'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Open sams '
      Font.Style = []
      ParentFont = False
      OnClick = btnSelecionarClick
      ExplicitLeft = 56
      ExplicitTop = 16
      ExplicitWidth = 23
      ExplicitHeight = 22
    end
  end
  object dtsClientes: TDataSource
    DataSet = dmConexoes.qryClientes
    Left = 312
    Top = 224
  end
end
