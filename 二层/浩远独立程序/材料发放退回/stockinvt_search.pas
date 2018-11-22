unit stockinvt_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids;

type
  TForm_stocksearch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    aq22: TADODataSet;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    aq22INV_PART_NUMBER: TStringField;
    aq22INV_NAME: TStringField;
    aq22INV_DESCRIPTION: TStringField;
    aq22LOCATION: TStringField;
    aq22UNIT_NAME: TStringField;
    aq22QUAN_ON_HAND: TBCDField;
    aq22EXPIRE_DATE: TDateTimeField;
    aq22rohs: TStringField;
    aq22ABBR_NAME: TStringField;
    aq22SUPPLIER2: TStringField;
    aq22STD_COST: TFloatField;
    aq22INVENTORY_PTR: TIntegerField;
    aq22RKEY: TAutoIncField;
    Edit1: TEdit;
    Label1: TLabel;
    aq22barcode_id: TStringField;
    ComboBox1: TComboBox;
    Label2: TLabel;
    aq22warehouse_ptr: TIntegerField;
    procedure Edit1Change(Sender: TObject);
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
    parent_flag:byte; 
  end;

var
  Form_stocksearch: TForm_stocksearch;

implementation

uses damo, purout_invt,putoutinvt_dept, main, putoutinvt_inspect;

{$R *.dfm}

procedure TForm_stocksearch.NewGridWnd(var Message: TMessage);
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

procedure TForm_stocksearch.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text) <> '' then
  aq22.Filter:='warehouse_ptr='+whouse_ptr.Strings[combobox1.itemindex]+
  ' and '+field_name+ ' LIKE ''%'+TRIM(EDIT1.TEXT)+'%'''
 ELSE
  aq22.FILTER:='warehouse_ptr='+whouse_ptr.Strings[combobox1.itemindex];
end;

procedure TForm_stocksearch.DBGrid1DblClick(Sender: TObject);
begin
if not self.aq22.IsEmpty then
 button1.OnClick(sender);
end;

procedure TForm_stocksearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(aq22.CommandText);

if (not self.aq22.IsEmpty) and (key=13) then
 button1.OnClick(sender);
end;

procedure TForm_stocksearch.DBGrid1TitleClick(Column: TColumn);
var
 i:word;
begin
if self.aq22.IndexFieldNames<>column.FieldName then
 aq22.IndexFieldNames:=column.FieldName;
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

procedure TForm_stocksearch.Button1Click(Sender: TObject);
begin
  with DM.TempDataSet do
  begin
    Close;
    Clone(aq22);                                             //对当前的aq22的数据进行复制并过滤
    Filter:='INV_PART_NUMBER='+QuotedStr(Trim(aq22.FieldByName('INV_PART_NUMBER').AsString));
    Filtered:=True;

    First;
    while not Eof do
    begin            //   如果在复制的数据中有有效期小于 aq22的记录 ，给予提示
      if (FieldByName('EXPIRE_DATE').AsDateTime<aq22.FieldByName('EXPIRE_DATE').AsDateTime) and (aq22.FieldByName('EXPIRE_DATE').AsDateTime>0) then
      begin
        if messagedlg('还有比当前有效期更早的库存记录，你确定要继续吗?',mtconfirmation,[mbyes,mbno],1)=mrNO then
        begin
          Exit;
        end
        else
          Break;
      end;
      Next;
    end;
    Close;
  end;

  try
    form_putout:=tform_putout.Create(application);
    with form_putout do
    begin
      edit1.Text:=self.aq22QUAN_ON_HAND.AsString;
      edit2.Text:=self.aq22UNIT_NAME.Value;
      edit3.Text:=self.aq22QUAN_ON_HAND.AsString;
    end;
    if form_putout.ShowModal=mrok then
    begin


      if self.parent_flag=0 then
        if (aq22EXPIRE_DATE.Value>=form1.sys_sortdate) or  (aq22EXPIRE_DATE.Value=0) then
        with form2 do
        begin
          sgrid1.Cells[0,sgrid1.RowCount-1]:=self.aq22INV_PART_NUMBER.Value;
          sgrid1.Cells[1,sgrid1.RowCount-1]:=self.aq22INV_NAME.Value;
          sgrid1.Cells[2,sgrid1.RowCount-1]:=self.aq22INV_DESCRIPTION.Value;
          sgrid1.Cells[3,sgrid1.RowCount-1]:=self.aq22rohs.Value;
          sgrid1.Cells[4,sgrid1.RowCount-1]:=self.aq22unit_name.Value;
          sgrid1.Cells[5,sgrid1.RowCount-1]:=form_putout.Edit3.Text;
          sgrid2.Cells[0,sgrid2.RowCount-1]:=self.aq22INVENTORY_PTR.AsString;
          sgrid2.Cells[1,sgrid2.RowCount-1]:=self.aq22RKEY.AsString;
          sgrid2.Cells[2,sgrid2.RowCount-1]:=self.aq22STD_COST.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;
          self.aq22.Delete;
        end
        else
          messagedlg('对不起,该批物料有效期已过,请发料到来料检查后重新确定有效期!!!',mterror,[mbcancel],0)
      else
      with form4 do
      begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=self.aq22INV_PART_NUMBER.Value;
        sgrid1.Cells[1,sgrid1.RowCount-1]:=self.aq22INV_NAME.Value;
        sgrid1.Cells[2,sgrid1.RowCount-1]:=self.aq22INV_DESCRIPTION.Value;
        sgrid1.Cells[3,sgrid1.RowCount-1]:=self.aq22rohs.Value;
        sgrid1.Cells[4,sgrid1.RowCount-1]:=self.aq22unit_name.Value;
        sgrid1.Cells[5,sgrid1.RowCount-1]:=form_putout.Edit3.Text;
        sgrid2.Cells[0,sgrid2.RowCount-1]:=self.aq22RKEY.AsString;
        sgrid2.Cells[1,sgrid2.RowCount-1]:=self.aq22INVENTORY_PTR.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
        self.aq22.Delete;
      end;
    end;
  finally
    form_putout.Free;
  end
end;

procedure TForm_stocksearch.FormCreate(Sender: TObject);
begin
  field_name:='INV_PART_NUMBER';
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

procedure TForm_stocksearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if aq22.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
