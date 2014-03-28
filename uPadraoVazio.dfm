object FPadraoVazio: TFPadraoVazio
  Left = 0
  Top = 0
  Caption = 'FPadraoVazio'
  ClientHeight = 250
  ClientWidth = 586
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 503
    DesignSize = (
      586
      41)
    object BitBtn1: TBitBtn
      Left = 504
      Top = 9
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
end
