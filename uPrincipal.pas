unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls,
  Vcl.Ribbon, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnList;

type
  TFPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Ribbon1: TRibbon;
    listaDeImagens: TImageList;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    ActionManager1: TActionManager;
    acCategoria: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCategoriaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses uRelMovimentos, uCadCategoria;

procedure TFPrincipal.acCategoriaExecute(Sender: TObject);
begin
    TFCadCategoria.Create(Self).ShowModal;
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
