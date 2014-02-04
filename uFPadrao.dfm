inherited FPadrao: TFPadrao
  Caption = 'Formulario Padrao'
  ClientHeight = 384
  ClientWidth = 675
  ExplicitWidth = 691
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 675
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 675
    Height = 343
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitLeft = 8
      object GroupBox4: TGroupBox
        Left = 0
        Top = 256
        Width = 667
        Height = 59
        Align = alBottom
        TabOrder = 0
        object SpeedButton5: TSpeedButton
          Left = 106
          Top = 15
          Width = 89
          Height = 32
          Caption = 'Salvar'
        end
        object SpeedButton6: TSpeedButton
          Left = 11
          Top = 15
          Width = 89
          Height = 32
          Caption = 'Novo'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      ExplicitLeft = 8
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 667
        Height = 57
        Align = alTop
        Caption = ' Pesquisar '
        TabOrder = 0
        ExplicitTop = -6
        object SpeedButton4: TSpeedButton
          Left = 399
          Top = 19
          Width = 74
          Height = 32
          Caption = 'Pesquisar'
        end
        object edPesquisar: TEdit
          Left = 8
          Top = 24
          Width = 385
          Height = 21
          TabOrder = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 57
        Width = 667
        Height = 215
        Align = alClient
        Caption = ' Registros encontrados '
        TabOrder = 1
        ExplicitHeight = 184
        object DBGrid1: TDBGrid
          Left = 2
          Top = 15
          Width = 663
          Height = 198
          Align = alClient
          DataSource = dsCadastro
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 272
        Width = 667
        Height = 43
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 276
        object SpeedButton1: TSpeedButton
          Left = 3
          Top = 6
          Width = 89
          Height = 32
          Caption = 'Editar'
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 98
          Top = 6
          Width = 89
          Height = 32
          Caption = 'Excluir'
          OnClick = SpeedButton2Click
        end
        object SpeedButton3: TSpeedButton
          Left = 193
          Top = 6
          Width = 89
          Height = 32
          Caption = 'Imprimir'
          OnClick = SpeedButton3Click
        end
      end
    end
  end
  object sqsCadastro: TSQLDataSet
    SchemaName = 'sysdba'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.Conexao
    Left = 216
    Top = 160
  end
  object dspCadastro: TDataSetProvider
    DataSet = sqsCadastro
    Left = 312
    Top = 160
  end
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCadastro'
    Left = 400
    Top = 160
  end
  object dsCadastro: TDataSource
    DataSet = cdsCadastro
    Left = 480
    Top = 160
  end
  object sqsConsulta: TSQLDataSet
    SchemaName = 'sysdba'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.Conexao
    Left = 216
    Top = 224
  end
  object dspConsulta: TDataSetProvider
    DataSet = sqsConsulta
    Left = 312
    Top = 224
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 400
    Top = 224
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 480
    Top = 224
  end
end
