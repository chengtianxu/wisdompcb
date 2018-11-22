{*******************************************************}
{                                                       }
{                       EhLib v3.0                      }
{              Design window for TDBGridEh              }
{                                                       }
{   Copyright (c) 1998-2003 by Dmitry V. Bolshakov      }
{                                                       }
{*******************************************************}


unit GridEhEd;

{$I EhLib.Inc}
interface

uses
  Windows, Messages, SysUtils,
{$IFDEF EH_LIB_6}Variants, DesignEditors, DesignIntf,
{$ELSE}DsgnWnds, DsgnIntf, LibIntf, {$ENDIF}
  Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, Menus, ActnList, ExtCtrls, ComCtrls,
  DBGridEh, DBGrids, DBLookupEh,
//  ColectEditorEh,
  ColnEdit,
  ToolWin;

type
  TDBGridEhColumnsEditor = class(TCollectionEditor)
//  TDBGridEhColumnsEditor = class(TCollectionEditorEh)
    N1: TMenuItem;
    AddAllFields1: TMenuItem;
    RestoreDefaults1: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    AddAllFieldsCmd: TAction;
    RestoreDefaultsCmd: TAction;
    procedure AddAllFieldsCmdExecute(Sender: TObject);
    procedure RestoreDefaultsCmdExecute(Sender: TObject);
    procedure AddAllFieldsCmdUpdate(Sender: TObject);
    procedure RestoreDefaultsCmdUpdate(Sender: TObject);
  private
    { Private declarations }
  protected
    function CanAdd(Index: Integer): Boolean; override;
  public
    { Public declarations }
  end;

{ TDBGridEhColumnsProperty }

  TDBGridEhColumnsProperty = class(TPropertyEditor {TClassProperty})
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;

{ TDBGridEhEditor }

  TDBGridEhEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

{ TDBGridEhFieldProperty }

  TDBGridEhFieldProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValueList(List: TStrings); virtual;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

{ TDBGridEhFieldProperty }

  TDBGridEhFieldAggProperty = class(TDBGridEhFieldProperty)
  public
    procedure GetValueList(List: TStrings); override;
  end;

{ TDBLookupComboboxEhEditor }

  TDBLookupComboboxEhEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

var
  DBGridEhColumnsEditor: TDBGridEhColumnsEditor;

implementation

{$R *.dfm}

type
  TPersistentCracker = class(TPersistent);

{ TDBGridEhColumnsProperty }

procedure TDBGridEhColumnsProperty.Edit;
var
  Obj: TPersistent;
begin
  Obj := GetComponent(0);
  while (Obj <> nil) and not (Obj is TComponent) do
    Obj := TPersistentCracker(Obj).GetOwner;
  ShowCollectionEditorClass(Designer, TDBGridEhColumnsEditor, TComponent(Obj),
//    TCustomDBGridEh(Obj).Columns, 'Columns', [coAdd, coDelete, coMove]);
    TCollection(GetOrdValue), 'Columns', [coAdd, coDelete, coMove]);
end;

function TDBGridEhColumnsProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly {, paSubProperties}];
end;

function TDBGridEhColumnsProperty.GetValue: string;
begin
  FmtStr(Result, '(%s)', [GetPropType^.Name]);
end;

{ TDBGridEhEditor }

procedure TDBGridEhEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:
      ShowCollectionEditorClass(Designer, TDBGridEhColumnsEditor, Component,
        TCustomDBGridEh(Component).Columns, 'Columns', [coAdd, coDelete, coMove]);
  end;
end;

function TDBGridEhEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Columns Editor ...';
  end;
end;

function TDBGridEhEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;


{ TCustomDBGridEhCracker }

type
  TCustomDBGridEhCracker = class(TCustomDBGridEh)
  public
    procedure BeginLayout;
    procedure EndLayout;
  end;

procedure TCustomDBGridEhCracker.BeginLayout;
begin
  inherited BeginLayout;
end;

procedure TCustomDBGridEhCracker.EndLayout;
begin
  inherited EndLayout;
end;

type
  TCollectionCracker = class(TCollection);
{ TDBGridEhColumnsEditor }

procedure TDBGridEhColumnsEditor.AddAllFieldsCmdExecute(Sender: TObject);
var msgValue: Word;
//    i:Integer;
//    Col:TColumnEh;
  DBGridEh: TCustomDBGridEh;
begin
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
  if not Assigned(DBGridEh) then Exit;
  if (DBGridEh.Columns.State = csDefault) then
    DBGridEh.Columns.State := csCustomized
  else
  begin
    TCustomDBGridEhCracker(DBGridEh).BeginLayout;
    try
      if (DBGridEh.Columns.Count > 0) then
      begin
        msgValue := MessageDlg('Delete existing columns?',
          mtConfirmation, [mbYes, mbNo, mbCancel], 0);
        case msgValue of
          mrYes: DBGridEh.Columns.Clear;
          mrCancel: Exit;
        end;
      end;
     {for i := 0 to DBGridEh.DataSource.DataSet.FieldCount - 1 do
     begin
       Col := DBGridEh.Columns.Add;
       Col.FieldName := DBGridEh.DataSource.DataSet.Fields[i].FieldName;
     end;}
      DBGridEh.Columns.AddAllColumns(False);
    finally
      TCustomDBGridEhCracker(DBGridEh).EndLayout;
      UpdateListbox;
    end;
  end;
  Designer.Modified;
end;

procedure TDBGridEhColumnsEditor.RestoreDefaultsCmdExecute(Sender: TObject);
var i: Integer;
  DBGridEh: TCustomDBGridEh;
begin
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
  if not Assigned(DBGridEh) then Exit;
  if (ListView1.SelCount > 0) then
  begin
    for i := 0 to ListView1.SelCount - 1 do
      DBGridEh.Columns[i].RestoreDefaults;
    Designer.Modified;
    UpdateListbox;
  end;
end;

procedure TDBGridEhColumnsEditor.AddAllFieldsCmdUpdate(Sender: TObject);
var DBGridEh: TCustomDBGridEh;
begin
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
  AddAllFieldsCmd.Enabled := Assigned(DBGridEh) and
    Assigned(DBGridEh.DataSource) and Assigned(DBGridEh.Datasource.Dataset) and
    (DBGridEh.Datasource.Dataset.FieldCount > 0);
end;

procedure TDBGridEhColumnsEditor.RestoreDefaultsCmdUpdate(Sender: TObject);
begin
  RestoreDefaultsCmd.Enabled := ListView1.Items.Count > 0;
end;

function TDBGridEhColumnsEditor.CanAdd(Index: Integer): Boolean;
var DBGridEh: TCustomDBGridEh;
begin
  Result := False;
  DBGridEh := TCustomDBGridEh(TCollectionCracker(Collection).GetOwner);
  if Assigned(DBGridEh) then
    Result := (DBGridEh.Columns.State = csCustomized);
end;

{ TDBGridEhFieldProperty }

function TDBGridEhFieldProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paMultiSelect];
end;

procedure TDBGridEhFieldProperty.GetValueList(List: TStrings);
var
  Ehg: TCustomDBGridEh;
begin
  if (GetComponent(0) = nil) then Exit;
  if (GetComponent(0) is TColumnEh) then
    Ehg := (GetComponent(0) as TColumnEh).Grid
  else if (GetComponent(0) is TColumnFooterEh) then
    Ehg := (GetComponent(0) as TColumnFooterEh).Column.Grid
  else Exit;

  if (Ehg <> nil) and (TCustomDBGridEh(Ehg).DataSource <> nil) and (TCustomDBGridEh(Ehg).DataSource.DataSet <> nil) then
    TCustomDBGridEh(Ehg).DataSource.DataSet.GetFieldNames(List);
end;

procedure TDBGridEhFieldProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  Values: TStringList;
begin
  Values := TStringList.Create;
  try
    GetValueList(Values);
    for i := 0 to Values.Count - 1 do Proc(Values[i]);
  finally
    Values.Free;
  end;
end;

{ TDBGridEhFieldAggProperty }

procedure TDBGridEhFieldAggProperty.GetValueList(List: TStrings);
var
  Ehg: TCustomDBGridEh;
  AggList: TStringList;
begin
  if (GetComponent(0) = nil) then Exit;
  if (GetComponent(0) is TColumnEh) then
    Ehg := (GetComponent(0) as TColumnEh).Grid
  else if (GetComponent(0) is TColumnFooterEh) then
    Ehg := (GetComponent(0) as TColumnFooterEh).Column.Grid
  else Exit;

  if (Ehg <> nil) and (TCustomDBGridEh(Ehg).DataSource <> nil) and (TCustomDBGridEh(Ehg).DataSource.DataSet <> nil) then
  begin
    TCustomDBGridEh(Ehg).DataSource.DataSet.GetFieldNames(List);
    if TCustomDBGridEh(Ehg).DataSource.DataSet.AggFields.Count > 0 then
    begin
      AggList := TStringList.Create;
      try
        TCustomDBGridEh(Ehg).DataSource.DataSet.AggFields.GetFieldNames(AggList);
        List.AddStrings(AggList);
      finally
        AggList.Free;
      end;
    end;
  end;
end;

{ TDBLookupComboboxEhEditor }

procedure TDBLookupComboboxEhEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0:
      ShowCollectionEditorClass(Designer, TDBGridEhColumnsEditor, Component,
        TDBLookupComboboxEh(Component).DropDownBox.Columns, 'Columns', [coAdd, coDelete, coMove]);
  end;
end;

function TDBLookupComboboxEhEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'DropDownBox.Columns Editor ...';
  end;
end;

function TDBLookupComboboxEhEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
