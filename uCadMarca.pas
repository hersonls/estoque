unit uCadMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFPadrao, Data.FMTBcd, Vcl.ImgList,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, uTUtils;

type
  TFCadMarcas = class(TFPadrao)
    cdsCadastroCODIGO: TIntegerField;
    cdsCadastroNOME: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadMarcas: TFCadMarcas;

implementation

{$R *.dfm}

procedure TFCadMarcas.cdsCadastroNewRecord(DataSet: TDataSet);
var
  util : TUtils;
begin
  util := TUtils.Create;
  cdsCadastroCODIGO.AsInteger := util.getId('MARCA_CODIGO_GEN');
  util.Free;
  inherited;

end;

end.
