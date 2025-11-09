unit UFrmRelatorioPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  RLHTMLFilter, RLPDFFilter, RLSaveDialog, RLFilters, RLRichFilter,
  RLDraftFilter, jpeg, RLReport, RLXLSFilter;

type
  TFrmRelatorioPreview = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel23: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLLabel12: TRLLabel;
    RLBand5: TRLBand;
    RLLabel11: TRLLabel;
    RLBand6: TRLBand;
    RLDBText12: TRLDBText;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel13: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel24: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel32: TRLLabel;
    RLLabel2: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel15: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel26: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLImage1: TRLImage;
    RLLabel3: TRLLabel;
    RLLabel6: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLLabel19BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLLabel21BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel13BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel15BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel12BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel11BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText3BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText15BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText6BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel25BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel22BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel26BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLGroup1AfterPrint(Sender: TObject);
  private
    { Private declarations }
    vTotQtdLitrosDia: Double;
    vTotBrutoDia: Currency;
    vTotImpostoDia: Currency;
    vTotLiquidoDia: Currency;
    vTotQtdLitrosGeral: Double;
    vTotBrutoGeral: Currency;
    vTotImpostoGeral: Currency;
    vTotLiquidoGeral: Currency;


  public
    { Public declarations }
  end;

var
  FrmRelatorioPreview: TFrmRelatorioPreview;


implementation

uses UFrmRelatorio;

{$R *.dfm}


procedure TFrmRelatorioPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmRelatorioPreview.FormShow(Sender: TObject);
begin
  vTotQtdLitrosDia:= 0;
  vTotBrutoDia:= 0;
  vTotImpostoDia:= 0;
  vTotLiquidoDia:= 0;
  vTotQtdLitrosGeral:= 0;
  vTotBrutoGeral:= 0;
  vTotImpostoGeral:= 0;
  vTotLiquidoGeral:= 0;
end;

procedure TFrmRelatorioPreview.RLDBText15BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  vTotImpostoDia:= vTotImpostoDia +FrmRelatorio.FDQueryRel.FieldByname('TOTAL_IMPOSTO').asCurrency;
end;

procedure TFrmRelatorioPreview.RLDBText3BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  vTotBrutoDia:= vTotBrutoDia +FrmRelatorio.FDQueryRel.FieldByname('TOTAL_BRUTO').asCurrency;
end;

procedure TFrmRelatorioPreview.RLDBText5BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  vTotQtdLitrosDia:= vTotQtdLitrosDia +FrmRelatorio.FDQueryRel.FieldByname('TOTAL_LITROS').asfloat;
end;

procedure TFrmRelatorioPreview.RLDBText6BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  vTotLiquidoDia:= vTotLiquidoDia +FrmRelatorio.FDQueryRel.FieldByname('TOTAL_LIQUIDO').asCurrency;
end;

procedure TFrmRelatorioPreview.RLGroup1AfterPrint(Sender: TObject);
begin
  vTotQtdLitrosGeral:= vTotQtdLitrosGeral + vTotQtdLitrosDia;
  vTotBrutoGeral:= vTotBrutoGeral + vTotBrutoDia;
  vTotImpostoGeral:= vTotImpostoGeral + vTotImpostoDia;
  vTotLiquidoGeral:= vTotLiquidoGeral + vTotLiquidoDia;
end;

procedure TFrmRelatorioPreview.RLGroup1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vTotQtdLitrosDia:= 0;
  vTotBrutoDia:= 0;
  vTotImpostoDia:= 0;
  vTotLiquidoDia:= 0;
end;

procedure TFrmRelatorioPreview.RLLabel11BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.00',vTotLiquidoGeral);
end;

procedure TFrmRelatorioPreview.RLLabel12BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.00',vTotLiquidoDia);
end;

procedure TFrmRelatorioPreview.RLLabel13BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.00',vTotBrutoDia);
end;

procedure TFrmRelatorioPreview.RLLabel15BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.00',vTotImpostoDia);
end;

procedure TFrmRelatorioPreview.RLLabel19BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText := 'Período de Lançamento: '+DateToStr(FrmRelatorio.edtData1.Date)+' à '+DateToStr(FrmRelatorio.edtData2.Date);
  if FrmRelatorio.combobomba.text <> '' then
    aText := aText +' - Tanque: '+FrmRelatorio.comboTanque.text;
  if FrmRelatorio.combobomba.text <> '' then
    aText := aText +' - Bomba: '+FrmRelatorio.combobomba.text;
end;

procedure TFrmRelatorioPreview.RLLabel21BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.000',vTotQtdLitrosDia);
end;

procedure TFrmRelatorioPreview.RLLabel22BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.00',vTotBrutoGeral);
end;

procedure TFrmRelatorioPreview.RLLabel25BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.00',vTotImpostoGeral);
end;

procedure TFrmRelatorioPreview.RLLabel26BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  aText:=FormatFloat('###,###,##0.000',vTotQtdLitrosGeral);
end;

end.


