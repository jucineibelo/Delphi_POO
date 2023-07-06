unit cliente;

interface

uses
  System.SysUtils,
  pessoa;

type
  TCliente = class(TPessoa) // A classe TCliente vai herdar de TPessoa
  private
    FvalorCredito: Currency;
  public
    property valorCredito: Currency read FvalorCredito; // somente leitura: read/get
    function receber(Value: Integer) : string; overload;
    function receber(Value: Currency) : string; overload; // Foi uitlizado overload para conseguir declarar a mesma fun��o
                                                          // s� que com parametros diferentess

  end;

implementation

{ TCliente }

function TCliente.receber(Value: Integer): string;
begin
  Result := Value.ToString;
end;

function TCliente.receber(Value: Currency): string;
begin
  FvalorCredito := Value + (Value * 0.10);
  Result := CurrToStr(Value);
end;

end.

//Overload = polimorfismo com sobrecarga = mesma assinatura com parametros diferentes
