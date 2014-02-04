object FPrincipal: TFPrincipal
  Left = 0
  Top = 0
  Caption = 'Laboratorio de Programa'#231#227'o'
  ClientHeight = 414
  ClientWidth = 665
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 395
    Width = 665
    Height = 19
    Panels = <>
  end
  object Ribbon1: TRibbon
    Left = 0
    Top = 0
    Width = 665
    Height = 143
    Caption = 'Laborat'#243'rio de Programa'#231#227'o'
    StyleName = 'Ribbon - Luna'
  end
  object Button1: TButton
    Left = 216
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
end
