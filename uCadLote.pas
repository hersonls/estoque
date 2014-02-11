unit uCadLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFPadrao, Data.FMTBcd, Vcl.ImgList,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, uTUtils;

type
  TFCadLote = class(TFPadrao)
    cdsCadastroCODIGO: TIntegerField;
    cdsCadastroVALIDADE: TDateField;
    cdsCadastroUSUARIO: TSmallintField;
    cdsCadastroNUMERO: TStringField;
    cdsConsultaCODIGO: TIntegerField;
    cdsConsultaVALIDADE: TDateField;
    cdsConsultaUSUARIO: TSmallintField;
    cdsConsultaNUMERO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure spbPesquisarClick(Sender: TObject);
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadLote: TFCadLote;

implementation

{$R *.dfm}

procedure TFCadLote.cdsCadastroNewRecord(DataSet: TDataSet);
var
  util : TUtils;
begin
  util := TUtils.Create;
  cdsCadastroCODIGO.AsInteger := util.getId('LOTE_CODIGO_GEN');
  util.Free;
  inherited;

end;

procedure TFCadLote.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  cdsConsulta.Close;
  cdsConsulta.Params[0].AsString := edPesquisar.Text + '%';
  cdsConsulta.Params[1].AsString := edPesquisar.Text + '%';
  cdsConsulta.Open;
end;

end.
