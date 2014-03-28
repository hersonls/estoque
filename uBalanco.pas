unit uBalanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoVazio, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, uTProdutos;

type
  TFBalanco = class(TFPadraoVazio)
    GroupBox1: TGroupBox;
    edPesquisar: TEdit;
    spbPesquisar: TSpeedButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    sqsPesquisa: TSQLDataSet;
    dspPesquixa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
    dsPesquisa: TDataSource;
    cdsPesquisaCODIGO: TIntegerField;
    cdsPesquisaNOME: TStringField;
    cdsPesquisaCATEGORIA: TIntegerField;
    cdsPesquisaNOMECATEGORIA: TStringField;
    cdsPesquisaCODBARRAS: TStringField;
    cdsPesquisaMARCA: TSmallintField;
    cdsPesquisaNOMEMARCA: TStringField;
    cdsPesquisaPCUSTO: TFMTBCDField;
    cdsPesquisaPVENDA: TFMTBCDField;
    cdsPesquisaRUA: TStringField;
    cdsPesquisaPRATELEIRA: TStringField;
    cdsPesquisaSECAO: TStringField;
    cdsPesquisaESTOQUE: TFMTBCDField;
    cdsPesquisaESTOQUE_MIN: TFMTBCDField;
    lblQuantidade: TLabel;
    edQuantidade: TEdit;
    rdpOperacao: TRadioGroup;
    spbConfirmar: TSpeedButton;
    procedure spbPesquisarClick(Sender: TObject);
    procedure edPesquisarChange(Sender: TObject);
    procedure spbConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBalanco: TFBalanco;

implementation

{$R *.dfm}

uses uDM;

procedure TFBalanco.edPesquisarChange(Sender: TObject);
begin
  inherited;
  spbPesquisar.Click;
end;

procedure TFBalanco.spbConfirmarClick(Sender: TObject);
var
  produto : TProduto;
begin
  inherited;
  if not cdsPesquisa.Active then
    begin
      ShowMessage('Não foi iniciada uma pesquisa.');
      Exit;
    end;

  if cdsPesquisa.RecordCount = 0 then
    begin
      ShowMessage('Nenhum produto encontrado.');
      exit;
    end;

  if edQuantidade.Text = '' then
    begin
      ShowMessage('Por favor informe a quantidade.');
      edQuantidade.SetFocus;
      Exit;
    end;

  if StrToFloatDef(edQuantidade.Text, 0) <= 0 then
    begin
      ShowMessage('Informe um valor maior que zero.');
      edQuantidade.SetFocus;
      exit;
    end;


    produto := TProduto.Create;

   //aqui aplica as alterações de estoque.
    produto.estoque(cdsPesquisaCODIGO.AsInteger,
      StrToFloat(edQuantidade.Text),0,
      rdpOperacao.ItemIndex);

    produto.Free;

end;

procedure TFBalanco.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  cdsPesquisa.Close;
  cdsPesquisa.Params[0].AsString := edPesquisar.Text + '%';
  cdsPesquisa.Open;
end;

end.
