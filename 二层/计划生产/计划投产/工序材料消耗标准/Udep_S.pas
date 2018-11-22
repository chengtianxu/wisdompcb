unit Udep_S;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons, ComCtrls;

type
  Tdep_form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grd1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BitBtn1Click(Sender: TObject);
  private
    FGrd: TListView;
    PreColumn: TColumnEh;
    field_name:string;
    Ftp:integer;
    { Private declarations }
  public
    class function InitEdt(Grd:TListView;tp:integer): boolean;
    { Public declarations }
  end;

var
  dep_form: Tdep_form;

implementation

uses DataModuleUnit;

{$R *.dfm}

class function Tdep_form.InitEdt(Grd:TListView;tp:integer): boolean;
var i:integer;
    s:string;
begin
  with Tdep_form.Create(nil) do
  begin
    DM.ADO034.Filter:='';
    DM.ADO034.Close;
    DM.ADO034.Open;
    if DM.ADO034.IsEmpty then
    begin
      showmessage('当前没有可用的工序...');
      result:=false;
      free;
    end else begin
      field_name:='DEPT_CODE';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      Ftp:=tp;
      showmodal;
      DM.ADO034.Close;
    end;
  end;
end;

procedure Tdep_form.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure Tdep_form.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure Tdep_form.BitBtn1Click(Sender: TObject);
var
  bAdd: Boolean;
  i: Integer;
begin
  try
    bAdd := True;
    for I := 0 to FGrd.Items.Count - 1 do
    begin
      if FGrd.Items[I].Data = Pointer(DM.ADO034.Fieldbyname('rkey').asinteger) then
      begin
        ShowMessage('已有工序请勿重复添加！');
        bAdd := False;
        Exit;
      end;
    end;    
    //新增
    if Ftp = 0 then
    begin
      if bAdd then
      begin
        with FGrd.Items.Add do
        begin
          Caption := DM.ADO034.Fieldbyname('DEPT_CODE').AsString;
          SubItems.Add(DM.ADO034.Fieldbyname('DEPT_NAME').AsString);
          Data := Pointer(DM.ADO034.Fieldbyname('rkey').asinteger);
        end;
        DM.ADO034.Delete;
      end;
    end else
    //编辑
    begin
      if FGrd.Selected <> nil then
      begin
        with FGrd.Selected do
        begin
          Caption := DM.ADO034.Fieldbyname('DEPT_CODE').AsString;
          SubItems.Add(DM.ADO034.Fieldbyname('DEPT_NAME').AsString);
          Data := Pointer(DM.ADO034.Fieldbyname('rkey').asinteger);
        end;
      end;
    end;

  finally
    if DM.ADO034.IsEmpty then self.close;
  end;

end;

procedure Tdep_form.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO034.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO034.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
      label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

end.
