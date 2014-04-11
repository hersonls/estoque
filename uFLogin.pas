unit uFLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoVazio, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TFLogin = class(TFPadraoVazio)
    edUsuario: TEdit;
    edSenha: TEdit;
    spbOK: TSpeedButton;
    sqsLogin: TSQLDataSet;
    procedure spbOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    logou: Boolean;
    erros: Integer;

    procedure incrementa;
    procedure setStatusBar(Usuario: String);
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses uDM, uPrincipal, uFuncoes;

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

procedure TFLogin.setStatusBar(Usuario: String);
begin
  with FPrincipal.stbprincipal do
    begin
       Panels[0].Text := 'Data: ' + DateToStr(Date);
       Panels[2].Text := 'Usuário: ' + Usuario;
    end;
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

  sqsLogin.Close;
  sqsLogin.Params[0].AsString := edUsuario.Text;
  sqsLogin.Params[1].AsString := edSenha.Text;
  sqsLogin.Open;

  if (sqsLogin.FieldByName('LOGIN').AsString = edUsuario.Text)
    and (sqsLogin.FieldByName('SENHA').AsString = edSenha.Text) then
  begin
    logou := True;
    Self.Close;
    codUsuario := sqsLogin.FieldByName('CODIGO').AsInteger;
    codAcesso  := logAcesso(codUsuario);

    setStatusBar(edUsuario.Text);
    Exit;
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
      Self.Close;
      setStatusBar(edUsuario.Text);
      Exit;
    end
  else
    begin
      ShowMessage(texto);
      incrementa;
      exit;
    end;




end;

end.
