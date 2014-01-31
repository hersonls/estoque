inherited FRelatorioVazio: TFRelatorioVazio
  Caption = 'FRelatorioVazio'
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 280
    Top = 80
    Width = 215
    Height = 153
    Caption = ' Relato'#243'rio '
    TabOrder = 1
    object spbVisualizar: TSpeedButton
      Left = 48
      Top = 24
      Width = 145
      Height = 54
      Caption = 'Visualizar'
    end
    object spbImprimir: TSpeedButton
      Left = 48
      Top = 84
      Width = 145
      Height = 54
      Caption = 'Imprimir'
    end
  end
  object SQLDataSet1: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    Params = <>
    Left = 120
    Top = 56
  end
  object DataSetProvider1: TDataSetProvider
    Left = 104
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 56
  end
end
