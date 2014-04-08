unit uPadraoVazio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFPadraoVazio = class(TForm)
    Panel1: TPanel;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoVazio: TFPadraoVazio;

implementation

{$R *.dfm}

procedure TFPadraoVazio.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFPadraoVazio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPadraoVazio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then
    btnSairClick(Sender);

  if key = 13 then
    begin
      Perform(WM_NEXTDLGCTL, 0,0);
    end;

end;

end.
