unit qkFKDBEdit;

interface
uses
  Data.DB, Vcl.DBCtrls, System.Classes;

type
  TQKFKEdit = class(TDBEdit)
  private
    FFKFieldName: string;
    function GetFKField: TField;
  published
    property FKField: TField read GetFKField;
    property FKFieldName: string read FFKFieldName write FFKFieldName;
  end;

procedure register;

implementation

procedure register;
begin
  RegisterComponents('Samples', [TQKFKEdit]);
end;

{ TQKFKEdit }

function TQKFKEdit.GetFKField: TField;
begin
  Result := nil;
  if (FFKFieldName <> '') and
     (DataSource <> nil) and
     (DataSource.DataSet <> nil)
  then
  begin
    Result := DataSource.DataSet.FindField(FFKFieldName);
  end;

end;

end.
