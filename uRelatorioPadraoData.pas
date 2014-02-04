unit uRelatorioPadraoData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRelatorioVazio, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFRelatorioPadraoData = class(TFRelatorioVazio)
    GroupBox2: TGroupBox;
    dtInicio: TDateTimePicker;
    Label1: TLabel;
    dtFinal: TDateTimePicker;
    Label2: TLabel;
    procedure spbVisualizarClick(Sender: TObject);
    procedure spbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioPadraoData: TFRelatorioPadraoData;

implementation

{$R *.dfm}

procedure TFRelatorioPadraoData.FormCreate(Sender: TObject);
begin
  inherited;
  dtInicio.Date := Date - 3; //pode-se criar parametros..
  dtFinal.Date  := Date;
end;

procedure TFRelatorioPadraoData.spbImprimirClick(Sender: TObject);
begin
  inherited;
  if dtInicio.Date > Date then
    begin
      ShowMessage('A data de inicio não pode ser maior que a data atual.');
      Exit;
    end;

  if dtFinal.Date < dtInicio.Date then
    begin
      ShowMessage('A data final não pode ser menor que a data inicial.');
      Exit;
    end;

end;

procedure TFRelatorioPadraoData.spbVisualizarClick(Sender: TObject);
begin
  inherited;
  if dtInicio.Date > Date then
    begin
      ShowMessage('A data de inicio não pode ser maior que a data atual.');
      Exit;
    end;

  if dtFinal.Date < dtInicio.Date then
    begin
      ShowMessage('A data final não pode ser menor que a data inicial.');
      Exit;
    end;



end;

end.
