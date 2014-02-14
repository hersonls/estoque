unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFPadrao, Data.FMTBcd, Vcl.ImgList,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls;

type
  TFCadProdutos = class(TFPadrao)
    cdsConsultaCODIGO: TIntegerField;
    cdsConsultaNOME: TStringField;
    cdsConsultaCATEGORIA: TIntegerField;
    cdsConsultaNOMECATEGORIA: TStringField;
    cdsConsultaCODBARRAS: TStringField;
    cdsConsultaMARCA: TSmallintField;
    cdsConsultaNOMEMARCA: TStringField;
    cdsConsultaPCUSTO: TFMTBCDField;
    cdsConsultaPVENDA: TFMTBCDField;
    cdsConsultaRUA: TStringField;
    cdsConsultaPRATELEIRA: TStringField;
    cdsConsultaSECAO: TStringField;
    cdsConsultaESTOQUE: TFMTBCDField;
    cdsConsultaESTOQUE_MIN: TFMTBCDField;
    cdsCadastroCODIGO: TIntegerField;
    cdsCadastroNOME: TStringField;
    cdsCadastroCATEGORIA: TIntegerField;
    cdsCadastroCODBARRAS: TStringField;
    cdsCadastroMARCA: TSmallintField;
    cdsCadastroPCUSTO: TFMTBCDField;
    cdsCadastroPVENDA: TFMTBCDField;
    cdsCadastroRUA: TStringField;
    cdsCadastroPRATELEIRA: TStringField;
    cdsCadastroSECAO: TStringField;
    cdsCadastroESTOQUE: TFMTBCDField;
    cdsCadastroESTOQUE_MIN: TFMTBCDField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    sqsCategoria: TSQLDataSet;
    dspCategoria: TDataSetProvider;
    cdsCategoria: TClientDataSet;
    DBLookupComboBox1: TDBLookupComboBox;
    dsCategoria: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    procedure spbPesquisarClick(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadProdutos: TFCadProdutos;

implementation

{$R *.dfm}

uses uDM;

procedure TFCadProdutos.spbNovoClick(Sender: TObject);
begin
  cdsCategoria.Close;
  cdsCategoria.Open;
  inherited;
end;

procedure TFCadProdutos.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  cdsConsulta.Close;
  cdsConsulta.Params[0].AsString := edPesquisar.Text + '%';
  cdsConsulta.Params[1].AsString := edPesquisar.Text + '%';
  cdsConsulta.Params[2].AsString := edPesquisar.Text + '%';
  cdsConsulta.Params[3].AsString := edPesquisar.Text + '%';
  cdsConsulta.Open;
end;

end.
