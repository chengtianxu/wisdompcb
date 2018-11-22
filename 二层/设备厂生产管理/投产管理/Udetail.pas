unit Udetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ADODB, StdCtrls, Grids, DBGridEh, Buttons, ExtCtrls;

type
  TDetail_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox0: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  PreColumn: TColumnEh;
      field_name:string;
      sqltxt: tstringlist;
      FsCheck:string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detail_Form: TDetail_Form;

implementation

uses DAMO,common;

{$R *.dfm}

procedure TDetail_Form.BitBtn1Click(Sender: TObject);
begin
close
end;

procedure TDetail_Form.CheckBox0Click(Sender: TObject);
var i:integer;
begin
 FsCheck:=' and data0468.status in (-1,';
 sqltxt := tstringlist.Create;
 sqltxt.Text := dm.ADS468.CommandText;
 sqltxt.Delete(20);
 for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  //showmessage(FsCheck);
  sqltxt.Insert(20, FsCheck);
  sqltxt.Insert(45, FsCheck);
  sqltxt.Delete(46);
  //showmessage(sqltxt.Text);
  dm.ADS468.Close;
  dm.ADS468.CommandText:=sqltxt.Text;
  dm.ADS468.open;
  sqltxt.Free
end;

procedure TDetail_Form.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if dm.ADS468.IsEmpty then exit;
  i := dm.ADS468rkey.AsInteger ;
  dm.ADS468.Close;
  dm.ADS468.Open;
  dm.ADS468.Locate('rkey',i,[]);
end;

procedure TDetail_Form.BitBtn4Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'¡Ï¡œ√˜œ∏') ;

end;

procedure TDetail_Form.FormCreate(Sender: TObject);
begin
  dm.ADS468.Close;
  dm.ADS468.Open;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
 // sSql:= dm.ADS468.CommandText;
  //checkbox0Click(nil);
end;

procedure TDetail_Form.Edit1Change(Sender: TObject);
begin
 if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TDetail_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
 if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS468.IndexFieldNames:=Column.FieldName;
end
else
begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS468.IndexFieldNames:=Column.FieldName+' DESC';
end;

if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
 begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
      edit1.SetFocus;
end;



procedure TDetail_Form.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 case dm.ADS468status.value of
 0: DBGridEh1.Canvas.Font.Color := clwindowText;
 1: DBGridEh1.Canvas.Font.Color := clolive;
 2: DBGridEh1.Canvas.Font.Color := clPurple;
 3: DBGridEh1.Canvas.Font.Color := clred;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TDetail_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.ADS468.Close;
end;

procedure TDetail_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS468.CommandText);
end;

end.
