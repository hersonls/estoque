unit uTProdutos;

interface

uses Data.SqlExpr;

Type
  TProduto = class
   public
     function setHistorico(pProduto: Integer; pQt: Double; pUsuario: Integer): Boolean;

  end;

implementation



{ TProduto }

uses uDM;

function TProduto.setHistorico(pProduto: Integer; pQt: Double;
  pUsuario: Integer): Boolean;
var
  sQr: TSQLDataSet;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;
  try
    sQr.CommandText := ' insert into hestoque (produto, quantidade, operacao, usuario)' +
                       ' values (:produto, :quantidade,1,:usuario)';
    sQr.Params[0].AsInteger := pProduto;
    sQr.Params[1].AsFloat   := pQt;
    sQr.Params[2].AsInteger := pUsuario;

    sQr.ExecSQL;

    Result := True;
  except
    Result := False;
  end;

  sQr.Free;
end;

end.
