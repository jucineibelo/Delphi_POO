unit cliente;

interface

uses
  pessoa, System.SysUtils, endereco;

type
  TCliente = class(TPessoa)
  private
    FCPF: string;
    FEndereco: TEndereco;

  public
    constructor Create; overload; //sobrecarga   TObject j� herda por padr�o
    constructor Create(Value: string); overload;  //sobrecarga com passada de parametro primitivo
    constructor Create(Value: TPessoa); overload; //sobrecarga o parametro � uma classe  nesse caso, tudo que voc� possui nela vem como inje��o
    destructor Destroy; override;

    property endereco: TEndereco read FEndereco write FEndereco; //variavel tipo TEndereco herda da classe
    property CPF: string read FCPF write FCPF;
    function Contrato: string; override;
    function RetornaDados: string; override;

  end;

implementation

{ TCliente }

function TCliente.Contrato: string;
begin
  Result := 'Contrato TCliente ';
end;

constructor TCliente.Create;
begin
  Nome := 'Tiburcio';
  FEndereco := TEndereco.Create;  //� necess�rio instanciar o objeto para conseguir utilizar sen�o vai dar erro
end;

constructor TCliente.Create(Value: string);
begin
  Nome := Value;
end;

constructor TCliente.Create(Value: TPessoa);
begin
  Nome := Value.Nome;
  DataNascimento := Value.DataNascimento;
end;

destructor TCliente.Destroy;
begin
  FEndereco.Free;
end;

function TCliente.RetornaDados: string;
begin
  inherited; // herdar
  Result := dados + ' CPF: ' + FCPF + ' sou filha da classe: ' + NomeClass;
end;

end.

// FNome : o F quer dizer que vou usar a variavel em qualquer lugar do c�digo segundo conven��o
// LNome : O L quer dizer que vou usar a variavel somente naquela classe

{ destructor Destroy; reintroduce;  reintroduce assumir responsabilidade
  reintroduzir ou seja quando implementar assumir a responsabilidade }


