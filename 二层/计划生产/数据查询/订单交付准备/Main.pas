unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  Excel2000, OleServer, Menus,ComObj, ComCtrls,ClipBrd;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Edit9: TEdit;
    //user_ptr: TLabel;
    //db_ptr: TLabel;
    //vpass: TLabel;
    //vprev: TLabel;
    SpeedButton4: TSpeedButton;
    Edit3: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    PopupMenu1: TPopupMenu;
    SpeedButton2: TSpeedButton;
    N6: TMenuItem;
    Label6: TLabel;
    Edit6: TEdit;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    RadioGroup2: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    ADOQuery1: TADOStoredProc;
    ADOQuery3: TADOStoredProc;
    ADOQuery4: TADOStoredProc;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    DateTimePicker2: TDateTimePicker;
    CheckBox2: TCheckBox;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1sales_order: TStringField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1customer_part_number: TStringField;
    ADOQuery1orig_request_date: TDateTimeField;
    ADOQuery1orig_sched_ship_date: TDateTimeField;
    ADOQuery1sch_date: TDateTimeField;
    ADOQuery1parts_ordered: TFloatField;
    ADOQuery1parts_shipped: TFloatField;
    ADOQuery1parts_returned: TFloatField;
    ADOQuery1curr_code: TStringField;
    ADOQuery1part_price: TFloatField;
    ADOQuery1exch_rate: TFloatField;
    ADOQuery1issued_qty: TIntegerField;
    ADOQuery1cust_part_ptr: TIntegerField;
    ADOQuery1customer_part_desc: TStringField;
    ADOQuery1po_number: TStringField;
    ADOQuery1cut_no: TStringField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1parent_ptr: TIntegerField;
    ADOQuery1parameter_value: TFloatField;
    ADOQuery1status: TWordField;
    ADOQuery1wip_qty: TFloatField;
    ADOQuery1diff_qty: TIntegerField;
    ADOQuery1cstatus: TStringField;
    ADOQuery1RETURNED_SHIP: TIntegerField;
    ADOQuery1QTY_ON_HAND: TIntegerField;
    procedure Edit9Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure RadioGroup1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    vlen:integer;
    varray:array of integer;
    newrow,newcol:integer;
    hMapFile: THandle;
    MapFilePointer: Pointer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  curr:integer;
implementation

uses ProgressBar,common;

{$R *.dfm}

procedure TFrmMain.Edit9Change(Sender: TObject);
begin
if checkbox1.Checked then
if trim(edit6.text)<>'' then
 if trim(edit3.text)<>'' then
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'''
 else
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'''
else
 if trim(edit3.text)<>'' then
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'''
 else
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :=''
else
if trim(edit6.text)<>'' then
 if trim(edit3.text)<>'' then
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_desc like ''%'+trim(edit3.Text)+'%'''
 else
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='sales_order like '''+trim(edit6.Text)+'%'''
else
 if trim(edit3.text)<>'' then
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'' and customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='customer_part_desc like ''%'+trim(edit3.Text)+'%'''
 else
  if trim(edit9.text)<>'' then
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='customer_part_number like '''+trim(edit9.Text)+'%'' and cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='customer_part_number like '''+trim(edit9.Text)+'%'''
  else
    if trim(edit2.text)<>'' then
      ADOQuery1.Filter :='cust_code like '''+trim(edit2.text)+'%'''
    else
      ADOQuery1.Filter :='';
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
S: string;
begin
  {hMapFile := CreateFileMapping ($FFFFFFFF,
    nil, page_ReadWrite, 0,100, 'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0);
  S := PChar (MapFilePointer);
  vpass.Caption := trim(copy(S,1,2));
  user_ptr.Caption := trim(copy(S,3,pos(' ',s)-2));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));
   {}
  if not App_Init(ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;

  //user_ptrCaption := user_ptr;
  //vprevCaption := vprev;

  DateSeparator := '-';
  shortDateFormat := 'yyyy-MM-dd';
  longtimeFormat := 'hh:nn';
//  vprev :='1';
  if (vprev = '1') or (vprev ='2') then
    curr:=0
   else
    curr:=3;


  with stringgrid1 do
  begin
    stringgrid1.ColCount := colcount+curr;
    cells[0,0]:='序';
    cells[1,0]:='客户';
    cells[2,0]:='本厂编号';
    cells[3,0]:='版本';
    cells[4,0]:='P/O编号';
    cells[5,0]:='订单编号';
    cells[6,0]:='订单状态';
    cells[7,0]:='计划装运期';
    cells[8,0]:='回复装运期';
    if curr=3 then
    begin
    cells[9,0]:='币  种';
    cells[10,0]:='单  价';
    cells[11,0]:='汇  率';
    end;
    cells[9+curr,0]:='订货数量';
    cells[10+curr,0]:='已投产数量';
    cells[11+curr,0]:='已交数量';
    cells[12+curr,0]:='退货数量';
    cells[13+curr,0]:='订单差数';
    cells[14+curr,0]:='成品数量';
    cells[15+curr,0]:='部件型号';
    cells[16+curr,0]:='在制数量';
    cells[17+curr,0]:='PNLS-外';
    cells[18+curr,0]:='PNLS-内';
    cells[19+curr,0]:='配料单号';
    cells[20+curr,0]:='客户简称';
    cells[21+curr,0]:='客户型号';
    cells[22+curr,0]:='客户交期';

    ColWidths[3] := -1;
  end;

end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
if not Adoconnection1.Connected then
  application.Terminate ;
  {
  if not Adoconnection1.Connected then
      begin
          if (vpass.Caption<>'AA') OR
          (trim(vprev.Caption)='') then
              close;
          Adoconnection1.ConnectionString :=db_ptr.Caption ;
          Adoconnection1.Connected :=true;
      end;
  {}

  setlength(varray,1);
  varray[0]:=0;
  Datetimepicker1.DateTime :=now;
  Datetimepicker2.DateTime :=now+30;
//  SpeedButton2Click(sender);
end;

procedure TFrmMain.SpeedButton4Click(Sender: TObject);
var
  asheet:Variant;
  i,j:integer;
  tslist:tstringlist;
  vstr:string;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗?',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  try
  asheet:=CreateOleObject( 'Excel.Application' );
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  try
    screen.Cursor := crHourGlass;
  asheet.Workbooks.Add;
  asheet.WorkSheets[1].Activate;
  asheet.activeSheet.Name :='订单交付准备';
  tslist:=tstringlist.Create;

  for j:=0 to stringgrid1.RowCount -1  do
   begin
    for i:=0 to stringgrid1.ColCount -1  do
        vstr:=vstr+#9+stringgrid1.cells[i,j] ;
    tslist.add(vstr);
    vstr:='';
   end;

    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
    asheet.activeSheet.paste;
    tslist.Clear;
   tslist.free;
   asheet.visible:=true;

   finally

  screen.Cursor := crDefault;
     end;
end;


procedure TFrmMain.SpeedButton2Click(Sender: TObject);
var vqty1,vqty2:real;
  vso:string;
begin
  with Adoquery1 do
  begin
    close;
    parameters.ParamByName('@vdate1').Value :=datetostr(datetimepicker1.Date);
    parameters.ParamByName('@vdate2').Value :=datetostr(datetimepicker2.Date);
    if checkbox2.Checked then
     parameters.ParamByName('@vprod_rel').Value :=1
    else
     parameters.ParamByName('@vprod_rel').Value :=0;
    open;
  end;
  with Adoquery3 do
  begin
    close;
    parameters.ParamByName('@vdate1').Value :=datetostr(datetimepicker1.Date);
    parameters.ParamByName('@vdate2').Value :=datetostr(datetimepicker2.Date);
    if checkbox2.Checked then
     parameters.ParamByName('@vprod_rel').Value :=1
    else
     parameters.ParamByName('@vprod_rel').Value :=0;
    open;
  end;
  with Adoquery4 do
  begin
    close;
    parameters.ParamByName('@vdate1').Value :=datetostr(datetimepicker1.Date);
    parameters.ParamByName('@vdate2').Value :=datetostr(datetimepicker2.Date);
    if checkbox2.Checked then
     parameters.ParamByName('@vprod_rel').Value :=1
    else
     parameters.ParamByName('@vprod_rel').Value :=0;
    open;
  end;
  newrow:=1;
  newcol:=4;
  Stringgrid1.ColCount :=23+curr+FrmMain.Adoquery3.RecordCount;
  Adoquery3.First;
  with Adoquery3 do
  while not eof do
  begin
    Stringgrid1.cells[23+curr+FrmMain.Adoquery3.RecNo-1,0]:=Fieldbyname('dept_code').AsString;
    next;
  end;
  vqty1:=0;
  vqty2:=0;
  vso:='***';
  Adoquery1.First;
  Stringgrid1.RowCount :=2;
  stringgrid1.Rows[stringgrid1.RowCount-1].Text :='';
  vlen:=0;
  with Adoquery1 do
  while not eof do
  begin

   //if trim(Fieldbyname('cut_no').AsString) = 'B0012170-0' then
           //showmessage(Fieldbyname('cut_no').AsString );

    if Radiogroup2.ItemIndex=0 then
      if (Adoquery1.FieldByName('status').AsInteger<>3) and
        (Adoquery1.FieldByName('status').AsInteger<>4) then
      if (Adoquery1.FieldByName('diff_qty').AsInteger>0) then
      begin
        next;
        continue;
      end;
    if Radiogroup2.ItemIndex=1 then
      if (Adoquery1.FieldByName('status').AsInteger<>1) or
      (Adoquery1.FieldByName('qty_on_hand').AsInteger-Adoquery1.FieldByName('diff_qty').AsInteger<0) then
      begin
        next;
        continue;
      end;
    if Radiogroup2.ItemIndex=2 then
      if (Adoquery1.FieldByName('status').AsInteger<>1) or
      (Adoquery1.FieldByName('qty_on_hand').AsInteger-Adoquery1.FieldByName('diff_qty').AsInteger>=0) then
      begin
        next;
        continue;
      end;
    if Radiogroup2.ItemIndex=3 then
      if (Adoquery1.FieldByName('status').AsInteger<>1) or
      (Adoquery1.FieldByName('diff_qty').AsInteger=0) then
      begin
        next;
        continue;
      end;
    setlength(varray,vlen+1);
    vlen:=vlen+1;
    if Adoquery1.FieldByName('qty_on_hand').AsInteger-Adoquery1.FieldByName('diff_qty').AsInteger>=0 then
      varray[vlen-1]:=1
    else
    if Adoquery1.fieldbyname('orig_sched_ship_date').AsDateTime<=now then
        varray[vlen-1]:=3
    else
    if Adoquery1.fieldbyname('orig_sched_ship_date').AsDateTime<=4+now then
        varray[vlen-1]:=2
    else
      varray[vlen-1]:=0;
    Stringgrid1.RowCount :=Stringgrid1.RowCount+1;
    stringgrid1.Rows[stringgrid1.RowCount-1].Text :='';
    with stringgrid1 do
    begin
      cells[0,Stringgrid1.RowCount-2]:=inttostr(Stringgrid1.RowCount-2);
      if Adoquery1.fieldbyname('sales_order').AsString<>vso then
      begin
        cells[1,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('cust_code').asstring;
        cells[2,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('customer_part_number').asstring;
        //cells[3,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('cp_rev').asstring;
        cells[4,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('PO_NUMBER').asstring;;
        cells[5,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('sales_order').asstring;;
        cells[6,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('cstatus').asstring;
        cells[7,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('orig_sched_ship_date').asstring;
        cells[8,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('sch_date').asstring;
        if curr=3 then
        begin
        cells[9,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('curr_code').asstring;
        cells[10,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('part_price').asstring;
        cells[11,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('exch_rate').asstring;
        end;
        cells[9+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('parts_ordered').asstring;
        cells[10+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('issued_qty').asstring;
        cells[11+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('parts_shipped').asstring;
        cells[12+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('parts_returned').asstring;
        cells[13+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('diff_qty').asstring;
        cells[14+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('QTY_ON_Hand').asstring;
        vso:=Adoquery1.fieldbyname('sales_order').AsString;
      end;

      cells[15+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('manu_part_number').asstring;
      cells[16+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('wip_qty').asstring;
      if Adoquery1.fieldbyname('parent_ptr').asInteger=0 then
        if Adoquery1.fieldbyname('parameter_value').asInteger>0 then
        begin
          cells[17+curr,Stringgrid1.RowCount-2]:=Floattostr(int(Adoquery1.fieldbyname('wip_qty').asInteger/Adoquery1.fieldbyname('parameter_value').asInteger));
          vqty1:=vqty1+int(Adoquery1.fieldbyname('wip_qty').asInteger/Adoquery1.fieldbyname('parameter_value').asInteger);
        end else
          cells[17+curr,Stringgrid1.RowCount-2]:='-'
      else
      if Adoquery1.fieldbyname('parent_ptr').asInteger>0 then
        if Adoquery1.fieldbyname('parameter_value').asInteger>0 then
        begin
          cells[18+curr,Stringgrid1.RowCount-2]:=Floattostr(int(Adoquery1.fieldbyname('wip_qty').asInteger/Adoquery1.fieldbyname('parameter_value').asInteger));
          vqty2:=vqty2+int(Adoquery1.fieldbyname('wip_qty').asInteger/Adoquery1.fieldbyname('parameter_value').asInteger);
        end else
          cells[18+curr,Stringgrid1.RowCount-2]:='-';
      cells[19+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('cut_no').asstring;
      cells[20+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('abbr_name').asstring;
      cells[21+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('customer_part_desc').asstring;
      cells[22+curr,Stringgrid1.RowCount-2]:=Adoquery1.fieldbyname('orig_request_date').asstring;
    end;



    if Adoquery4.Locate('cut_no',Fieldbyname('cut_no').AsString ,[]) then
    with Adoquery4 do
    while Adoquery4.fieldbyname('cut_no').AsString=Adoquery1.fieldbyname('cut_no').AsString do
    begin

      //showmessage(Adoquery1.fieldbyname('parameter_value').AsString );
      if Adoquery3.Locate('rkey',Adoquery4.fieldbyname('d0034_rkey').AsInteger,[]) then
        if Adoquery1.fieldbyname('parameter_value').AsFloat<> 0 then
            begin
                //showmessage('a'+' ' + Adoquery4.fieldbyname('d0034_rkey').AsString +'  '+Adoquery4.fieldbyname('cut_no').AsString);
                //stringgrid1.Cells[23+curr+FrmMain.Adoquery3.RecNo-1,stringgrid1.RowCount-2]:=floattostr(round(Adoquery4.fieldbyname('qty').AsInteger/Adoquery1.fieldbyname('parameter_value').asInteger));
                //showmessage(floattostr(round(Adoquery4.fieldbyname('qty').AsInteger*Adoquery1.fieldbyname('parameter_value').AsFloat )));

                stringgrid1.Cells[23+curr+FrmMain.Adoquery3.RecNo-1,stringgrid1.RowCount-2]:=FormatFloat('#0.####',Adoquery4.fieldbyname('qty').AsInteger*Adoquery1.fieldbyname('parameter_value').AsFloat);//floattostr((Adoquery4.fieldbyname('qty').AsInteger*Adoquery1.fieldbyname('parameter_value').AsFloat ));
            end;
      next;
      IF eof then break;
    end;
    next;
  end;
  stringgrid1.Rows[stringgrid1.RowCount-1].Text :='';
  stringgrid1.cells[1,Stringgrid1.RowCount-1]:='合计';
  stringgrid1.cells[17+curr,Stringgrid1.RowCount-1]:=floattostr(vqty1);
  stringgrid1.cells[18+curr,Stringgrid1.RowCount-1]:=floattostr(vqty2);
end;

procedure TFrmMain.ADOQuery1CalcFields(DataSet: TDataSet);
begin
  Adoquery1.FieldByName('diff_qty').asinteger :=
    Adoquery1.FieldByName('parts_ordered').asinteger
    -Adoquery1.FieldByName('parts_shipped').asinteger
    +Adoquery1.FieldByName('parts_returned').asinteger;
  if Adoquery1.FieldByName('diff_qty').asinteger<0 then
      Adoquery1.FieldByName('diff_qty').asinteger :=0;
 case adoquery1.FieldValues['status'] of
  1: adoquery1.FieldValues['cstatus']:='有效的';
  2: adoquery1.FieldValues['cstatus']:='暂缓';
  3: adoquery1.FieldValues['cstatus']:='已关闭';
  4: adoquery1.FieldValues['cstatus']:='已完成';
  5: adoquery1.FieldValues['cstatus']:='已取消';
  6: adoquery1.FieldValues['cstatus']:='未提交';
 end;

end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
  with Adoquery1 do
  begin
    close;
    parameters.ParamByName('@vindex').Value := Radiogroup1.ItemIndex;
    open;
  end;
  SpeedButton2Click(sender);
end;

procedure TFrmMain.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if arow=0 then exit;
  if varray[arow-1]=1 then
  begin
    stringgrid1.Canvas.Brush.Color := clAqua;
    stringgrid1.Canvas.FillRect(rect);
    Stringgrid1.Canvas.TextRect(rect,rect.left+2,
        rect.Top+2, trim(Stringgrid1.Cells[aCol,aRow]))
  end else
  if varray[arow-1]=2 then
  begin
    stringgrid1.Canvas.Font.Color := clBlue;
    Stringgrid1.Canvas.TextRect(rect,rect.left+2,
        rect.Top+2, trim(Stringgrid1.Cells[aCol,aRow]))
  end else
  if varray[arow-1]=3 then
  begin
    stringgrid1.Canvas.Font.Color := clFuchsia;
    Stringgrid1.Canvas.TextRect(rect,rect.left+2,
        rect.Top+2, trim(Stringgrid1.Cells[aCol,aRow]))
  end;
  If ((acol<>15) and (acol>8) and (acol<19)) or (acol>21) then
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(trim(Stringgrid1.Cells[aCol,aRow]))-2,
        rect.Top+2, trim(Stringgrid1.Cells[aCol,aRow]));

  if arow=newrow then
   begin
    if acol=newcol then
      begin
       stringgrid1.Canvas.Brush.Color := clred;
       stringgrid1.Canvas.FrameRect(rect);
      end
    else
      begin
       stringgrid1.Canvas.Brush.Color := clblue;
       stringgrid1.Canvas.FrameRect(rect);
      end;
   end;
end;

procedure TFrmMain.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 newrow:=arow;
 newcol:=acol;
 stringgrid1.Refresh;
end;

end.
