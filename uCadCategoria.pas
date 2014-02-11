unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFPadrao, Data.FMTBcd, Vcl.ImgList,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, uTUtils;

type
  TFCadCategoria = class(TFPadrao)
    cdsConsultaCODIGO: TIntegerField;
    cdsConsultaNOME: TStringField;
    cdsCadastroCODIGO: TIntegerField;
    cdsCadastroNOME: TStringField;
    Label1: TLabel;
    dbNome: TDBEdit;
    procedure spbPesquisarClick(Sender: TObject);
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadCategoria: TFCadCategoria;

implementation

{$R *.dfm}

procedure TFCadCategoria.cdsCadastroNewRecord(DataSet: TDataSet);
var
  util : TUtils;
begin
 // cdsCadastroCODIGO.AsInteger := getId('CATEGORIA_CODIGO_GEN');
  util := TUtils.Create;
  cdsCadastroCODIGO.AsInteger := util.getId('CATEGORIA_CODIGO_GEN');
  util.Free;
  inherited;

end;

procedure TFCadCategoria.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  cdsConsulta.Close;
  cdsConsulta.Params[0].AsString := edPesquisar.Text + '%';
  cdsConsulta.Params[1].AsString := edPesquisar.Text + '%';
  cdsConsulta.Open;

end;

end.
