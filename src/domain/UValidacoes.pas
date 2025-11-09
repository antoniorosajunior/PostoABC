unit UValidacoes;

interface

uses
  System.SysUtils, System.Math, UModels;

// Tipo para função que retorna estoque atual do tanque (por BOMBA_ID)
type
  TGetEstoqueFunc = reference to function(const BOMBA_ID: Integer): Double;

  EValidacao = class(Exception);

  TValidadorAbastecimento = class
  public
    class procedure ValidarEAjustar(var A: TAbastecimento;
      const GetEstoque: TGetEstoqueFunc = nil);
  end;

implementation

{ TValidadorAbastecimento }

class procedure TValidadorAbastecimento.ValidarEAjustar(var A: TAbastecimento;
  const GetEstoque: TGetEstoqueFunc);
var EstoqueDisponivel : Double;
begin
  if A = nil then
    raise EValidacao.Create('Abastecimento não informado.');

  if A.BombaId <= 0 then
    raise EValidacao.Create('Bomba inválida.');

  if (A.QuantidadeLitros <= 0) and (A.ValorBruto <= 0) then
    raise EValidacao.Create('Informe Litros e/ou Valor total.');

  if A.QuantidadeLitros < 0 then
    raise EValidacao.Create('Litros não pode ser negativo.');

  if A.ValorBruto < 0 then
    raise EValidacao.Create('Valor bruto não pode ser negativo.');


  if Assigned(GetEstoque) then
  begin
    EstoqueDisponivel := GetEstoque(A.BombaId);

    if EstoqueDisponivel <= 0 then
      raise EValidacao.Create('Estoque do tanque indisponível.');

    if A.QuantidadeLitros > EstoqueDisponivel then
      raise EValidacao.CreateFmt('Estoque insuficiente. Disponível: %0.3f L — Tentativa: %0.3f L',
        [EstoqueDisponivel, A.QuantidadeLitros]);
  end;
end;

end.

