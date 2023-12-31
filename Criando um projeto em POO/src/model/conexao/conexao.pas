unit conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Data.SqlExpr, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TDmConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1id: TIntegerField;
    FDQuery1nome: TWideStringField;
    FDQuery1email: TWideStringField;
    FDQuery1senha: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function DataSet: TDataSet;
    procedure SQL(Value: string);
    procedure Params(aParam: string; aValue: Variant); overload;
    function Params(aParam: string): Variant; overload;
    procedure ExecSQL;
    procedure Open;
    procedure StartTransaction;
    procedure Commit;
    procedure RollBack;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDmConexao }

procedure TDmConexao.Commit;
begin
  FDConnection1.Commit;
end;

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Connected;
end;

function TDmConexao.DataSet: TDataSet;
begin
  Result := FDQuery1;
end;

procedure TDmConexao.Params(aParam: string; aValue: Variant);
begin
  FDQuery1.ParamByName(aParam).Value := aValue;
end;

procedure TDmConexao.ExecSQL;
begin
  FDQuery1.ExecSQL;
end;

procedure TDmConexao.Open;
begin
  FDQuery1.Open;
end;

function TDmConexao.Params(aParam: string): Variant;
begin
  Result := FDQuery1.ParamByName(aParam).Value;
end;

procedure TDmConexao.RollBack;
begin
  FDConnection1.RollBack;
end;

procedure TDmConexao.SQL(Value: string);
begin
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add(Value);

end;

procedure TDmConexao.StartTransaction;
begin
  FDConnection1.StartTransaction;
end;

end.

// vaiavel global n�o � uma boa pratica de programa��o
