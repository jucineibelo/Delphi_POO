unit listatarefas.view.main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  listatarefas.model.usuario, Vcl.ComCtrls, System.Generics.Collections,
  listatarefas.model.tarefas;

type
  TfrmListadeTarefas = class(TForm)
    Panel1: TPanel;
    pnlTitulo: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnCancelar: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    pnlPesquisar: TPanel;
    Edit1: TEdit;
    btnPesquisar: TButton;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    function ValidaUsuario(aEmail, aSenha: string): Boolean;
    procedure PreencheListView(aTarefas: TObjectList<TTarefas>);
  public
    FTarefas: TObjectList<TTarefas>;
    constructor Create(AOwner: TComponent; aTarefa: TObjectList<TTarefas>);
  end;

var
  frmListadeTarefas: TfrmListadeTarefas;

implementation

uses
  listatarefas.view.login, listatarefas.view.tarefa;

{$R *.dfm}

procedure TfrmListadeTarefas.btnNovoClick(Sender: TObject);
var
  LCadastroTarefa: TfrmCadastroTarefa;
  lTarefas: TObjectList<TTarefas>;
begin
  lTarefas := TObjectList<TTarefas>.Create;
  LCadastroTarefa := TfrmCadastroTarefa.Create(Self, lTarefas);
  try
    LCadastroTarefa.ShowModal;
    PreencheListView(lTarefas);
  finally
    FreeAndNil(LCadastroTarefa);
    lTarefas.Free;
  end;

end;

constructor TfrmListadeTarefas.Create(AOwner: TComponent;
  aTarefa: TObjectList<TTarefas>);
begin

end;

procedure TfrmListadeTarefas.FormCreate(Sender: TObject);
var
  lLogin: TFrmLogin;
begin
  lLogin := TFrmLogin.Create(nil);
  try
    lLogin.ShowModal;
    if not ValidaUsuario(lLogin.edtEmail.Text, lLogin.edtSenha.Text) then
    begin
      ShowMessage('Usu�rio ou senha inv�lido.');
      Application.Terminate;
    end;

  finally
    lLogin.Free;
  end;

end;

procedure TfrmListadeTarefas.PreencheListView(aTarefas: TObjectList<TTarefas>);
var
  lItem: TListItem;
  lTarefa: TTarefas;
begin
  if not Assigned(aTarefas) then // aTarefas est� instanciada?
    Exit;
  ListView1.Clear;
  for lTarefa in aTarefas do
  begin
    lItem := ListView1.Items.Add;
    lItem.Caption := lTarefa.Codigo.ToString;
    lItem.SubItems.Add(lTarefa.Titulo);
    lItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:mm', lTarefa.DataCriacao));
    lItem.Data := lTarefa;

  end;

end;

function TfrmListadeTarefas.ValidaUsuario(aEmail, aSenha: string): Boolean;
var
  lUsuario: TUsuario;
begin
  lUsuario := TUsuario.Create;
  try
    lUsuario.Email := 'mail@mail.com';
    lUsuario.Senha := '123';

    Result := ((lUsuario.Email = aEmail) and (lUsuario.Senha = aSenha));
  finally
    lUsuario.Free;
  end;

end;

end.

// variavel global n�o � uma boa pratica na declara��o de um objeto
// afinal fica na memoria caso n�o destrua
