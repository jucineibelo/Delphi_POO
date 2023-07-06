unit listatarefas.view.tarefa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  listatarefas.model.tarefas, System.Generics.Collections;

type
  TfrmCadastroTarefa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MemoDescricao: TMemo;
    Panel3: TPanel;
    btnSalvar: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    edtTitulo: TEdit;
    btnSair: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    FTarefas: TObjectList<TTarefas>;
    constructor Create(AOwner: TComponent; aTarefas: TObjectList<TTarefas>);
  end;

var
  frmCadastroTarefa: TfrmCadastroTarefa;

implementation

{$R *.dfm}
{ TfrmCadastroTarefa }

procedure TfrmCadastroTarefa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroTarefa.btnSalvarClick(Sender: TObject);
var
  LTarefa: TTarefas;
begin
  LTarefa := TTarefas.Create;
  LTarefa.Codigo := FTarefas.Count + 1;
  LTarefa.IdUsuario := 1;
  LTarefa.Titulo := edtTitulo.Text;
  LTarefa.Descricao := MemoDescricao.Text;
  FTarefas.Add(LTarefa);
  edtTitulo.Clear;
  MemoDescricao.Clear;
end;

constructor TfrmCadastroTarefa.Create(AOwner: TComponent;
  aTarefas: TObjectList<TTarefas>);
begin
  inherited Create(AOwner);
  FTarefas := aTarefas;
end;

end.
