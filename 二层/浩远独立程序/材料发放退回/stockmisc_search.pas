unit stockmisc_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TForm_miscstock = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    aq235: TADODataSet;
    aq235goods_name: TStringField;
    aq235goods_guige: TStringField;
    aq235goods_type: TStringField;
    aq235UNIT_NAME: TStringField;
    aq235LOCATION: TStringField;
    aq235QUAN_ON_HAND: TBCDField;
    aq235rohs: TStringField;
    aq235REF_NUMBER: TStringField;
    aq235ABBR_NAME: TStringField;
    aq235RKEY: TAutoIncField;
    DataSource1: TDataSource;
    Label2: TLabel;
    ComboBox1: TComboBox;
    aq235warehouse_ptr: TIntegerField;
    aq235PO_NUMBER: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   field_name:string;
   whouse_ptr:Tstringlist;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_miscstock: TForm_miscstock;

implementation

uses damo, purout_invt, putoutmisc_dept;

{$R *.dfm}

procedure TForm_miscstock.NewGridWnd(var Message: TMessage);
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

procedure TForm_miscstock.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  aq235.Filter:='warehouse_ptr='+whouse_ptr.Strings[combobox1.itemindex]+
  ' and '+field_name+ ' LIKE ''%'+TRIM(EDIT1.TEXT)+'%'''
 ELSE
  aq235.FILTER:='warehouse_ptr='+whouse_ptr.Strings[combobox1.itemindex];


end;

procedure TForm_miscstock.FormActivate(Sender: TObject);
begin
self.field_name:='goods_name';
end;

procedure TForm_miscstock.DBGrid1DblClick(Sender: TObject);
begin
if not self.aq235.IsEmpty then
 button1.OnClick(sender);
end;

procedure TForm_miscstock.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (not self.aq235.IsEmpty) and (key=13) then
 button1.OnClick(sender);
end;

procedure TForm_miscstock.DBGrid1TitleClick(Column: TColumn);
var
 i:word;
begin
if self.aq235.IndexFieldNames<>column.FieldName then
 aq235.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;
procedure TForm_miscstock.Button1Click(Sender: TObject);
begin
try
 form_putout:=tform_putout.Create(application);
 with form_putout do
  begin
   edit1.Text:=self.aq235QUAN_ON_HAND.AsString;
   edit2.Text:=self.aq235UNIT_NAME.Value;
   edit3.Text:=self.aq235QUAN_ON_HAND.AsString;
  end;
 if form_putout.ShowModal=mrok then
  begin
   with form3 do
    begin
     sgrid1.Cells[0,sgrid1.RowCount-1]:=self.aq235goods_name.Value;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=self.aq235goods_guige.Value;
     sgrid1.Cells[2,sgrid1.RowCount-1]:=self.aq235goods_type.Value;
     sgrid1.Cells[3,sgrid1.RowCount-1]:=self.aq235rohs.Value;
     sgrid1.Cells[4,sgrid1.RowCount-1]:=self.aq235unit_name.Value;
     sgrid1.Cells[5,sgrid1.RowCount-1]:=form_putout.Edit3.Text;
     sgrid2.Cells[0,sgrid2.RowCount-1]:=self.aq235rkey.AsString;
     sgrid1.RowCount:=sgrid1.RowCount+1;
     sgrid2.RowCount:=sgrid2.RowCount+1;
    end;
   self.aq235.Delete;
  end;
finally
 form_putout.Free;
end;
end;

procedure TForm_miscstock.FormCreate(Sender: TObject);
begin
 whouse_ptr:=tstringlist.Create;
 combobox1.OnChange := nil;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select rkey,ABBR_NAME from data0015 order by rkey';
   open;
   while not eof do
    begin
     combobox1.Items.Add(fieldbyname('ABBR_NAME').AsString);
     whouse_ptr.Add(fieldbyname('rkey').AsString);
     next;
    end;
  end;
 combobox1.OnChange := Edit1Change;
 
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm_miscstock.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if aq235.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
