unit uFuncoes;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, Data.SqlExpr;

function getId(Generator: String): Integer;
function logAcesso(pCodUsuario: integer): Integer; overload;
procedure logAcesso(pCodUsuario, pCodAcesso: Integer); overload;

var
  codUsuario: Integer;
  codAcesso: Integer;

implementation

uses uDM;

function getId(Generator: String): Integer;
var
  sQr: TSQLDataSet;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;

  sQr.CommandText := 'select gen_id(' + Generator +', 1) as valor from rdb$database';
  sQr.Open;

  Result := sQr.FieldByName('valor').AsInteger;

  sQr.Free;
end;


function logAcesso(pCodUsuario: integer): Integer; overload;
var
  sQr: TSQLDataSet;
  pCodAcesso: Integer;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;

  pCodAcesso := getId('LOGACESSO_CODIGO_GEN');

  sQr.CommandText := 'insert into logacesso (codigo, usuario) values (:codigo, :usuario)';
  sQr.Params[0].AsInteger := pCodAcesso;
  sQr.Params[1].AsInteger := pCodUsuario;
  sQr.ExecSQL;

  Result := pCodAcesso;

  sQr.Free;
end;

procedure logAcesso(pCodUsuario, pCodAcesso: Integer); overload;
var
  sQr: TSQLDataSet;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;

  sQr.CommandText := 'update logacesso set saida=current_timestamp where codigo=:codigo';
  sQr.Params[0].AsInteger := pCodAcesso;
  sQr.ExecSQL;

  sQr.Free;
end;

end.
