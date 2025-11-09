program PostoABC;
uses
  Vcl.Forms,
  UFrmRelatorio in 'src\ui\UFrmRelatorio.pas' {FrmRelatorio},
  UFrmPrincipal in 'src\ui\UFrmPrincipal.pas' {FrmPrincipal},
  ConexaoDM in 'src\infra\ConexaoDM.pas' {dmConexao: TDataModule},
  UModels in 'src\domain\UModels.pas',
  URepositorio in 'src\domain\URepositorio.pas',
  UServicoAbastecimento in 'src\domain\UServicoAbastecimento.pas',
  UValidacoes in 'src\domain\UValidacoes.pas',
  UFrmLancamento in 'src\ui\UFrmLancamento.pas' {FrmLancamento},
  UFrmRelatorioPreview in 'src\ui\UFrmRelatorioPreview.pas' {FrmRelatorioPreview};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmLancamento, FrmLancamento);
  Application.CreateForm(TFrmRelatorioPreview, FrmRelatorioPreview);
  Application.Run;
end.
