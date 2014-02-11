unit uFPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPadraoVazio, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr, Vcl.ImgList;

type
  TFPadrao = class(TFPadraoVazio)
    PageControl1: TPageControl;
    tabCadastro: TTabSheet;
    tabConsulta: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    spbEditar: TSpeedButton;
    spbExcluir: TSpeedButton;
    spbImprimir: TSpeedButton;
    edPesquisar: TEdit;
    spbPesquisar: TSpeedButton;
    GroupBox4: TGroupBox;
    spbSalvar: TSpeedButton;
    spbNovo: TSpeedButton;
    sqsCadastro: TSQLDataSet;
    dspCadastro: TDataSetProvider;
    cdsCadastro: TClientDataSet;
    dsCadastro: TDataSource;
    sqsConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    listaDeImagens: TImageList;
    SpeedButton1: TSpeedButton;
    procedure spbEditarClick(Sender: TObject);
    procedure spbExcluirClick(Sender: TObject);
    procedure spbImprimirClick(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
    procedure spbSalvarClick(Sender: TObject);
    procedure cdsCadastroAfterPost(DataSet: TDataSet);
    procedure cdsCadastroAfterDelete(DataSet: TDataSet);
    procedure spbPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsCadastroNewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadrao: TFPadrao;

implementation

{$R *.dfm}

uses uDM;

procedure TFPadrao.cdsCadastroAfterDelete(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.ApplyUpdates(0);
end;

procedure TFPadrao.cdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.ApplyUpdates(-1);
end;

procedure TFPadrao.cdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
//  cdsCadastro.FieldByName('CODIGO').AsInteger := 0;
end;

procedure TFPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCadastro.Close;
  cdsCadastro.Params[0].AsInteger := 0;
  cdsCadastro.Open;

  tabConsulta.Show;

  spbPesquisar.Click;
end;

procedure TFPadrao.spbEditarClick(Sender: TObject);
begin
  inherited;
  if cdsConsulta.RecordCount = 0 then
    Exit;

  cdsCadastro.Close;
  cdsCadastro.Params[0].AsInteger := cdsConsulta.FieldByName('CODIGO').AsInteger;
  cdsCadastro.Open;

  cdsCadastro.Edit;

  tabCadastro.Show;

end;

procedure TFPadrao.spbExcluirClick(Sender: TObject);
begin
  inherited;
  if cdsConsulta.RecordCount = 0 then
    Exit;

  if Application.MessageBox('Deseja excluir este registro?','Confirmação', MB_YESNO + MB_YESNO)=idYes then
    begin
      cdsCadastro.Close;
      cdsCadastro.Params[0].AsInteger := cdsConsulta.FieldByName('CODIGO').AsInteger;
      cdsCadastro.Open;

      cdsCadastro.Delete;
    end;

  cdsConsulta.Refresh;

end;

procedure TFPadrao.spbImprimirClick(Sender: TObject);
begin
  inherited;
  if cdsConsulta.RecordCount = 0 then
    Exit;

end;

procedure TFPadrao.spbNovoClick(Sender: TObject);
begin
  inherited;
  cdsCadastro.Append;
end;

procedure TFPadrao.spbPesquisarClick(Sender: TObject);
begin
  inherited;
  if Trim(edPesquisar.Text) = ''  then
    Exit;

end;

procedure TFPadrao.spbSalvarClick(Sender: TObject);
begin
  inherited;
  try
    cdsCadastro.Post;
  except
    on e: Exception do
      begin
        ShowMessage(e.Message);
      end;
  end;
end;

procedure TFPadrao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
