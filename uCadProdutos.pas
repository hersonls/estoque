unit uCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFPadrao, Data.FMTBcd, Vcl.ImgList,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, uTUtils;

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
    dsCategoria: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    sqsMarca: TSQLDataSet;
    dspMarca: TDataSetProvider;
    cdsMarca: TClientDataSet;
    dsMarca: TDataSource;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    procedure spbPesquisarClick(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
    procedure spbEditarClick(Sender: TObject);
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
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

procedure TFCadProdutos.cdsCadastroNewRecord(DataSet: TDataSet);
var
  util : TUtils;
begin
 // cdsCadastroCODIGO.AsInteger := getId('CATEGORIA_CODIGO_GEN');
  util := TUtils.Create;
  cdsCadastroCODIGO.AsInteger := util.getId('GPRODUTOS');
  util.Free;
  inherited;

end;

procedure TFCadProdutos.spbEditarClick(Sender: TObject);
begin
  cdsMarca.Close;
  cdsMarca.Open;

  cdsCategoria.Close;
  cdsCategoria.Open;

  inherited;
end;

procedure TFCadProdutos.spbNovoClick(Sender: TObject);
begin
  cdsCategoria.Close;
  cdsCategoria.Open;

  cdsMarca.Close;
  cdsMarca.Open;

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
