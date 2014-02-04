inherited FRelatorioVazio: TFRelatorioVazio
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FRelatorioVazio'
  ClientHeight = 178
  ClientWidth = 458
  ExplicitWidth = 464
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 458
  end
  object GroupBox1: TGroupBox
    Left = 249
    Top = 47
    Width = 191
    Height = 113
    Caption = ' Relat'#243'rio '
    TabOrder = 1
    object spbVisualizar: TSpeedButton
      Left = 24
      Top = 16
      Width = 145
      Height = 41
      Caption = 'Visualizar'
    end
    object spbImprimir: TSpeedButton
      Left = 24
      Top = 63
      Width = 145
      Height = 37
      Caption = 'Imprimir'
    end
  end
  object Dados: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm.Conexao
    Left = 40
    Top = 48
  end
end
