inherited FRelatorioPadraoData: TFRelatorioPadraoData
  Caption = 'FRelatorioPadraoData'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TGroupBox
    inherited spbVisualizar: TSpeedButton
      OnClick = spbVisualizarClick
    end
    inherited spbImprimir: TSpeedButton
      OnClick = spbImprimirClick
    end
  end
  object GroupBox2: TGroupBox [2]
    Left = 8
    Top = 55
    Width = 185
    Height = 105
    Caption = ' Informe o per'#297'odo '
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Data Inicio'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object dtInicio: TDateTimePicker
      Left = 16
      Top = 29
      Width = 141
      Height = 21
      Date = 41673.821286909720000000
      Time = 41673.821286909720000000
      TabOrder = 0
    end
    object dtFinal: TDateTimePicker
      Left = 16
      Top = 69
      Width = 141
      Height = 21
      Date = 41673.821286909720000000
      Time = 41673.821286909720000000
      TabOrder = 1
    end
  end
end
