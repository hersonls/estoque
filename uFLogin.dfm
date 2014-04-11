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
    ExplicitWidth = 406
    inherited btnSair: TBitBtn
      Left = 290
      Width = 108
      Visible = False
      ExplicitLeft = 290
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
  object sqsLogin: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 'SELECT * FROM USUARIO WHERE LOGIN =:LOGIN'#13#10'AND SENHA =:SENHA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
      end>
    SQLConnection = dm.Conexao
    Left = 152
    Top = 40
  end
end
