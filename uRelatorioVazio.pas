unit uRelatorioVazio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoVazio, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  Data.SqlExpr;

type
  TFRelatorioVazio = class(TFPadraoVazio)
    GroupBox1: TGroupBox;
    spbVisualizar: TSpeedButton;
    spbImprimir: TSpeedButton;
    Dados: TSQLDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioVazio: TFRelatorioVazio;

implementation

{$R *.dfm}

uses uDM;

end.
