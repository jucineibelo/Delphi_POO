object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 268
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 268
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 303
    ExplicitHeight = 264
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 297
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 303
    end
    object Panel4: TPanel
      Left = 0
      Top = 61
      Width = 297
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 303
      object edtEmail: TEdit
        Left = 48
        Top = 4
        Width = 209
        Height = 21
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 41
      Width = 297
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitWidth = 303
      object Label1: TLabel
        Left = 128
        Top = 1
        Width = 38
        Height = 18
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 100
      Width = 297
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitWidth = 303
      object lblSenha: TLabel
        Left = 128
        Top = 0
        Width = 40
        Height = 18
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 120
      Width = 297
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitWidth = 303
      object edtSenha: TEdit
        Left = 48
        Top = 6
        Width = 209
        Height = 21
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 159
      Width = 297
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      ExplicitWidth = 303
      object btnEntrar: TButton
        Left = 48
        Top = 34
        Width = 89
        Height = 45
        Caption = 'Entrar'
        TabOrder = 0
        OnClick = btnEntrarClick
      end
      object btnCadastrar: TButton
        Left = 168
        Top = 34
        Width = 89
        Height = 45
        Caption = 'Cadastrar'
        TabOrder = 1
        OnClick = btnCadastrarClick
      end
    end
  end
end
