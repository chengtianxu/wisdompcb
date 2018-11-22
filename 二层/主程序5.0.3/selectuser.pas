unit selectuser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, DBGrids, Grids;

type
  TForm_selectuser = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADS73: TADODataSet;
    ADS73USER_LOGIN_NAME: TStringField;
    ADS73USER_FULL_NAME: TStringField;
    ADS73COMPUTER: TStringField;
    ADS73RKEY: TIntegerField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   function find_userid(userid:string):boolean;         
  public
    { Public declarations }
  end;

var
  Form_selectuser: TForm_selectuser;

implementation

uses damo;

{$R *.dfm}

procedure TForm_selectuser.FormActivate(Sender: TObject);
begin
 self.ADS73.Open;
 stringgrid1.Cells[0,0]:='用户代码';
 stringgrid1.Cells[1,0]:='用户名称';
 stringgrid1.ColWidths[2]:=0;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_selectuser.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ADs73.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs73.filter := '';
end;

procedure TForm_selectuser.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label2.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  ADs73.IndexFieldNames:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm_selectuser.BitBtn4Click(Sender: TObject);
var
 I,j:integer;
begin
 for i:=stringgrid1.Selection.Top to stringgrid1.Selection.Bottom do
  begin
   for j:=stringgrid1.Selection.Top to stringgrid1.RowCount-2 do
    stringgrid1.Rows[j].Text:=stringgrid1.Rows[j+1].Text;
   if stringgrid1.Selection.Top<=stringgrid1.RowCount-2 then
    stringgrid1.RowCount:=stringgrid1.RowCount-1;
  end;
end;

procedure TForm_selectuser.BitBtn6Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Clear;
 stringgrid1.RowCount:=2; 
end;

procedure TForm_selectuser.BitBtn5Click(Sender: TObject);
var
 i,rkey:integer;
begin
 BitBtn6Click(sender);
 rkey:=self.ADS73RKEY.Value;
 stringgrid1.RowCount:=self.ADS73.RecordCount+2;
 self.ADS73.DisableControls;
 self.ADS73.First;
 for i:=1 to self.ADS73.RecordCount do
  begin
   stringgrid1.Cells[0,i]:=self.ADS73USER_LOGIN_NAME.Value;
   stringgrid1.Cells[1,i]:=self.ADS73USER_FULL_NAME.Value;
   stringgrid1.Cells[2,i]:=self.ADS73RKEY.AsString;
   self.ADS73.Next;
  end;
 self.ADS73.EnableControls;
 if rkey>0 then self.ADS73.Locate('rkey',rkey,[]);
end;

function TForm_selectuser.find_userid(userid: string): boolean;
var
 i:integer;
begin
result:=false;
 for i:=1 to stringgrid1.RowCount-2 do
  begin
   if stringgrid1.Cells[0,i]=userid then
    begin
     result:=true;
     break;
    end;
  end;
end;

procedure TForm_selectuser.BitBtn3Click(Sender: TObject);
var
 i:integer;
begin
if not self.ADS73.IsEmpty then
if dbgrid1.SelectedRows.Count>=1 then
for i:=1 to DBGrid1.SelectedRows.Count do
 begin
  dbgrid1.DataSource.DataSet.Bookmark :=dbgrid1.SelectedRows.Items[i-1];
  if not self.find_userid(ADS73USER_LOGIN_NAME.Value) then
  begin
  stringgrid1.Cells[0,stringgrid1.RowCount-1]:=self.ADS73USER_LOGIN_NAME.Value;
  stringgrid1.Cells[1,stringgrid1.RowCount-1]:=self.ADS73USER_FULL_NAME.Value;
  stringgrid1.Cells[2,stringgrid1.RowCount-1]:=self.ADS73RKEY.AsString;
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
  end;
 end;
end;


end.
