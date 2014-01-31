unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ComCtrls;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Ribbon1: TRibbon;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja fechar o sistema?', 'Confirmação',
  MB_ICONQUESTION+MB_YESNO)=idYes then
    Action := caFree
  else
    Action := caNone;
end;

end.
