unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird;

type
  Tdm = class(TDataModule)
    Conexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
