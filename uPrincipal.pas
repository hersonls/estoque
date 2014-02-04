unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Ribbon1: TRibbon;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses uRelMovimentos;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
  TFRelTeste.Create(Self).ShowModal;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja fechar o sistema?', 'Confirmação',
  MB_ICONQUESTION+MB_YESNO)=idYes then
    Action := caFree
  else
    Action := caNone;
end;

end.
