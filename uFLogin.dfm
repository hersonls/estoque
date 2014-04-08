inherited FLogin: TFLogin
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 173
  ClientWidth = 406
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitWidth = 412
  ExplicitHeight = 201
  PixelsPerInch = 96
  TextHeight = 13
  object spbOK: TSpeedButton [0]
    Left = 290
    Top = 72
    Width = 108
    Height = 79
    Cursor = crHandPoint
    OnClick = spbOKClick
  end
  inherited Panel1: TPanel
    Width = 406
    inherited btnSair: TBitBtn
      Left = 290
      Width = 108
      Visible = False
      ExplicitLeft = 280
      ExplicitWidth = 108
    end
  end
  object edUsuario: TEdit
    Left = 32
    Top = 80
    Width = 225
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'Usu'#225'rio'
  end
  object edSenha: TEdit
    Left = 32
    Top = 120
    Width = 225
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 8
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
    TextHint = 'Senha'
  end
end
