unit uFLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoVazio, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFLogin = class(TFPadraoVazio)
    edUsuario: TEdit;
    edSenha: TEdit;
    spbOK: TSpeedButton;
    procedure spbOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    logou: Boolean;
    erros: Integer;

    procedure incrementa;
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Self.logou then
    inherited
  else
    Action := caNone;

end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  inherited;
  Self.logou := False;
  Self.erros := 0;
end;

procedure TFLogin.incrementa;
begin
  Self.erros := Self.erros + 1;
end;

procedure TFLogin.spbOKClick(Sender: TObject);
var
  texto: String;
begin
  inherited;
  texto := 'Usuário ou senha inválido.';

  if Self.erros = 3 then
    begin
      ShowMessage('Você errou a senha 3 vezes, a aplicação será finalizada.');
      Application.Terminate;
    end;

  if (Trim(edUsuario.Text) = '') or (Trim(edSenha.Text) = '')  then
    begin
      ShowMessage(texto);
      incrementa;
      Exit;
    end;

  if  (Trim(edUsuario.Text) = 'ADMIN') and (Trim(edSenha.Text) = 'ADMIN') then
    begin
      Self.logou :=  True;
    end
  else
    begin
      ShowMessage(texto);
      incrementa;
      exit;
    end;




  Self.Close;

end;

end.
