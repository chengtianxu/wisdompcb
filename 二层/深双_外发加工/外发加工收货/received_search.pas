unit received_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls,ComObj,
  Excel2000,ClipBrd;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    wzaq301: TADOQuery;
    DataSource2: TDataSource;
    wzaq301rkey: TAutoIncField;
    wzaq301epiboly_number: TStringField;
    wzaq301STANDARD: TStringField;
    wzaq301ent_data: TDateTimeField;
    wzaq301ABBR_NAME: TStringField;
    wzaq301DEPT_NAME: TStringField;
    wzaq301QUANTITY: TIntegerField;
    wzaq301RECEVIED_QTY: TIntegerField;
    wzaq301short_qty: TIntegerField;
    wzdata304: TADOQuery;
    wzdata304DELIVER_NUMBER: TStringField;
    wzdata304SHIP_DATE: TDateTimeField;
    wzdata304rece_quantity: TIntegerField;
    Button3: TButton;
    StringGrid1: TStringGrid;
    wzaq301UNIT_NAME: TStringField;
    Memo1: TMemo;
    wzdata304RETURN_QTY: TIntegerField;
    wzaq301RETURN_QTY: TIntegerField;
    wzaq301REMARTK: TStringField;
    wzaq301reject_qty: TIntegerField;
    wzdata304reject_qty: TIntegerField;
    wzaq301MANU_PART_NUMBER: TStringField;
    wzaq301MANU_PART_DESC: TStringField;
    wzaq301whouse_name: TStringField;
    wzaq301PCS: TIntegerField;
    wzaq301Allunit_sq: TFloatField;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
   procedure Export_Grid_to_Excel(Grid:TStringgrid;title_caption:string);//导出grid中的数据到excel

  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses data_module, main, term;

{$R *.dfm}

procedure TForm3.Export_Grid_to_Excel(Grid:TStringgrid;title_caption:string);//导出grid中的数据到excel
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
  begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
  end;
  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  for iCount := 0 to Grid.ColCount - 1 do
   Sheet.Cells[1, iCount + 1 ] := Grid.Cells[icount,0];

  for jcount :=1 to Grid.RowCount-1 do
   for iCount := 0 to Grid.ColCount - 1 do
    Sheet.Cells[jCount + 1, iCount + 1] := Grid.Cells[iCount,jcount];

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 if stringgrid1.RowCount>2 then
  self.Export_Grid_to_Excel(stringgrid1,self.caption);
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='外发编号';
  stringgrid1.Cells[1,0]:='供应商';
  stringgrid1.Cells[2,0]:='外发工序';
  stringgrid1.Cells[3,0]:='本厂编号';
  stringgrid1.Cells[4,0]:='客户型号';
  stringgrid1.Cells[5,0]:='规格';
  stringgrid1.Cells[6,0]:='外发时间';
  stringgrid1.Cells[7,0]:='单位';
  stringgrid1.Cells[8,0]:='外发数量';
  stringgrid1.Cells[9,0]:='收货数量';
  stringgrid1.Cells[10,0]:='退货数量';
  Stringgrid1.Cells[11,0]:='PCS数量';
  stringgrid1.Cells[12,0]:='报废数量';
  stringgrid1.Cells[13,0]:='欠货数量';
  stringgrid1.Cells[14,0]:='单个面积';
  stringgrid1.Cells[15,0]:='备注';
  stringgrid1.Cells[16,0]:='工厂名称';
end;

procedure TForm3.Button3Click(Sender: TObject);
var i:integer;
    eip_qty,sou_qty,ret_qty,reject_qty,short_qty,PCS_qty:integer;
begin
 form4:=tform4.Create(application);
 form4.DTPk6.Date:=form1.sys_shortdate;
 form4.DTpk5.Date:=form1.sys_shortdate-20;

 if form4.ShowModal=mrok then
 begin
  if stringgrid1.RowCount>2 then
  begin
   for i:=1 to stringgrid1.RowCount-2 do stringgrid1.Rows[i].Clear;
   stringgrid1.RowCount:=2;
  end;
  with self.wzaq301 do
  begin
   close;
   sql.Clear;
   sql.Text:=memo1.Lines.Text;
   for i:=1 to form4.sgrid1.RowCount-2 do
    sql.Insert(sql.Count-1,form4.SGrid1.Cells[2,i]);
   open;
  end;

  if form4.CheckBox1.Checked then
  begin
   self.StringGrid1.ColCount:=21;
   stringgrid1.Cells[16,0]:='送货单号';
   stringgrid1.Cells[17,0]:='送货日期';
   stringgrid1.Cells[18,0]:='送货数量';
   stringgrid1.Cells[19,0]:='退货数量';
   stringgrid1.Cells[20,0]:='报废数量';
   stringgrid1.ColWidths[16]:=75;
   wzdata304.Open;
  end
  else StringGrid1.ColCount:=15;
  eip_qty:=0;
  sou_qty:=0;
  ret_qty:=0;
  short_qty:=0;
  reject_qty:=0;
  PCS_qty:=0;
  while not self.wzaq301.Eof do
  begin
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=self.wzaq301epiboly_number.Value;
   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=self.wzaq301ABBR_NAME.Value;// '供应商';
   stringgrid1.Cells[2,stringgrid1.RowCount-1]:=self.wzaq301DEPT_NAME.Value; //'外发工序';
   stringgrid1.Cells[3,stringgrid1.RowCount-1]:=self.wzaq301MANU_PART_NUMBER.Value; //'本厂编号';
   stringgrid1.Cells[4,stringgrid1.RowCount-1]:=self.wzaq301MANU_PART_DESC.Value; //'版本';
   stringgrid1.Cells[5,stringgrid1.RowCount-1]:=self.wzaq301STANDARD.Value; //'规格';
   stringgrid1.Cells[6,stringgrid1.RowCount-1]:=self.wzaq301ent_data.AsString; //'外发时间';
   stringgrid1.Cells[7,stringgrid1.RowCount-1]:=self.wzaq301UNIT_NAME.Value; //'单位';
   stringgrid1.Cells[8,stringgrid1.RowCount-1]:=self.wzaq301QUANTITY.AsString; //'外发数量';
   stringgrid1.Cells[9,stringgrid1.RowCount-1]:=self.wzaq301RECEVIED_QTY.AsString; //'收货数量';
   stringgrid1.Cells[10,stringgrid1.RowCount-1]:=self.wzaq301return_qty.AsString; //'退货数量';
   stringgrid1.Cells[11,stringgrid1.RowCount-1]:=self.wzaq301PCS.AsString; //'PCS数量';
   stringgrid1.Cells[12,stringgrid1.RowCount-1]:=self.wzaq301reject_qty.AsString; //'报废数量';
   stringgrid1.Cells[13,stringgrid1.RowCount-1]:=self.wzaq301short_qty.AsString; //'欠货数量';
   stringgrid1.Cells[14,stringgrid1.RowCount-1]:=FloatToStr(self.wzaq301Allunit_sq.Value);//单个外发面积;
   stringgrid1.Cells[15,stringgrid1.RowCount-1]:=self.wzaq301REMARTK.Value;//备注;
   stringgrid1.Cells[16,stringgrid1.RowCount-1]:=self.wzaq301whouse_name.Value;//工厂;
   eip_qty:=eip_qty + wzaq301QUANTITY.Value;
   sou_qty:=sou_qty + wzaq301RECEVIED_QTY.Value;
   ret_qty:=ret_qty + wzaq301RETURN_QTY.Value;
   reject_qty:=reject_qty + wzaq301reject_qty.Value;
   short_qty:=short_qty + wzaq301short_qty.Value;
   PCS_qty:=PCS_qty+wzaq301PCS.Value;
   if (form4.CheckBox1.Checked) and (not wzdata304.IsEmpty) then
   begin
    while not wzdata304.Eof do
    begin
     if wzdata304.RecNo>1 then
     begin
      stringgrid1.Cells[0,stringgrid1.RowCount-1]:=self.wzaq301epiboly_number.Value;
      stringgrid1.Cells[1,stringgrid1.RowCount-1]:=self.wzaq301ABBR_NAME.Value;// '供应商';
      stringgrid1.Cells[2,stringgrid1.RowCount-1]:=self.wzaq301DEPT_NAME.Value; //'外发工序';
      stringgrid1.Cells[3,stringgrid1.RowCount-1]:=self.wzaq301MANU_PART_NUMBER.Value; //'本厂编号';
      stringgrid1.Cells[4,stringgrid1.RowCount-1]:=self.wzaq301MANU_PART_DESC.Value; //'版本';
      stringgrid1.Cells[5,stringgrid1.RowCount-1]:=self.wzaq301STANDARD.Value; //'规格';
      stringgrid1.Cells[6,stringgrid1.RowCount-1]:=self.wzaq301ent_data.AsString; //'外发时间';
      stringgrid1.Cells[7,stringgrid1.RowCount-1]:=self.wzaq301UNIT_NAME.Value; //'单位';
     end;
     stringgrid1.Cells[16,stringgrid1.RowCount-1]:=wzdata304DELIVER_NUMBER.Value;   //'送货单号';
     StringGrid1.Cells[17,stringgrid1.RowCount-1]:=wzdata304SHIP_DATE.AsString;     //'送货日期';
     //StringGrid1.Cells[17,stringgrid1.RowCount-1]:=self.wzaq301SHIP_DATE.AsString;     //'送货日期';
     stringgrid1.Cells[18,stringgrid1.RowCount-1]:=wzdata304rece_quantity.AsString; //'送货数量';
     stringgrid1.Cells[19,stringgrid1.RowCount-1]:=wzdata304RETURN_QTY.AsString;    //'退货数量';
     stringgrid1.Cells[20,stringgrid1.RowCount-1]:=wzdata304reject_qty.AsString;    //'报废数量';
     stringgrid1.RowCount:=stringgrid1.RowCount+1;
     wzdata304.Next;
    end;
   end
   else stringgrid1.RowCount:=stringgrid1.RowCount+1;
   wzaq301.Next;
  end;
  stringgrid1.Rows[stringgrid1.RowCount-1].Clear;
  //显示合计
  stringgrid1.Cells[7,stringgrid1.RowCount-1]:='合计';
  stringgrid1.Cells[8,stringgrid1.RowCount-1]:=inttostr(eip_qty); //'外发数量';
  stringgrid1.Cells[9,stringgrid1.RowCount-1]:=inttostr(sou_qty);//'收货数量';
  stringgrid1.Cells[10,stringgrid1.RowCount-1]:=inttostr(ret_qty);//'退货数量';
  stringgrid1.Cells[11,stringgrid1.RowCount-1]:=inttostr(PCS_qty);//'PCS数量';
  stringgrid1.Cells[12,stringgrid1.RowCount-1]:=inttostr(reject_qty);//'报废数量';
  stringgrid1.Cells[13,stringgrid1.RowCount-1]:=inttostr(short_qty);//'欠货数量';
 end;
 self.wzaq301.Close;
 form4.Free;
end;

procedure TForm3.StringGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(self.wzaq301.SQL.Text);
end;

end.
