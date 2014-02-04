unit uFPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoVazio, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TFPadrao = class(TFPadraoVazio)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edPesquisar: TEdit;
    SpeedButton4: TSpeedButton;
    GroupBox4: TGroupBox;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    sqsCadastro: TSQLDataSet;
    dspCadastro: TDataSetProvider;
    cdsCadastro: TClientDataSet;
    dsCadastro: TDataSource;
    sqsConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadrao: TFPadrao;

implementation

{$R *.dfm}

uses uDM;

procedure TFPadrao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if cdsConsulta.RecordCount = 0 then
    Exit;

end;

procedure TFPadrao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if cdsConsulta.RecordCount = 0 then
    Exit;

  if Application.MessageBox('Deseja excluir este registro?','Confirmação', MB_YESNO + MB_YESNO)=idYes then
    begin
      cdsCadastro.Close;
      cdsCadastro.Params[0].AsInteger := cdsConsulta.FieldByName('CODIGO').AsInteger;
      cdsCadastro.Open;

      cdsCadastro.Delete;
      cdsCadastro.ApplyUpdates(0);
    end;

  cdsConsulta.Refresh;

end;

procedure TFPadrao.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if cdsConsulta.RecordCount = 0 then
    Exit;

end;

end.
