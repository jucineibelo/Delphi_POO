object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  Height = 247
  Width = 395
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\User-J\Desktop\Projetos Delphi\Delphi OO\Crian' +
        'do um projeto em POO\src\services\db\dados'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 48
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from usuario')
    Left = 168
    Top = 48
    object FDQuery1id: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1nome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 80
    end
    object FDQuery1email: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object FDQuery1senha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
  end
end
