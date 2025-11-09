unit UModels;

interface

uses System.SysUtils;

type
  TConfiguracao = class
  private
    FChave: string;
    FValor: Double;
  public
    property Chave: string read FChave write FChave;
    property Valor: Double read FValor write FValor;
  end;

  TTanque = class
  private
    FTanqueId: Integer;
    FNome: string;
    FTipo: string;
    FEstoqueAtualL: Double;
    FValorLitro: Currency;
  public
    property TanqueId: Integer read FTanqueId write FTanqueId;
    property Nome: string read FNome write FNome;
    property Tipo: string read FTipo write FTipo;
    property EstoqueAtualL: Double read FEstoqueAtualL write FEstoqueAtualL;
    property ValorLitro: Currency read FValorLitro write FValorLitro;
  end;

  TBomba = class
  private
    FBombaId: Integer;
    FTanqueId: Integer;
    FCodigo: string;
    FDescricao: string;
  public
    property BombaId: Integer read FBombaId write FBombaId;
    property TanqueId: Integer read FTanqueId write FTanqueId;
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;

  TAbastecimento = class
  private
    FAbastecId: Integer;
    FBombaId: Integer;
    FDataHora: TDateTime;
    FQuantidadeLitros: Double;
    FValorLitro: Currency;
    FValorBruto: Currency;
    FValorImposto: Currency;
  public
    property AbastecId: Integer read FAbastecId write FAbastecId;
    property BombaId: Integer read FBombaId write FBombaId;
    property DataHora: TDateTime read FDataHora write FDataHora;
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;
    property ValorLitro: Currency read FValorLitro write FValorLitro;
    property ValorBruto: Currency read FValorBruto write FValorBruto;
    property ValorImposto: Currency read FValorImposto write FValorImposto;
  end;

implementation

end.
