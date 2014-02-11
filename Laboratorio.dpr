program Laboratorio;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FPrincipal},
  uDM in 'uDM.pas' {dm: TDataModule},
  uPadraoVazio in 'uPadraoVazio.pas' {FPadraoVazio},
  uRelatorioVazio in 'uRelatorioVazio.pas' {FRelatorioVazio},
  uRelatorioPadraoData in 'uRelatorioPadraoData.pas' {FRelatorioPadraoData},
  uRelMovimentos in 'uRelMovimentos.pas' {FRelTeste},
  uFPadrao in 'uFPadrao.pas' {FPadrao},
  uCadCategoria in 'uCadCategoria.pas' {FCadCategoria},
  uFuncoes in 'uFuncoes.pas',
  uTUtils in 'uTUtils.pas',
  uCadLote in 'uCadLote.pas' {FCadLote};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
