inherited FBalanco: TFBalanco
  Caption = 'Ferramenta de Balan'#231'o'
  ClientHeight = 349
  ClientWidth = 613
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 629
  ExplicitHeight = 387
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 613
    ExplicitWidth = 613
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 613
    Height = 51
    Align = alTop
    Caption = ' Pesquisa '
    TabOrder = 1
    object spbPesquisar: TSpeedButton
      Left = 295
      Top = 10
      Width = 42
      Height = 35
      OnClick = spbPesquisarClick
    end
    object edPesquisar: TEdit
      Left = 16
      Top = 13
      Width = 273
      Height = 31
      Cursor = crHandPoint
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = edPesquisarChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 92
    Width = 613
    Height = 188
    Align = alClient
    Caption = ' Produtos Encontrados '
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 609
      Height = 171
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Produto'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Caption = 'Estoque'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE_MIN'
          Title.Caption = 'Est. Minimo'
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 280
    Width = 613
    Height = 69
    Align = alBottom
    Caption = ' Dados do lan'#231'amento '
    TabOrder = 3
    object lblQuantidade: TLabel
      Left = 24
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object spbConfirmar: TSpeedButton
      Left = 408
      Top = 19
      Width = 81
      Height = 42
      Cursor = crHandPoint
      Caption = 'Confirmar'
      Flat = True
      OnClick = spbConfirmarClick
    end
    object edQuantidade: TEdit
      Left = 24
      Top = 32
      Width = 121
      Height = 24
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TextHint = '0.00'
    end
    object rdpOperacao: TRadioGroup
      Left = 176
      Top = 14
      Width = 185
      Height = 49
      Cursor = crHandPoint
      Caption = ' Opera'#231#227'o '
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Saida'
        'Entrada')
      TabOrder = 1
    end
  end
  object sqsPesquisa: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM VPRODUTOS WHERE NOME LIKE :NOME'#13#10'order by nome'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = dm.Conexao
    Left = 232
    Top = 184
  end
  object dspPesquixa: TDataSetProvider
    DataSet = sqsPesquisa
    Left = 256
    Top = 184
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquixa'
    Left = 280
    Top = 184
    object cdsPesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      DisplayFormat = '#0000'
    end
    object cdsPesquisaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsPesquisaCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
    end
    object cdsPesquisaNOMECATEGORIA: TStringField
      FieldName = 'NOMECATEGORIA'
      Size = 50
    end
    object cdsPesquisaCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
      Size = 50
    end
    object cdsPesquisaMARCA: TSmallintField
      FieldName = 'MARCA'
    end
    object cdsPesquisaNOMEMARCA: TStringField
      FieldName = 'NOMEMARCA'
      Size = 50
    end
    object cdsPesquisaPCUSTO: TFMTBCDField
      FieldName = 'PCUSTO'
      Precision = 18
      Size = 2
    end
    object cdsPesquisaPVENDA: TFMTBCDField
      FieldName = 'PVENDA'
      Precision = 18
      Size = 2
    end
    object cdsPesquisaRUA: TStringField
      FieldName = 'RUA'
      Size = 50
    end
    object cdsPesquisaPRATELEIRA: TStringField
      FieldName = 'PRATELEIRA'
      Size = 50
    end
    object cdsPesquisaSECAO: TStringField
      FieldName = 'SECAO'
      Size = 50
    end
    object cdsPesquisaESTOQUE: TFMTBCDField
      FieldName = 'ESTOQUE'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object cdsPesquisaESTOQUE_MIN: TFMTBCDField
      FieldName = 'ESTOQUE_MIN'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
  end
  object dsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 304
    Top = 184
  end
end
