unit uTProdutos;

interface

uses Data.SqlExpr;

Type
  TProduto = class
   public
     //grava o historico de movimentações de um produto
     function setHistorico(pProduto: Integer; pQt: Double; pUsuario: Integer): Boolean;
     //grava a modificação do estoque do produto
     function estoque(pProduto: Integer; pQt: Double; pUsuario, pOperacao: Integer): Boolean;
     //retorna o estoque de um produto
     function getEstoque(pProduto: Integer): Double;
  end;

implementation



{ TProduto }

uses uDM;

function TProduto.estoque(pProduto: Integer; pQt: Double; pUsuario,
  pOperacao: Integer): Boolean;
var
  sQr: TSQLDataSet;
  estoque: Double;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;
  try
    sQr.CommandText := ' update produtos set estoque =:estoque where codigo=:codigo';

    //busca o estoque do produto passado por parametro
    estoque := Self.getEstoque(pProduto);

    //aqui compara se é pra dar entrada ou saida..
    // 1 - Entrada
    //0 - Saída.
    if pOperacao = 1 then
      estoque := estoque + pQt
    else
      estoque := estoque - pQt;

    sQr.Params[0].AsFloat   := estoque;
    sQr.Params[1].AsInteger := pProduto;
    sQr.ExecSQL;

    //aqui grava o historico da movimentação.
    Self.setHistorico(pProduto, pQt, pUsuario);

    Result := True;
  except
    Result := False;
  end;

  sQr.Free;
end;

function TProduto.getEstoque(pProduto: Integer): Double;
var
  sQr: TSQLDataSet;
begin
  sQr := TSQLDataSet.Create(nil);
  sQr.SQLConnection := dm.Conexao;
  sQr.CommandText := 'select estoque from produtos where codigo =:codigo';
  sQr.Params[0].AsInteger := pProduto;
  sQr.Open;
  Result := sQr.FieldByName('estoque').AsFloat;
  sQr.Free;
end;

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
