unit onlineuser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ADODB, Menus;

type
  TForm_onlineuser = class(TForm)
    ADS73: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADS73RKEY: TAutoIncField;
    ADS73USER_FULL_NAME: TStringField;
    ADS73USER_LOGIN_NAME: TStringField;
    ADS73NETWORK_ID: TStringField;
    ADS73COMPUTER: TStringField;
    ADS73LOGIN_IN_TIME: TDateTimeField;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure ADS73AfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);       
  public
    { Public declarations }
  end;

var
  Form_onlineuser: TForm_onlineuser;

implementation

uses damo;

{$R *.dfm}

procedure TForm_onlineuser.Button2Click(Sender: TObject);
begin
self.ADS73.close;
self.ADS73.Open;
end;

procedure TForm_onlineuser.ADS73AfterOpen(DataSet: TDataSet);
begin
edit2.Text:=inttostr(self.ADS73.RecordCount);
end;

procedure TForm_onlineuser.FormCreate(Sender: TObject);
begin
 self.ADS73.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd; 
end;

procedure TForm_onlineuser.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  ADs73.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs73.filter := '';
end;

procedure TForm_onlineuser.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> ADs73.IndexFieldNames) then
 ADs73.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
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

procedure TForm_onlineuser.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ads73.CommandText);
end;

procedure TForm_onlineuser.Button1Click(Sender: TObject);
begin
if messagedlg('确认要弹出该用户吗?'+self.ADS73USER_FULL_NAME.Value,
 mtconfirmation,[mbYes,mbNo],0)=mrYes then
begin
 self.ADS73.Edit;
 self.ADS73COMPUTER.Value:='';
 self.ADS73NETWORK_ID.Value:='';
 self.ADS73LOGIN_IN_TIME.AsVariant:=null;
 self.ADS73.Post;
 self.ADS73.Close;
 self.ADS73.Open;
end;
end;

procedure TForm_onlineuser.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if dm.AQ_EXEC.Filter<>'' then dm.AQ_EXEC.Filter:='';
if dm.AQ_EXEC.Locate('PROGRAME','WZPR73.EXE',[]) then
if (self.ADS73.IsEmpty) then
 begin
  n1.Enabled:=false;
  button1.Enabled:=false;
 end
else
 begin
  n1.Enabled:=true;
  button1.Enabled:=true;
 end
else
 begin
  n1.Enabled:=false;
  button1.Enabled:=false;
 end;
end;

procedure TForm_onlineuser.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

end.
