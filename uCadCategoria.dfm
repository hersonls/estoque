inherited FCadCategoria: TFCadCategoria
  Caption = 'FCadCategoria'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited tabCadastro: TTabSheet
      object Label1: TLabel [0]
        Left = 24
        Top = 40
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = dbNome
      end
      object dbNome: TDBEdit
        Left = 24
        Top = 56
        Width = 425
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dsCadastro
        TabOrder = 1
      end
    end
    inherited tabConsulta: TTabSheet
      ExplicitWidth = 150
      inherited GroupBox2: TGroupBox
        inherited DBGrid1: TDBGrid
          DataSource = dsConsulta
        end
      end
    end
  end
  inherited sqsCadastro: TSQLDataSet
    CommandText = 'select * from CATEGORIA where CODIGO =:CODIGO'
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
  inherited cdsCadastro: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object cdsCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  inherited sqsConsulta: TSQLDataSet
    CommandText = 
      'SELECT * FROM CATEGORIA WHERE CODIGO LIKE :CODIGO'#13#10'AND NOME LIKE' +
      ' :NOME ORDER BY NOME'
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
  end
  inherited cdsConsulta: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    object cdsConsultaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsConsultaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
  end
end
