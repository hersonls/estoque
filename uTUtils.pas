unit uTUtils;

interface

uses Data.SqlExpr;

type
  TUtils = class
    function getId(Generator: String): Integer; overload;
    function getid(Generator: String; valor: Integer): Integer; overload;
  end;

implementation

{ TUtils }

uses uDM;

function TUtils.getId(Generator: String): Integer;
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

function TUtils.getId(Generator: String; valor: Integer): Integer;
var
  sQr: TSQLDataSet;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;

  sQr.CommandText := 'select gen_id(' + Generator +', 0) as valor from rdb$database';
  sQr.Open;

  Result := sQr.FieldByName('valor').AsInteger;

  sQr.Free;
end;

end.
