unit uFuncoes;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, Data.SqlExpr;

function getId(Generator: String): Integer;

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

end.
