unit uRelMovimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRelatorioPadraoData, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFRelTeste = class(TFRelatorioPadraoData)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelTeste: TFRelTeste;

implementation

{$R *.dfm}

end.
