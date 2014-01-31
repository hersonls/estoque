program Laboratorio;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FPrincipal},
  uDM in 'uDM.pas' {dm: TDataModule},
  uPadraoVazio in 'uPadraoVazio.pas' {FPadraoVazio},
  uRelatorioVazio in 'uRelatorioVazio.pas' {FRelatorioVazio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFPadraoVazio, FPadraoVazio);
  Application.CreateForm(TFRelatorioVazio, FRelatorioVazio);
  Application.Run;
end.
